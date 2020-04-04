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
    return Scaffold(
      backgroundColor: notSoWhite,
      body: Stack(
        children: <Widget>[
          // * Layer 0 * //
          Column(
            children: <Widget>[
              // * Display * //
              Container(
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
                            fontSize: 45.0,
                            fontFamily: 'Righteous',
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 40.0,
                      // ),
                      // *--- Display history ---* //
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          Provider.of<Compute>(context).getHistory(),
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
              // * Dummy Button layout * //
              Container(
                height: MediaQuery.of(context).size.height * 0.625,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          // * Layer 1 //
          Column(
            children: <Widget>[
              // * Dummy Display * //
              Container(
                height: MediaQuery.of(context).size.height * 0.375,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              // * Button layout * //
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
