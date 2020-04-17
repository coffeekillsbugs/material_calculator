import 'package:flutter/material.dart';
import 'dart:math';

class OperationController extends ChangeNotifier {
  String _calCur = '0', _calHis = '';

  final RegExp _operator = RegExp(r'[/x+-]');
  final RegExp _digit = RegExp(r'[0-9]');
  //final RegExp _alpha = RegExp(r'[a-zA-Z]');

  bool _evalDone = false;
  int _errorCode = 0;
  var _twentySix;

  String returnCalCur() => _calCur;
  String returnCalHis() => _calHis;

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
    if (_errorCode == 0) _calHis = _calHis + '\n' + returnCalCur();
    notifyListeners();
  }

  void clearHistory() {
    _calHis = '';
    notifyListeners();
  }
  //* _calHis methods [END] *//----------------------#

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
    if (_evalDone == false && returnCalCur() != '0') {
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

  void backspace() {
    if (returnCalCur().length == 1) {
      updateCalCur('0');
    } else if (_evalDone == false) {
      updateCalCur(returnCalCur().substring(0, returnCalCur().length - 1));
    } else {
      updateCalCur(returnCalCur().split('=')[0]);
    }
  }

  //* [START] Evaluate function *//----------------------#
  void evaluator() {
    var _temp;
    //TODO : '=' (Evaluate) function
    //TODO : Optimize next two calls
    _temp = pointRunner(returnCalCur());
    _twentySix = rpnEvaluator(_temp);
  }
  //* Evaluate function [END] *//----------------------#

  //* [BEGIN] Shunting Yard Algorithm *//----------------------#
  List<String> pointRunner(String test) {
    List<String> post = List();
    String holder = '';
    String opStack = '';

    int top = -1;

    //TODO calculation for negative numbers

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
              //print('top:' + opStack[top]);
              post.add(opStack[top]);
              //print('ppost:' + post);
              opStack = opStack.substring(0, top);
              //print('opstack: ' + opStack);
              //opStack += c;
              top = opStack.length - 1;
              //stackCheck(c);
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
    //print(post);
    return post;
    //rpnEvaluator();
  }

  int precedence(String pre) {
    //TODO : add for '(' & ')'
    switch (pre) {
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
  String rpnEvaluator(List<String> data) {
    List<String> numberStack = List();

    int top = -1;

    double rightOprand, leftOprand;
    var result;
    String twentySix = '';

    for (int i = 0; i < data.length; i++) {
      //print('Start of $i');
      if (_digit.hasMatch(data[i][0])) {
        numberStack.add(data[i]);
        //print(numberStack);
      } else if (numberStack.length > 1) {
        top = numberStack.length - 1;
        rightOprand = double.parse(numberStack[top]);
        // if (rightOprand == 0) {
        //   errorCode = 2;
        //   break;
        // }
        leftOprand = double.parse(numberStack[top - 1]);
        result = calc(leftOprand, rightOprand, data[i]);
        if (result == false) {
          _errorCode = 2;
          break;
        }

        //numberStack = numberStack.substring(0,numberStack.length - 2);
        numberStack.removeLast();
        //print(numberStack);
        numberStack.removeLast();
        //print(numberStack);
        numberStack.add(result.toString());
        //print('Number Stack after opration : ' + numberStack);
        //top = numberStack.length - 1;
      } else {
        print('numberStack is empty');
        _errorCode = 1;
      }

      //print('End of $i.');
    }
    if (_errorCode == 0) {
      //print(numberStack);
      twentySix = numberStack[0].toString();
      //print(twentySix);
      if (twentySix.split('.')[1] == '0') {
        //print('inside if');
        twentySix = twentySix.substring(0, twentySix.length - 2);
      }
      appendCalCur('\n=' + twentySix);
    } else if (_errorCode == 2) {
      appendCalCur('\n=' + 'Cannot divide by zero');
      _errorCode = 0;
    } else {
      appendCalCur('\n=' + 'Error');
      _errorCode = 0;
    }
    return twentySix;
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
      default:
        return 0.0;
    }
  }
  //* RPN Evaluator [END]
  //TODO : square root function

  //TODO : square function

  //TODO : power function

  //TODO : percentage function
}
