import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const day = 'monthly';
// ['daily-today', 'daily-yesterday', 'daily-tomorrow', 'weekly', 'monthly'];
var sign = 12;

class Data with ChangeNotifier{

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