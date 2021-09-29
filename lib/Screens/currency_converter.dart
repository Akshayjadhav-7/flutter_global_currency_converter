import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import '../models/Converter.dart';

Map<String, String> myMap = {};


Future<Map> fetchCurrencies() async {
  print('entered fetchCurrencies');
  final response = await http.get(
    Uri.parse(
        'https://openexchangerates.org/api/currencies.json?app_id=c0217358131f4f5e981823bd8a42073d'),
  );

  final finalcurrencies = allCurrenciesFromJson(response.body);
  print("Welcome: line 17: ${response.body}");

  myMap = allCurrenciesFromJson(jsonDecode(response.body),);

  print('myMap:$myMap');
  // allCurrencies.fromJson(jsonDecode(response.body),) as Map<String, dynamic>;
  // print("Welcome: line 18: $welcome");
  return finalcurrencies;
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  var currencies = ['INR', 'USD', 'GBP', 'EUR', 'AUD'];
  // Map<String, dynamic> currenciesMap = {'INR':1.2,'USD':1,'GBP':3.3,'EUR':5,'AUD':2.2};
  String dropdownValue = 'AUD';

  TextEditingController usdController = TextEditingController();

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
                                'USD to Any',
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                            ),
                            TextFormField(
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
                                    items: myMap.keys.toSet().toList()
                                        .map<DropdownMenuItem<String>>((value) {
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
                                        print('Entered USD: $usdController');
                                      });
                                    },
                                    child: Text('Convert'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Result will be shown here'),
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
                                'ANY to ANY',
                                style: GoogleFonts.roboto(fontSize: 28),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue,
                                    items: currencies
                                        .map<DropdownMenuItem<String>>((value) {
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
                                Container(
                                  child: Expanded(
                                    child: TextFormField(
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
                                    value: dropdownValue,
                                    items: currencies
                                        .map<DropdownMenuItem<String>>((value) {
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

                                Container(
                                  child: Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Enter USD',
                                      ),
                                    ),
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
                              onPressed: () {},
                              child: Text('Convert'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Result will be shown here'),
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
