import 'package:flutter/material.dart';
import 'package:material_calculator/Constants/colors.dart';
import 'package:material_calculator/Widgets/buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        IconasButton(),
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
        Expanded(
          flex: 2,
          child: Column(
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
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Button(
              parentColor: placidOrange,
              parentText: '=',
            ),
          ),
        )
      ],
    );
  }
}

// class ColFour extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Expanded(
//           flex: 1,
//           child: Button(
//             parentColor: otherBlue,
//             parentText: '/',
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Button(
//             parentColor: otherBlue,
//             parentText: 'X',
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Button(
//             parentColor: otherBlue,
//             parentText: '-',
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Button(
//             parentColor: otherBlue,
//             parentText: '+',
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: ButtonTwo(
//             parentColor: placidOrange,
//             parentText: '=',
//           ),
//         )

//         // Button(
//         //   parentColor: placidOrange,
//         //   parentText: '=',
//         // ),
//       ],
//     );
//   }
// }
