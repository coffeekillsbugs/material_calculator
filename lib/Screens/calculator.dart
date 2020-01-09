import 'package:flutter/material.dart';
import 'package:material_calculator/Constants/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          // * Calculator body *//
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.375,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: notSoWhite,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.vertical + 10,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.625,
                decoration: BoxDecoration(
                  color: baffllingBlue,
                ),
              ),
            ],
          ),
          // * Menu Icon * //
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.vertical + 5,
              left: 5.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
                          child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: placidOrange,
                  onTap: () {
                    // TODO : Open Drawbar
                  },
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      MdiIcons.sortVariant,
                      color: baffllingBlue,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
