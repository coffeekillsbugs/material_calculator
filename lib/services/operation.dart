import 'package:flutter/material.dart';
import 'dart:math';

import 'package:material_calculator/theme/colors.dart';

class OperationController extends ChangeNotifier {
  String _calCur = '0', _calHis = '', _result = '';

  final RegExp _digit = RegExp(r'[0-9]');
  final RegExp _period = RegExp(r'[.]');

  bool _evalDone = false;
  bool _point = false, _root = false;
  int _errorCode = 0;
  Color _statusColor = Colors.blue, _textColor = baffllingBlue;

  void status() {
    if (_evalDone == true && _errorCode == 0) {
      _statusColor = Colors.orange;
      _textColor = Colors.deepOrange;
    } else if (_evalDone == true && _errorCode > 0) {
      _statusColor = rustyRed;
      _textColor = burgundy;
    } else {
      _statusColor = Colors.blue;
      _textColor = baffllingBlue;
    }
    notifyListeners();
  }

  Color statusColor() => _statusColor;
  Color textColor() => _textColor;

  String returnCalCur() => _calCur;
  String returnCalHis() => _calHis;
  String returnResult() => _result;

  //* [START] _calCur methods *//----------------------#
  void updateCalCur(String data) {
    _calCur = data;
    notifyListeners();
  }

  void appendCalCur(String data) {
    if (_calCur == '0')
      _calCur = data;
    else
      _calCur += data;
    notifyListeners();
  }

  //* _calCur methods [END] *//----------------------#

  //* [START] _calHis methods *//----------------------#
  void transferToHistory() {
    _calHis = _calHis + '\n\n' + returnCalCur() + '\n' + returnResult();
    notifyListeners();
  }

  void clearHistory() {
    _calHis = '';
    notifyListeners();
  }
  //* _calHis methods [END] *//----------------------#

  void updateResult(String data) {
    _result = data;
    notifyListeners();
  }

  void calCurController(String data) {

    _root = false;

    if (_digit.hasMatch(data)) {
      _point = false;
      digit(data);
    } else if ((data == 'x' ||
            data == '/' ||
            data == '+' ||
            data == '-' ||
            data == '^' ||
            data == '!' ||
            data == '%') &&
        returnCalCur() != '0') {
      operatoR(data);
    } else if (data == 'C' || data == 'AC') {
      print('clear matched');
      clearDisplay(data);
    } else if (data == 'sqrt' && _errorCode == 0) {
      squareRoot();
    } else {
      if (_point == false) {
        _point = true;
        digit(data);
      }
    }
  }

  void digit(String data) {
    if (_evalDone == false && returnCalCur() == '0') {
      updateCalCur(data);
      _errorCode = 0;
    } else if (_evalDone == false) {
      appendCalCur(data);
      _errorCode = 0;
    } else {
      if (_errorCode == 0) transferToHistory();
      updateCalCur(data);
      updateResult('');
      _evalDone = false;
      _errorCode = 0;
      status();
    }
  }

  void operatoR(String data) {
    if (_evalDone == false && returnCalCur() != '0') {
      appendCalCur(data);
    } else {
      if (_errorCode > 0) {
        updateResult('');
        updateCalCur('0');
        _evalDone = false;
        _errorCode = 0;
        status();
      } else {
        transferToHistory();
        updateCalCur(returnResult().split('=')[1] + data);
        updateResult('');
        _evalDone = false;
        _errorCode = 0;
        status();
      }
    }
  }

  void clearDisplay(String data) {
    if (_evalDone == false && data == 'C') {
      updateCalCur('0');
      updateResult('');
    } else if (_evalDone == true && data == 'C') {
      if (_errorCode == 0) transferToHistory();
      updateCalCur('0');
      updateResult('');
      _evalDone = false;
      _errorCode = 0;
      status();
    } else {
      clearHistory();
      _evalDone = false;
      _errorCode = 0;
      status();
    }
  }

  String returnClear() {
    if (returnCalCur() == '0') {
      return 'AC';
    } else
      return 'C';
  }

  void backspace() {
    if (returnCalCur().length == 1) {
      updateCalCur('0');
    } else if (_evalDone == false) {
      updateCalCur(returnCalCur().substring(0, returnCalCur().length - 1));
    } else if (_root == true) {
      transferToHistory();
      updateCalCur('0');
      updateResult('');
      _evalDone = false;
      _errorCode = 0;
      status();
    }else {
      if (_errorCode == 0) {
        transferToHistory();
        updateResult('');
        _evalDone = false;
        _errorCode = 0;
        status();
      } else {
        updateCalCur('0');
        updateResult('');
        _evalDone = false;
        _errorCode = 0;
        status();
      }
    }
  }

  //* [START] Evaluate function *//----------------------#
  void evaluator() {
    var _temp;

    _point = true;
    _temp = pointRunner(returnCalCur());
    rpnEvaluator(_temp);
    _evalDone = true;
    status();
  }
  //* Evaluate function [END] *//----------------------#

  //* [BEGIN] Shunting Yard Algorithm *//----------------------#
  List<String> pointRunner(String test) {
    List<String> post = List();
    String holder = '';
    String opStack = '';

    int top = -1;

    for (int i = 0; i < test.length; i++) {
      if (_digit.hasMatch(test[i]) || test[i] == '.') {
        holder += test[i];
      } else {
        if (holder.isNotEmpty) {
          post.add(holder);
        }
        holder = '';
        //*stack Check code
        if (opStack.isEmpty || test[i] == '(') {
          opStack += test[i];
          top = opStack.length - 1;
        } else {
          if (precedence(opStack[top]) < precedence(test[i])) {
            opStack += test[i];
            top = opStack.length - 1;
          } else {
            while (opStack.isNotEmpty) {
              post.add(opStack[top]);
              opStack = opStack.substring(0, top);
              top = opStack.length - 1;
            }
            opStack += test[i];
            top = opStack.length - 1;
          }
        }
        //*stack Check code
      }
    }
    if (holder != '') post.add(holder);
    if (opStack.isNotEmpty) {
      while (top != -1) {
        post.add(opStack[top]);
        --top;
      }
    }
    print(post);
    return post;
  }

  int precedence(String pre) {
    //TODO : add for '(' & ')'
    switch (pre) {
      case '%':
        return 5;
      case '!':
        return 5;
      case '^':
        return 4;
      case 'x':
        return 3;
      case '/':
        return 3;
      case '~':
        return 3;
      case '+':
        return 2;
      case '-':
        return 2;
      case '=':
        return 1;
      default:
        return 1;
    }
  }
  //* Shunting Yard Algorithm [END] *//----------------------#

  //* [START] RPN Evaluator
  void rpnEvaluator(List<String> data) {
    List<String> numberStack = List();

    int top = -1;

    double rightOprand, leftOprand;
    var result;
    var twentySix;

    var factResult;

    for (int i = 0; i < data.length; i++) {
      print('Start of $i');
      print('Data' + data[i][0]);
      if (_digit.hasMatch(data[i][0])) {
        numberStack.add(data[i]);
        print('NumberStack : ');
        print(numberStack);
      } else if (data[i][0] == '!') {
        print('! approved');
        if (_period.hasMatch(numberStack[numberStack.length - 1])) {
          print('. approved');
          _errorCode = 1;
          break;
        } else {
          print('. skipped');
          factResult =
              factorial(int.parse(numberStack[numberStack.length - 1]));
          print(factResult);
          print('Numberstack after factResult');
          print(numberStack);
          numberStack.removeLast();
          print('Numberstack after removing last element');
          print(numberStack);
          numberStack.add(factResult.toString());
          print('Numberstack after adding factResult');
          print(numberStack);
        }
      } else if (numberStack.length > 1) {
        top = numberStack.length - 1;
        rightOprand = double.parse(numberStack[top]);
        leftOprand = double.parse(numberStack[top - 1]);
        result = calc(leftOprand, rightOprand, data[i]);
        if (result == false) {
          _errorCode = 2;
          break;
        }
        print('This place');
        numberStack.removeLast();
        numberStack.removeLast();
        numberStack.add(result.toString());
      } else {
        print('numberStack is empty');
        _errorCode = 1;
      }
    }

    if (_errorCode == 0) {
      twentySix = double.parse(numberStack[0]);
      twentySix = twentySix.toString();
      print('TwentySix : ' + twentySix.toString());
      if (twentySix.split('.')[1] == '0') {
        twentySix = twentySix.substring(0, twentySix.length - 2);
      }
      updateResult('=' + twentySix);
    } else if (_errorCode == 2) {
      updateCalCur('');
      updateResult('Can\'t divide by 0');
    } else {
      updateCalCur('');
      updateResult('Bad Expression');
    }
  }

  dynamic calc(double leftOprand, double rightOprand, String op) {
    switch (op) {
      case '+':
        return leftOprand + rightOprand;
      case '-':
        return leftOprand - rightOprand;
      case 'x':
        return leftOprand * rightOprand;
      case '/':
        if (rightOprand != 0)
          return leftOprand / rightOprand;
        else
          return false;

        break;
      case '^':
        return pow(leftOprand, rightOprand);

      case '%':
        return rightOprand * (leftOprand / 100.0);

      default:
        return 0.0;
    }
  }
  //* RPN Evaluator [END]

  double factorial(int data) {
    var result;
    if (data == 0 || data == 1) return 1;

    result = factorial(data - 1) * data;
    return result;
  }

  void squareRoot() {
    var res, temp;

    if (returnCalCur() == '' || _evalDone == true) {
      transferToHistory();
      if (returnResult()[0] == '=') {
        
        temp = returnResult().split('=')[1];
        res = sqrt(double.parse(returnResult().split('=')[1]));
      } else {
        temp = returnResult();
        res = sqrt(double.parse(returnResult()));
      }
    } else {
      temp = returnCalCur();
      res = sqrt(double.parse(returnCalCur()));
    }
    res = res.toString();

    if (res.split('.')[1] == '0') {
      res = res.substring(0, res.length - 2);
    }

    _root = true;
    updateCalCur('Square root of $temp');
    updateResult('=$res');
    _errorCode = 0;
    _evalDone = true;
    status();
  }
}
