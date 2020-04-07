import 'package:flutter/material.dart';
import 'package:material_calculator/services/computations.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/models/constants.dart';
import 'package:provider/provider.dart';

class CalculatorLayout extends StatefulWidget {
  @override
  _CalculatorLayoutState createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).textScaleFactor);
    return Scaffold(
      backgroundColor: notSoWhite,
      body: Stack(
        children: <Widget>[
          // * Layer 0 * //
          // *- Display -* //
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.625),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.375,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.vertical + 10,
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                ),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  reverse: true,
                  children: <Widget>[
                    // *--- Active Display *--- //
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        Provider.of<Compute>(context).getDisplay(),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize:
                              38.7 / MediaQuery.of(context).textScaleFactor,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ),
                    // *--- Display history ---* //
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        Provider.of<Compute>(context).getHistory(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: baffllingBlue.withOpacity(0.6),
                          fontSize:
                              25.8 / MediaQuery.of(context).textScaleFactor,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // * Layer 1 //
          // *- Keypad -* //
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.375),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.625,
              decoration: BoxDecoration(
                //color: baffllingBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
                  topRight: Radius.circular(
                      MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
                ),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black,
                //       spreadRadius: 3.0,
                //       blurRadius: 15.0,
                //       offset: Offset(0.0, 8.0)),
                // ],
                gradient: RadialGradient(
                  colors: [baffllingBlue, otherBlue],
                  center: Alignment.topRight,
                  radius: 1.6,
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.027),
                child: Container(
                  //color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ColOne(),
                      ColTwo(),
                      ColThree(),
                      ColFour(),
                    ],
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
