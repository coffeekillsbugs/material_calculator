import 'package:flutter/material.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/models/constants.dart';

class CalculatorLayout extends StatefulWidget {
  @override
  _CalculatorLayoutState createState() => _CalculatorLayoutState();
}

class _CalculatorLayoutState extends State<CalculatorLayout> {
  @override
  Widget build(BuildContext context) {
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
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    reverse: true,
                    children: <Widget>[
                      // *--- Active Display *--- //
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'primary display',
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: baffllingBlue,
                            fontSize: 45.0,
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      // *--- Display history ---* //
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'calc history',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: baffllingBlue.withOpacity(0.6),
                            fontSize: 30.0,
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
