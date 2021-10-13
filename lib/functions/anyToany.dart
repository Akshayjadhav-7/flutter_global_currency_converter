import 'package:flutter/material.dart';

double antToAny(String digitValue, Map<String, double> currenciesMap,
    Map<String, double> currenciesMap2, String currency1, String currency2) {



var firstcurr = currenciesMap![currency1];
print('firstCurr: $firstcurr');
var secondcurr = currenciesMap2![currency2];
print('secondcurr: $secondcurr');
 var result =   1/firstcurr! * secondcurr! *double.parse(digitValue);
 print('resultttttt:$result');

return result;
}
