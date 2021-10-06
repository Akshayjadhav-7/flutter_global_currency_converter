import 'package:flutter/material.dart';

double antToAny(String digitValue, Map<String, double> currenciesMap,
    Map<String, double> currenciesMap2, String currency1, String currency2) {
  var answer2 = 0.0;

  var curr = currenciesMap[currency1];
  answer2 = double.parse(digitValue) * curr!;

  var answer3 = 0.0;
  var curr2 = currenciesMap2[currency2];
  answer3 = answer2 * curr2!;

  return answer3;
}
