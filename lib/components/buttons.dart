import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_calculator/services/computations.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Operation extends StatelessWidget {
  final parentColor;
  final function;

  Operation({this.parentColor, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.22, // 16:11 ratio for width to height (80.0/55.0)
      height: MediaQuery.of(context).size.width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: parentColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
        boxShadow: function == '' ? null : [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0.0, 0.0),
            spreadRadius: 0.5,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: otherBlue,
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
          onTap: () {
            switch (function) {
              case 'C':
                if (Provider.of<Compute>(context, listen: false)
                        .returnCounter() ==
                    1) {
                  Provider.of<Compute>(context, listen: false).transferToHistory();
                  Provider.of<Compute>(context, listen: false).changeCounter();
                }
                else
                Provider.of<Compute>(context, listen: false).clearPrimary();

                break;

              case 'AC':
                Provider.of<Compute>(context, listen: false).allClear();
                break;

              case 'x\u00B2':
                Provider.of<Compute>(context, listen: false).computeSquare();
                break;

              case 'x^y':if(Provider.of<Compute>(context, listen: false).returnCounter() == 1){
                Provider.of<Compute>(context, listen:false).powerToYou();
                Provider.of<Compute>(context, listen:false).changeCounter();
              } else
                Provider.of<Compute>(context, listen: false).appendCalCur('^');
                break;

              case '.':
                if (Provider.of<Compute>(context, listen: false)
                        .pointStatus() ==
                    false) {
                  Provider.of<Compute>(context, listen: false)
                      .appendCalCur(function);
                  Provider.of<Compute>(context, listen: false).setPointStatus();
                }
                break;

              default:
                Provider.of<Compute>(context, listen: false).noName(function);
                break;
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              function.toString(),
              style: TextStyle(
                color: notSoWhite,
                fontFamily: 'Righteous',
                fontSize: 23.22 / MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconasButton extends StatelessWidget {
  final parentIcon;
  final parentColor;
  final parentFunction;

  IconasButton({this.parentColor, this.parentFunction, this.parentIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.22, // 16:11 ratio for width to height (80.0/55.0)
      height: MediaQuery.of(context).size.width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: parentColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
            boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0.0, 0.0),
            spreadRadius: 0.5,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
          splashColor: otherBlue,
          onTap: () {
            if (parentFunction == 'back')
              Provider.of<Compute>(context, listen: false).backspace();
            else
              Provider.of<Compute>(context, listen: false).computeRoot();
          },
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              parentIcon,
              size: parentIcon == MdiIcons.backspace ? 20.0 : 35.0,
              color: notSoWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class ResultButton extends StatelessWidget {
  final parentColor;
  final function;

  ResultButton({this.parentColor, this.function});
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var resultHeight =
        (devicewidth * 0.22 * 0.6875 * 2) + (devicewidth * 0.027);
    return Container(
      width: MediaQuery.of(context).size.width *
          0.22, // 2:3 ratio for width to height (80.0/120.0)
      height: resultHeight,
      decoration: BoxDecoration(
        color: parentColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
            boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0.0, 0.0),
            spreadRadius: 0.5,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
          splashColor: otherBlue,
          onTap: () {
            print('Result button pressed');
            var counter = Provider.of<Compute>(context, listen: false);
            if (counter.returnCounter() == 0) {
              counter.pointRunner();
              counter.changeCounter();
              print('counter called from resultbutton when its 0 -> 1');
            } else {
              counter.transferToHistory();
              counter.changeCounter();
              print('counter called from numberbutton when its 1 -> 0');
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              function.toString(),
              style: TextStyle(
                color: notSoWhite,
                fontFamily: 'Righteous',
                fontSize: 23.22 / MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final parentColor;
  final function;

  NumberButton({this.parentColor, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.22, // 16:11 ratio for width to height (80.0/55.0)
      height: MediaQuery.of(context).size.width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: parentColor,
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5),
              
          splashColor: otherBlue,
          onTap: () {
            var counter = Provider.of<Compute>(context, listen: false);
            if (counter.pointStatus() == true) {
              counter.setPointStatus();
            }
            if (counter.returnCounter() == 0) {
              Provider.of<Compute>(context, listen: false)
                  .appendCalCur(function.toString());
            } else {
              counter.transferToHistory();
              counter.changeCounter();
              //print('counter called from numberbutton');
              counter.appendCalCur(function.toString());
            }
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              function.toString(),
              style: TextStyle(
                color: notSoWhite,
                fontFamily: 'Righteous',
                fontSize: 23.22 / MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
