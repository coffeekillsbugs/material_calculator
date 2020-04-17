import 'package:flutter/material.dart';
import 'package:material_calculator/services/operation.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class NumberPlumber extends StatelessWidget {
  final String function;

  NumberPlumber({this.function});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var tsf = MediaQuery.of(context).textScaleFactor;

    return Container(
      width: width * 0.22,
      height: width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(width * 0.22 * 0.6875 * 0.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.22 * 0.6875 * 0.5),
          splashColor: otherBlue,
          onTap: () {
            Provider.of<OperationController>(context, listen:false,).calCurController(function);
          },
          child: Center(
            child: Text(
              function,
              style: TextStyle(
                color: notSoWhite,
                fontFamily: 'Righteous',
                fontSize: 23.22 / tsf,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EyeCorn extends StatelessWidget {

  final thisIcon, function;

  EyeCorn({this.thisIcon, this.function});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.22,
      height: width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(width * 0.22 * 0.6875 * 0.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(width * 0.22 * 0.6875 * 0.5),
          splashColor: thisIcon == MdiIcons.swapHorizontal ? otherBlue : placidOrange,
          onTap: () {
            var operation = Provider.of<OperationController>(context, listen: false);
            switch(function){
              case 'square' : print('Square');
                break;
              
              default : operation.calCurController(function);
            }
          },
          child: Center(
            child: Icon(
              thisIcon,
              color: thisIcon == MdiIcons.swapHorizontal ? otherBlue : placidOrange,
              //TODO semantic label,
              size: thisIcon == MdiIcons.percent ? 25.0 : 30.0,
            )
          ),
        ),
      ),
    );
  }
}

class ACDC extends StatelessWidget {
  final function;

  ACDC({this.function});

  @override
  Widget build(BuildContext context) {
    var cir = MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.22, // 16:11 ratio for width to height (80.0/55.0)
      height: width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: placidOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cir),
          topRight: Radius.circular(cir),
          bottomRight: Radius.circular(cir),
          bottomLeft: Radius.circular(width * 0.028),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0.0, 5.0),
            spreadRadius: 0.5,
            blurRadius: 3.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: otherBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cir),
            topRight: Radius.circular(cir),
            bottomRight: Radius.circular(cir),
            bottomLeft: Radius.circular(width * 0.028),
          ),
          onTap: () {
            Provider.of<OperationController>(context, listen:false).calCurController(function);
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              function,
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

class Gotcha extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.22,
      height: width * 0.22 * 0.6875,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(width * 0.22 * 0.6875 * 0.5),
      ),
    );
  }
}

class Evaluate extends StatelessWidget {
  final function;

  Evaluate({this.function});

  @override
  Widget build(BuildContext context) {
    var cir = MediaQuery.of(context).size.width * 0.22 * 0.6875 * 0.5;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.22, // 16:11 ratio for width to height (80.0/55.0)
      height: width * 0.22 * 0.6875 * 2.3,
      decoration: BoxDecoration(
        color: placidOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cir),
          topRight: Radius.circular(cir),
          bottomRight: Radius.circular(width * 0.028),
          bottomLeft: Radius.circular(cir),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0.0, 5.0),
            spreadRadius: 0.5,
            blurRadius: 3.0,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: otherBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cir),
            topRight: Radius.circular(cir),
            bottomRight: Radius.circular(width * 0.028),
            bottomLeft: Radius.circular(cir),
          ),
          onTap: () {
            Provider.of<OperationController>(context, listen:false).evaluator();
          },
          child: Align(
            alignment: Alignment.center,
            child: Center(
            child: Icon(
              MdiIcons.equal,
              color: notSoWhite,
              //TODO semantic label,
              size: 30.0,
            )
          ),
          ),
        ),
      ),
    );
  }
}