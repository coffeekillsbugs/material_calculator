import 'package:flutter/material.dart';

class Compute extends ChangeNotifier {
  String calCur = '0', calHis = '';
  var twentyFour, twentyFive, twentySix;
  int flag = 0;

  //* Shunting Yard Algo
  String test = ('3+2*4+5');

  RegExp re = RegExp(r'^[0-9]+$');

  String post = '';
  String opStack = '';
  String temp;

  int top = -1;
  //* Shunting Yard Algo END

  void cal(String op) {
    switch (op) {
      case '+':
        twentySix = twentyFour + twentyFive;
        break;

      case '-':
        twentySix = twentyFour - twentyFive;
        break;

      case '/':
        twentySix = twentyFour / twentyFive;
        break;

      case 'x':
        twentySix = twentyFour * twentyFive;
        break;

      default:
    }
  }

  void appendCalCur(var data) {
    if (calCur == '0') {
      calCur = data;
    } else
      calCur += data;
    notifyListeners();
  }

  result() => twentySix;

  String getDisplay() => calCur;

  String getHistory() => calHis;

  void backspace() {
    if (calCur.isNotEmpty && calCur != '0')
      calCur.substring(0, calCur.length - 1);
    else
      calCur = '0';

    notifyListeners();
  }
}

// class OperatorStack {
//   //static const int max = 100;
//   int _top = -1;
//   String temp;
//   int _start = 0;

//   List<String> operatorStack = List();
//   // *--- Reverse Polish Notation Queue ---* //
//   List<String> _postfixExp = List();
//   // *--- Reverse Polish Notation Queue ---* //
//   List<String> _numberStack = List();

//   RegExp re = RegExp(r'^[0-9]+$');

//   bool push(String data) {
//     operatorStack.add(data);
//     ++_top;
//     return true;
//   }

//   bool pop() {
//     if (_top == -1) {
//       print('Error in pop operation. Stack empty');
//       return false;
//     }

//     temp = operatorStack.removeAt(_top);
//     --_top;
//     print(temp);
//     return true;
//   }

//   String peek() {
//     return operatorStack[_top];
//   }

//   //* RPN Queue
//   bool pushQueue(String data) {
//     _postfixExp.add(data);
//     return true;
//   }

//   // void rpnEvaluator() {
//   //   while (_postfixExp.isNotEmpty) {
//   //     if(re.hasMatch(_postfixExp))
//   //   }
//   // }
// }
