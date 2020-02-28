import 'package:flutter/material.dart';
import 'package:material_calculator/Screens/calculator.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<Display>(
        create: (context) => Display(),
        child: Calculator(),
      ),
    );
  }
}

class Display extends ChangeNotifier {
  String _displayText = '0';

  getDisplay() => _displayText;

  appendDisplay(String displayText) {
    //_displayText = _displayText+displayText;
    _displayText == '0' ? _displayText = displayText : _displayText = _displayText+displayText;
    notifyListeners();
  }

  updateDisplay(String displayText) {
    displayText == '' ? _displayText = '0' : _displayText = displayText;
    notifyListeners();
  }
}
