import 'package:flutter/material.dart';
import 'package:material_calculator/theme/colors.dart';
import 'package:material_calculator/main.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Button extends StatelessWidget {
  final parentColor;
  final parentText;

  Button({this.parentColor, this.parentText});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: 80.0,
        color: parentColor,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: otherBlue,
            onTap: () {
              //print('Button pressed : ' + widget.parentText);
              // Provider.of<Display>(context, listen: false)
              //     .appendDisplay(widget.parentText);

              buttonController(parentText, context);
            },
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
        ),
      ),
    );
  }
}

class IconasButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text;
    int length;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        width: 80.0,
        color: placidOrange,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: otherBlue,
            onTap: () {
              //print('Button pressed : ' + widget.parentText);
              text = Provider.of<Display>(context, listen: false).getDisplay();
              length = text.length;

              Provider.of<Display>(context, listen: false)
                  .updateDisplay(text.substring(0, length - 1));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  MdiIcons.backspace,
                  size: 20.0,
                  color: notSoWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void buttonController(var text, BuildContext parentContext) {
  var displayObject = Provider.of<Display>(parentContext, listen: false);
  var fact;
//var temp, result, varOne, varTwo;

  switch (text) {
    case 'C':
      displayObject.updateDisplay('0');
      break;

    case '.':
      displayObject.appendDisplay('.');
      break;

    case '/':
      {
        displayObject.arithOp(text);
      }
      break;

    case 'x':
      {
        displayObject.arithOp(text);
      }
      break;

    case '-':
      {
        displayObject.arithOp(text);
      }
      break;

    case '+':
      {
        displayObject.arithOp(text);
      }
      break;

    case '=':
      {
        displayObject.result();
      }
      break;

    case 'x!':
      {
        fact = factorial(int.parse(displayObject.getSecondaryDisplay()));
        displayObject.updateDisplay(fact.toString());
      }
      break;

    case 'x\u00B2':
      {
        fact = double.parse(displayObject.getDisplay().toString().replaceFirst('=', ''));
        fact = fact * fact;
        displayObject.updateDisplay(fact.toString());
      }
      break;

    case 'x^y':
    {
      displayObject.arithOp('^');
    }
    break;

    default:
      displayObject.appendDisplay(text);
      break;
  }
}

int factorial(var fact) {
  if (fact >= 1)
    return fact * factorial(fact - 1);
  else
    return 1;
}
