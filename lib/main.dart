import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_calculator/screens/calculator_layout.dart';
import 'package:material_calculator/services/computations.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  //TODO : Lock the orientation of app to portrait mode
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (context) => Compute(),child: CalculatorLayout()),
    );
  }
}


//Todo : get default system font and adjust app font accordingly