import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier{

  Bs4Element? _horoscope;
  bool _error = false;
  String _errorMessage = '';

  Bs4Element? get horoscope => _horoscope;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  var day = 'daily-today';
  var sign = 12;
  String image = '';
  Color color = Colors.white;

  void setDate(String date) {
    day = date;
    fetchData;
    notifyListeners();
  }

  void frameImage() {
    if (sign == 1 || sign == 5 || sign == 9) {
      image = 'red';
      color = const Color(0xffe80016);
    }
    if (sign == 2 || sign == 6 || sign == 10) {
      image = 'green';
      color = const Color(0xff38ae77);
    }
    if (sign == 3 || sign == 7 || sign == 11) {
      image = 'black';
      color = const Color(0xfff8e3ba);
    }
    if (sign == 4 || sign == 8 || sign == 12) {
      image = 'blue';
      color = const Color(0xff00b5cb);
    }
  }

  Future<void> get fetchData async {
    final response = await http.get(
      Uri.parse('https://www.horoscope.com/us/horoscopes/general/horoscope-general-$day.aspx?sign=$sign'),
    );

    if (response.statusCode == 200) {
      try {
        BeautifulSoup bs = BeautifulSoup(response.body);
        _horoscope = bs.find('p');
        _error = false;
        // logDev.log('$day: $_horoscope');

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
    _horoscope = null;
    notifyListeners();
  }
}