import 'dart:convert';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as logDev;

class Data with ChangeNotifier{

  final day = 'monthly';
  // ['daily-today', 'daily-yesterday', 'daily-tomorrow', 'weekly', 'monthly'];
  final sign = 12;

  Bs4Element? _horoscope;
  bool _error = false;
  String _errorMessage = '';

  Bs4Element? get horoscope => _horoscope;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await http.get(
      Uri.parse('https://www.horoscope.com/us/horoscopes/general/horoscope-general-$day.aspx?sign=$sign'),
    );

    if (response.statusCode == 200) {
      try {
        BeautifulSoup bs = BeautifulSoup(response.body);
        _horoscope = bs.find('p');
        _error = false;
        logDev.log('$day: $_horoscope');

      }catch (e) {
        _error = true;
        _errorMessage = e.toString();
      }
    }else{
      _error = true;
      _errorMessage = 'Check internet connection';
    }
    notifyListeners();
  }
  void initialValues() {
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}