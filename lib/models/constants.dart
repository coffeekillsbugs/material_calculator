import 'package:flutter/material.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/components/buttons.dart';

class ColOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Button(
          parentColor: placidOrange,
          function: 'AC',
        ),
        Button(
          parentColor: otherBlue,
          function: 'x!',
        ),
        Button(
          parentColor: Colors.transparent,
          function: 7,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 4,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 1,
        ),
        Button(
          parentColor: baffllingBlue,
          //function: 'e',
          function: '',
        ),
      ],
    );
  }
}

class ColTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Button(
          parentColor: placidOrange,
          function: 'C',
        ),
        Button(
          parentColor: otherBlue,
          function: 'x^y',
        ),
        Button(
          parentColor: Colors.transparent,
          function: 8,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 5,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 2,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 0,
        ),
      ],
    );
  }
}

class ColThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconasButton(),
        Button(
          parentColor: otherBlue,
          function: 'x\u00B2',
        ),
        Button(
          parentColor: Colors.transparent,
          function: 9,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 6,
        ),
        Button(
          parentColor: Colors.transparent,
          function: 3,
        ),
        Button(
          parentColor: otherBlue,
          function: '.',
        ),
      ],
    );
  }
}

class ColFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Button(
          parentColor: otherBlue,
          function: '/',
        ),
        Button(
          parentColor: otherBlue,
          function: 'x',
        ),
        Button(
          parentColor: otherBlue,
          function: '-',
        ),
        Button(
          parentColor: otherBlue,
          function: '+',
        ),
        ResultButton(
          parentColor: placidOrange,
          function: '=',
        )
      ],
    );
  }
}

