import 'package:flutter/material.dart';
import 'dart:math';

class Compute extends ChangeNotifier {
  String calCur = '0', calHis = '';
  var twentySix;
  List<String> post = List();
  String holder = '';
  String opStack = '';

  int top = -1;

  List<String> numberStack = List();
  double rightOprand, leftOprand;
  double result;

  RegExp re = RegExp(r'^[0-9]+$');

  int resultPressCounter = 0;

  void changeCounter() {
    if(resultPressCounter == 0)
    resultPressCounter = 1;
    else resultPressCounter = 0;
    notifyListeners();
  }

  int returnCounter() => resultPressCounter;

  void appendCalCur(var data) {
    if (calCur == '0') {
      calCur = data;
    } else
      calCur += data;
    notifyListeners();
  }

  //result() => twentySix;

  String getDisplay() => calCur;

  String getHistory() => calHis;

  void clearPrimary() {
    calCur = '0';
    notifyListeners();
  }

  void allClear() {
    calHis = '';
    notifyListeners();
  }

  String returnClear() {
    if(calCur == '0') {
      return 'AC';
    }
    else
    return 'C';
  }

  void transferToHistory() {
    calHis += calCur.replaceFirst(new RegExp(r'\n'), '') + '\n';
    calCur = '0';
    notifyListeners();
  }

  void backspace() {
    if (calCur == '' || calCur.length == 1)
      calCur = '0';
    else
      calCur = calCur.substring(0, calCur.length - 1);

    notifyListeners();
  }

  // *---Shunting Yard Algorithm---* //
  void pointRunner() {
    String test;
    test = calCur;
    //TODO calculation for negative numbers 
    for (int i = 0; i < test.length; i++) {
      if (re.hasMatch(test[i]) || test[i] == '.') {
        holder += test[i];
      } else {
        post.add(holder);
        holder = '';
        stackCheck(test[i]);
      }
    }
    post.add(holder);
    if (opStack.isNotEmpty) {
      while (top != -1) {
        post.add(opStack[top]);
        --top;
      }
    }
    print(post);
    top = -1;
    rpnEvaluator();
  }

  void stackCheck(String c) {
    if (opStack.isEmpty) {
      opStack += c;
      top = opStack.length - 1;
    } else {
      if (precedence(opStack[top]) < precedence(c)) {
        opStack += c;
        top = opStack.length - 1;
      } else {
        while (opStack.length >= 1) {
          //print('top:' + opStack[top]);
          post.add(opStack[top]);
          //print('ppost:' + post);
          opStack = opStack.substring(0, top);
          //print('opstack: ' + opStack);
          //opStack += c;
          top = opStack.length - 1;
          //stackCheck(c);
        }
        opStack += c;
        top = opStack.length - 1;
      }
    }
  }

  int precedence(String pre) {
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

  // *---Shunting Yard Algorithm END---* //

  void rpnEvaluator() {
    for (int i = 0; i < post.length; i++) {
      //print('Start of $i');
      if (re.hasMatch(post[i][0])) {
        numberStack.add(post[i]);
        //print(numberStack);
      } else {
        if (numberStack.isNotEmpty) {
          top = numberStack.length - 1;
          rightOprand = double.parse(numberStack[top]);
          leftOprand = double.parse(numberStack[top - 1]);
          result = calc(leftOprand, rightOprand, post[i]);

          //numberStack = numberStack.substring(0,numberStack.length - 2);
          numberStack.removeLast();
          //print(numberStack);
          numberStack.removeLast();
          //print(numberStack);
          numberStack.add(result.toString());
          //print('Number Stack after opration : ' + numberStack);
          //top = numberStack.length - 1;
        } else {
          //print('String Empty, something has gone wrong');
        }
      }
      //print('End of $i.');
    }
    print(numberStack);
    twentySix = numberStack[0].toString();
    calCur = calCur + '\n=' + twentySix;
    clearVariable();
    notifyListeners();
  }

  double calc(double leftOprand, double rightOprand, String op) {
    switch (op) {
      case '+':
        return leftOprand + rightOprand;
      case '-':
        return leftOprand - rightOprand;
      case 'x':
        return leftOprand * rightOprand;
      case '/':
        return leftOprand / rightOprand;
      case '^':
        return pow(leftOprand, rightOprand);
      default:
        return 0.0;
    }
  }

  void clearVariable() {
    post.clear();
    numberStack.clear();
    holder = '';
    opStack = '';
  }

  void computeSquare() {
    var squareValue = double.parse(calCur);

    calCur = pow(squareValue, 2).toString();
    changeCounter();
    notifyListeners();
  }

  void computeRoot() {
    var rootValue = double.parse(calCur);

    calCur = sqrt(rootValue).toString();
    changeCounter();
    notifyListeners();
  }

  void noName(var operation) {
    if(returnCounter() == 0){
      appendCalCur(operation);
    }
    else{
      transferToHistory();
      calCur = twentySix + operation;
      changeCounter();
      notifyListeners();
    }
  }
}
