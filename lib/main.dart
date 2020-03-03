import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_calculator/Screens/calculator.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<Display>(
        create: (context) => Display(),
        child: Calculator(),
      ),
    );
  }
}

class Display extends ChangeNotifier {
  String _displayText = '0';
  String _secondDisplayText = '';

  var _temp, _tempTwo = '', operation = '+', _varOne, _varTwo, _result = 0.0;

  getDisplay() => _displayText;

  getSecondaryDisplay() => _secondDisplayText;

  //getTempHolder() => _tempHolder;

  appendDisplay(String displayText) {
    if (displayText != operation) _tempTwo = _tempTwo + displayText;

    if (_displayText == '0') {
      _secondDisplayText = displayText;
      //_tempHolder = displayText;
      _displayText = '=' + displayText;
    } else {
      _secondDisplayText = _secondDisplayText + displayText;
      _displayText = _displayText + displayText;
    }

    notifyListeners();
  }

  updateDisplay(String displayText) {
    displayText == '' ? _displayText = '0' : _displayText = displayText;
    _secondDisplayText = '';

    // if(displayText == ''){
    //   _displayText = '0';
    //   _secondDisplayText = '';
    // }
    // else {
    //   _tempHolder = displayText;
    //   _displayText = '=' + displayText;
    //   //_secondDisplayText = '';
    // }

    notifyListeners();
  }

  arithOp(var text) {
    operation = text;

    _secondDisplayText == ''
        ? _temp = _displayText
        : _temp = _secondDisplayText;

    appendDisplay(text);
    _varOne = double.parse(_temp);
    _tempTwo = '';
    //notifyListeners();
  }

  result() {
    _varTwo = double.parse(_tempTwo);

    switch (operation) {
      case '/':
        _result = _varOne / _varTwo;
        break;

      case 'x':
        _result = _varOne * _varTwo;
        break;

      case '-':
        _result = _varOne - _varTwo;
        break;

      case '+':
        _result = _varOne + _varTwo;
        break;

      case '^':
        _result = pow(_varOne, _varTwo);
        break;
    }
    _displayText = '=' + _result.toString();
    //updateDisplay(_result.toString());

    notifyListeners();
  }
}
