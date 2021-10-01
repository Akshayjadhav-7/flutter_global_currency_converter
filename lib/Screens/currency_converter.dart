import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import '../models/Converter.dart';

// Map<String, String> myMap = {};

Map<String, double> rateMap = {
  'USD': 1,
  'GBP': 3.3,
  'EUR': 5,
  'AUD': 2.2,
};
var result = 0.0;
var result2 = 0.0;

Future<RateModel> fetchrates() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?base=USD&app_id=c0217358131f4f5e981823bd8a42073d'));
  final result = rateModelFromJson(response.body);
  print('fetchrates line 20:${response.body}');
  print('fetchrates:${result.rates}');
  Map<String, double> rateMap = result.rates;
  return result;
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  // var currencies = ['USD', 'GBP', 'EUR', 'AUD'];

  Map<String, double> currenciesMap = {
    'USD': 1,
    'GBP': 3.3,
    'EUR': 5,
    'AUD': 2.2,
  };

  Map<String, double> currenciesMap2 = {
    'USD': 1,
    'GBP': 3.3,
    'EUR': 5,
    'AUD': 2.2,
  };
  String dropdownValue = 'AUD';
  String dropdownValue2 = 'EUR';
  String dropdownValue3 = 'USD';
  // Map<String, dynamic> dropdownValue = {'AUD':2.2};

  TextEditingController usdController = TextEditingController();
  TextEditingController digitValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    'Convert',
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      color: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Convert USD to Any Currency',
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: usdController,
                              decoration: InputDecoration(
                                labelText: 'Enter USD',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue,
                                    items:
                                        // myMap.keys.toSet().toList()

                                        rateMap.keys
                                            .toSet()
                                            .toList()
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        result = usdToAny(usdController.text,
                                            rateMap, dropdownValue);
                                        print('Entered USD: $usdController');
                                        print('result:$result');
                                        print("dropdownvalu: $dropdownValue");
                                      });

                                      print('usdController:$usdController');
                                      print('currency value:$rateMap');
                                    },
                                    child: Text(
                                      'Convert',
                                      style: GoogleFonts.roboto(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(result.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      color: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Convert Any Currency to Any',
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Expanded(
                                    child: TextFormField(
                                      controller: digitValue,
                                      decoration: InputDecoration(
                                        labelText: 'Enter USD',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue2,
                                    items: currenciesMap.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue!;
                                      });
                                    },
                                  ),
                                ),

                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue3,
                                    items: currenciesMap2.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue3 = newValue!;
                                      });
                                    },
                                  ),
                                ),

                                // ElevatedButton(
                                //   onPressed: () {},
                                //   child: Text('Convert'),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                 result2 =  antToAny(
                                      digitValue.text,
                                      currenciesMap,
                                      currenciesMap2,
                                      dropdownValue2,
                                      dropdownValue3);

                                  print(digitValue);
                                });
                              },
                              child: Text('Convert'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(result2.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
