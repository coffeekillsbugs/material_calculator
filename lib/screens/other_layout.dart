import 'package:flutter/material.dart';
import 'package:material_calculator/theme/colors.dart';

class OtherLayout extends StatefulWidget {
  @override
  _OtherLayoutState createState() => _OtherLayoutState();
}

class _OtherLayoutState extends State<OtherLayout> {
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
                  colors: [notSoWhite, Colors.orangeAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.only(right: width * 0.2, left: width * 0.05),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '100+200+300+400=10000',
                        style: TextStyle(
                          color: baffllingBlue,
                          fontSize: 30.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ],
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10.0, bottom: 10.0,),
            )
          ),
          //* ---> Backspace Button <--- *//
          Padding(
            padding: EdgeInsets.only(top: height * 0.28,bottom: height * 0.625),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: width * 0.15,
                decoration: BoxDecoration(
                  color: otherBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Column(
//         children: <Widget>[
//           //* ---> History Display <--- *//
//           Container(
//             width: double.infinity,
//             height: height * 0.28,
//             decoration: BoxDecoration(
//               color: baffllingBlue,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30.0),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black,
//                   offset: Offset(3.0, 0.0),
//                   spreadRadius: 5.0,
//                   blurRadius: 5.0,
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: height * 0.095,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//             ),
//             child: Stack(
//               children: <Widget>[
//                 //* ---> Active Display <--- *//
//                 Container(
//                   width: double.infinity,
//                   height: height * 0.095,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [notSoWhite, Colors.orangeAccent],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                     ),
//                   ),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(
//                             right: width * 0.2, left: width * 0.05),
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             '100+200+300+400=10000',
//                             style: TextStyle(
//                               color: baffllingBlue,
//                               fontSize: 40.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //* ---> Backspace Button <--- *//
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     width: width * 0.15,
//                     decoration: BoxDecoration(
//                       color: otherBlue,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10.0),
//                         bottomLeft: Radius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: height * 0.625,
//             decoration: BoxDecoration(
//               //color: Colors.transparent,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//               ),
//               gradient: LinearGradient(
//                 colors: [baffllingBlue, otherBlue],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//         ],
//       ),
