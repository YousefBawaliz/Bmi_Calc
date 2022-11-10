import 'package:bmi_calculator/ResultsPage.dart';
import 'package:flutter/material.dart';

import 'inputScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(),
      // initialRoute: 'inputScreen',
      home: const CalculatorPage(),
      // routes: {
      //   'resultScreen': (context) => ResultPage(),
      //   'inputScreen': (context) => CalculatorPage()
      // },
    );
  }
}
