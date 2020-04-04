import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_calculator/services/computations.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/components/buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

List<FontFeature> powerY = [FontFeature.enable('sups')];
List<FontFeature> square = [FontFeature.enable('sups')];

class ColOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Operation(
          parentColor: placidOrange,
          function: Provider.of<Compute>(context, listen: false).returnClear(),
        ),
        IconasButton(
          parentColor: otherBlue,
          parentFunction: 'x/x',
          parentIcon: MdiIcons.squareRoot,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 7,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 4,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 1,
        ),
        Operation(
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
        IconasButton(
          parentColor: placidOrange,
          parentFunction: 'back',
          parentIcon: MdiIcons.backspace,
        ),
        Operation(
          parentColor: otherBlue,
          function: 'x\u1d5e',
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 8,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 5,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 2,
        ),
        NumberButton(
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
        Operation(
          parentColor: otherBlue,
          function: '',
        ),
        Operation(
          parentColor: otherBlue,
          function: 'x\u00B2',
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 9,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 6,
        ),
        NumberButton(
          parentColor: Colors.transparent,
          function: 3,
        ),
        Operation(
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
        Operation(
          parentColor: otherBlue,
          function: '/',
        ),
        Operation(
          parentColor: otherBlue,
          function: 'x',
        ),
        Operation(
          parentColor: otherBlue,
          function: '-',
        ),
        Operation(
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
