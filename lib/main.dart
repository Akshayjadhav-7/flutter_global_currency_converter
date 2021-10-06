import 'package:flutter/material.dart';
import 'package:global_currency/screens/home.dart';
import 'package:global_currency/screens/currency_converter.dart';

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
    return TabsScreen();
  }
}
