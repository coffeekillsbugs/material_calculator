import 'package:flutter/material.dart';
import 'package:material_calculator/components/tap_me_not.dart';
import 'package:material_calculator/models/constants.dart';
import 'package:material_calculator/services/operation.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    //var height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notSoWhite,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Provider.of<OperationController>(context).statusColor(),
                  notSoWhite
                ],
                radius: 2.0,
                center: Alignment.bottomCenter,
              ),
            ),
          ),
          //* ---> BODY <--- *//
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  flex: 3,
                                  child: Container(
                    // width: double.infinity,
                    // height: height * 0.28,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: ListView(
                      reverse: true,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              Provider.of<OperationController>(context)
                                  .returnCalHis(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: otherBlue,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                                  child: Container(
                    // width: double.infinity,
                    // height: height * 0.1,
                    decoration: BoxDecoration(),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // controller: widget._contra,
                      reverse: true,
                      children: <Widget>[
                        //TODO Change focus to result after evaluation
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              Provider.of<OperationController>(context)
                                  .returnResult(),
                              style: TextStyle(
                                color: Provider.of<OperationController>(context)
                                    .textColor(),
                                fontSize: 60.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              Provider.of<OperationController>(context)
                                  .returnCalCur(),
                              style: TextStyle(
                                color: baffllingBlue,
                                fontSize: 60.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                                  child: Container(
                    // width: double.infinity,
                    // height: height * 0.62,
                    decoration: BoxDecoration(
                      //color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                      ),
                      gradient: LinearGradient(
                        colors: [baffllingBlue, otherBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0.0, 6.0),
                          spreadRadius: 5.0,
                          blurRadius: 8.0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.028),
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
          ),
          //* ---> Evaluate <--- *//
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
              child: Evaluate(),
            ),
          ),
        ],
      ),
    );
  }
}
