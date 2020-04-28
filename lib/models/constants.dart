import 'package:flutter/material.dart';
import 'package:material_calculator/components/tap_me_not.dart';
import 'package:material_calculator/services/operation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ColOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ACDC(
          function: Provider.of<OperationController>(context, listen: false).returnClear(),
        ),
        EyeCorn(
          thisIcon: myIcons[0],
          function: 'sqrt',
        ),
        NumberPlumber(
          function: '7',
        ),
        NumberPlumber(
          function: '4',
        ),
        NumberPlumber(
          function: '1',
        ),
        EyeCorn(
          thisIcon: myIcons[9],
          //function: 'swap',
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
        EyeCorn(
          thisIcon: myIcons[1],
          function: 'back',
        ),
        EyeCorn(
          thisIcon: myIcons[2],
          function: '^',
        ),
        NumberPlumber(
          function: '8',
        ),
        NumberPlumber(
          function: '5',
        ),
        NumberPlumber(
          function: '2',
        ),
        NumberPlumber(
          function: '0',
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
        EyeCorn(
          thisIcon: myIcons[3],
          function: '%',
        ),
        EyeCorn(
          thisIcon: myIcons[4],
          function: '!',
        ),
        NumberPlumber(
          function: '9',
        ),
        NumberPlumber(
          function: '6',
        ),
        NumberPlumber(
          function: '3',
        ),
        NumberPlumber(
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
        EyeCorn(
          thisIcon: myIcons[5],
          function: '/'
        ),
        EyeCorn(
          thisIcon: myIcons[6],
          function: 'x',
        ),
        EyeCorn(
          thisIcon: myIcons[7],
          function: '+',
        ),
        EyeCorn(
          thisIcon: myIcons[8],
          function: '-',
        ),
        Gotcha(),
        Gotcha(),
      ],
    );
  }
}

const List<IconData> myIcons = [
  MdiIcons.squareRoot,
  MdiIcons.backspace,
  MdiIcons.exponent,
  MdiIcons.percent,
  //MdiIcons.formatSuperscript,
  MdiIcons.exclamation,
  MdiIcons.division,
  MdiIcons.close,
  MdiIcons.plus,
  MdiIcons.minus,
  MdiIcons.swapHorizontal,
];