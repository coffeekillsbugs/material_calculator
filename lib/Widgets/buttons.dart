import 'package:flutter/material.dart';
import 'package:material_calculator/Constants/colors.dart';

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