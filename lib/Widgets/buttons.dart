import 'package:flutter/material.dart';
import 'package:material_calculator/Constants/colors.dart';
import 'package:material_calculator/main.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              //print('Button pressed : ' + widget.parentText);
              Provider.of<Display>(context, listen: false)
                  .appendDisplay(widget.parentText);
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

             Provider.of<Display>(context, listen: false).updateDisplay(text.substring(0, length-1));
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
