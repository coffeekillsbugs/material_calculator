import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_calculator/screens/calculator_layout.dart';
import 'package:material_calculator/screens/other_layout.dart';
import 'package:material_calculator/services/computations.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtherLayout(),
      //ChangeNotifierProvider(create: (context) => Compute(),child: CalculatorLayout()),
    );
  }
}