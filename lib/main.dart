import 'package:flutter/material.dart';
import 'package:global_currency/Screens/Home.dart';
import 'package:global_currency/Screens/currency_converter.dart';

import 'Screens/practice.dart';

void main() {
  runApp(MaterialApp(
    home: CurrencyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CurrencyApp extends StatefulWidget {
  @override
  _CurrencyAppState createState() => _CurrencyAppState();
}

class _CurrencyAppState extends State<CurrencyApp> {
  @override
  Widget build(BuildContext context) {
    return CurrencyConverter();
  }
}
