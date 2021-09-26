import 'package:flutter/material.dart';
import 'package:global_currency/Screens/Home.dart';

void main() {
  runApp(CurrencyApp());
}

class CurrencyApp extends StatefulWidget {
  @override
  _CurrencyAppState createState() => _CurrencyAppState();
}

class _CurrencyAppState extends State<CurrencyApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
