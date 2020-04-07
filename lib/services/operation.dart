import 'package:flutter/material.dart';
import 'dart:math';

class OperationController extends ChangeNotifier {
  String _calCur = '0', _calHis = '';

  final RegExp _operator = RegExp(r'[/x+-]');
  final RegExp _digit = RegExp(r'[0-9]');
  final RegExp _alpha = RegExp(r'[a-zA-Z]');

  bool _evalDone = false;

  String returnCalCur() => _calCur;
  String returnCalHis() => _calHis;

  //* [START] _calCur methods *//
  void updateCalCur(String data) {
    _calCur = data;
    notifyListeners();
  }

  void appendCalCur(String data) {
    _calCur += data;
    notifyListeners();
  }
  //* _calCur methods [END] *//
  //* [START] _calHis methods *//
  void transferToHistory() {
    _calHis = _calHis + '\n' + returnCalCur();
    notifyListeners();
  }

  void clearHistory() {
    _calHis = '';
    notifyListeners();
  }
  //* _calHis methods [END] *//

  void calCurController(String data) {
    if (_digit.hasMatch(data)) {
      digit(data);
    } else if (_operator.hasMatch(data) && returnCalCur() != '0') {
      operatoR(data);
    } else
      clearDisplay(data);
  }

  void digit(String data) {
    if (_evalDone == false && returnCalCur() == '0')
      updateCalCur(data);
    else if (_evalDone == false)
      appendCalCur(data);
    else {
      transferToHistory();
      updateCalCur(data);
      _evalDone = false;
    }
  }

  void operatoR(String data) {
    if (_evalDone == false) {
      appendCalCur(data);
    } else {
      transferToHistory();
      updateCalCur(_twentySix);
      appendCalCur(data);
      _evalDone = false;
    }
  }

  void clearDisplay(String data) {
    if (_evalDone == false && data == 'C')
      updateCalCur('0');
    else if (_evalDone == true && data == 'C') {
      transferToHistory();
      updateCalCur('0');
      _evalDone = false;
    } else
      clearHistory();
  }

  String returnClear() {
    if (returnCalCur() == '0') {
      return 'AC';
    } else
      return 'C';
  }

  //TODO : backspace function

  //TODO : '=' (Evaluate) function

  //TODO : square root function

  //TODO : square function

  //TODO : power function

  //TODO : percentage function
}
