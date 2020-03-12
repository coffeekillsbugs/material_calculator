import 'package:flutter/material.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/models/constants.dart';
import 'package:material_calculator/main.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final display = Provider.of<Display>(context);

    return Stack(
      children: <Widget>[
        // * Calculator body *//
        Scaffold(
          body: Column(
            children: <Widget>[
              // * Display * //
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
                    bottom: 10.0,
                  ),
                  child: ListView(
                    reverse: true,
                    children: <Widget>[
                      
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        display.getDisplay(),
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize: 45.0,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        display.getSecondaryDisplay(),
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize: 45.0,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ),
              // * Button layout * //
              Container(
                height: MediaQuery.of(context).size.height * 0.625,
                decoration: BoxDecoration(
                  color: baffllingBlue,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
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
            ],
          ),
        ),
        // * Menu Icon * //
        // Padding(
        //   padding: EdgeInsets.only(
        //     top: MediaQuery.of(context).padding.vertical + 5,
        //     left: 5.0,
        //   ),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(30.0),
        //     child: Material(
        //       color: Colors.transparent,
        //       child: InkWell(
        //         splashColor: placidOrange,
        //         onTap: () {
        //           // TODO : Open Drawbar
        //         },
        //         child: Padding(
        //           padding: EdgeInsets.all(5.0),
        //           child: Icon(
        //             MdiIcons.sortVariant,
        //             color: baffllingBlue,
        //             size: 40.0,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
