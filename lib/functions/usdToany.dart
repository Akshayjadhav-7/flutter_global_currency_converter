import 'package:flutter/material.dart';

double usdToAny(
    String usdController, Map<String, double> rateMap, String currency) {
  var answer = 0.0;
  double? curr = 0.0;
  curr = rateMap[currency];
// answer = 100.0;
  answer = double.parse(usdController) * curr!;
  print('currencyMap:$rateMap');
  print('currenciesMap[currency] : ${rateMap[currency]}');
  return answer;
}
