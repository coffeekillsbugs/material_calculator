import 'package:flutter/material.dart';
import 'package:material_calculator/components/tap_me_not.dart';
import 'package:material_calculator/models/constants.dart';
import 'package:material_calculator/services/operation.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();

  // ScrollController _contra = ScrollController(
  //   initialScrollOffset: 1.0,
  //   keepScrollOffset: true,
  // );
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notSoWhite,
      body: Stack(
        children: <Widget>[
          //* ---> Active Display <--- *//
          Padding(
            padding: EdgeInsets.only(top: height * 0.28),
            child: Container(
              width: double.infinity,
              height: height * 0.095,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [notSoWhite, Colors.lightBlue], //orangeAccent, red
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                // controller: widget._contra,
                reverse: true,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(right: width * 0.2, left: width * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        Provider.of<OperationController>(context)
                            .returnCalCur(),
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize: 40.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //* ---> History Display <--- *//
          Container(
            width: double.infinity,
            height: height * 0.28,
            decoration: BoxDecoration(
              color: baffllingBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0.0, -3.0),
                  spreadRadius: 5.0,
                  blurRadius: 8.0,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10.0,
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: ListView(
                reverse: true,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      Provider.of<OperationController>(context).returnCalHis(),
                      style: TextStyle(
                        color: placidOrange,
                        fontFamily: 'Righteous',
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //* ---> Backspace Button <--- *//
          Padding(
            padding:
                EdgeInsets.only(top: height * 0.28, bottom: height * 0.625),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: width * 0.15,
                height: height * 0.095,
                decoration: BoxDecoration(
                  color: otherBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(3.0, 6.0),
                      spreadRadius: 5.0,
                      blurRadius: 8.0,
                    )
                  ],
                ),
                child: InkWell(
                    //splashColor: baffllingBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    child: Icon(
                      MdiIcons.backspace,
                      color: notSoWhite,
                      size: 20.0,
                    ),
                    onTap: () {
                      Provider.of<OperationController>(context, listen: false)
                          .backspace();
                    }),
              ),
            ),
          ),
          //* ---> Keypad <--- *//
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: height * 0.625,
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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.028),
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
