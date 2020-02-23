import 'package:flutter/material.dart';
import 'package:material_calculator/Constants/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
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
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        displayText,
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize: 45.0,
                          fontFamily: 'Righteous',
                        ),
                      ),
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

class ColOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Button(
          parentColor: placidOrange,
          parentText: 'AC',
        ),
        Button(
          parentColor: otherBlue,
          parentText: 'x!',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '7',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '4',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '1',
        ),
        Button(
          parentColor: otherBlue,
          parentText: 'e',
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
          parentText: 'C',
        ),
        Button(
          parentColor: otherBlue,
          parentText: 'x^y',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '8',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '5',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '2',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '0',
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
        Button(
          parentColor: otherBlue,
          parentText: '%',
        ),
        Button(
          parentColor: otherBlue,
          parentText: 'x',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '9',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '6',
        ),
        Button(
          parentColor: Colors.transparent,
          parentText: '3',
        ),
        Button(
          parentColor: otherBlue,
          parentText: '.',
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
          parentText: '/',
        ),
        Button(
          parentColor: otherBlue,
          parentText: 'X',
        ),
        Button(
          parentColor: otherBlue,
          parentText: '-',
        ),
        Button(
          parentColor: otherBlue,
          parentText: '+',
        ),
        ButtonTwo(
          parentColor: placidOrange,
          parentText: '=',
        ),
        // Button(
        //   parentColor: placidOrange,
        //   parentText: '=',
        // ),
      ],
    );
  }
}

class Button extends StatefulWidget {
  final parentColor;
  final parentText;

  Button({this.parentColor, this.parentText});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
          child: Container(
        width: 80.0,
        color: widget.parentColor,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: otherBlue,
              onTap: () {
        setState(() {
          // TODO change 'display text'
        });
              },
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            widget.parentText,
            style: TextStyle(
              color: notSoWhite,
              fontFamily: 'Righteous',
              fontSize: 30.0,
            ),
          ),
        ),
              ),
            ),
          ),
      ),
    );
  }
}

class ButtonTwo extends StatelessWidget {
  final parentColor;
  final parentText;

  ButtonTwo({this.parentColor, this.parentText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO : Add functioning
      },
      child: Container(
        width: 80.0,
        height: 115.0,
        decoration: BoxDecoration(
          color: parentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              parentText,
              style: TextStyle(
                color: notSoWhite,
                fontFamily: 'Righteous',
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
