import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import '../functions/usdToany.dart';
import '../functions/anyToany.dart';

var result = 0.0;
var result2 = 0.0;

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String dropdownValue = 'AUD';
  String dropdownValue2 = 'EUR';
  String dropdownValue3 = 'USD';

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
                        GoogleFonts.roboto(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
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
                                style: GoogleFonts.roboto(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: usdController,
                              decoration: InputDecoration(
                                labelText: 'Enter USD',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue,
                                    items: rateMap.keys
                                        .toSet()
                                        .toList()
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      print("13444444444444444444444444444444");
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
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.orange,
                                    ),
                                    onPressed: () {
                                      print(
                                          'onPressed currencyConverter :$rateMap');

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
                              height: 15,
                            ),
                            Text(
                              result.toStringAsFixed(4),
                              style: GoogleFonts.roboto(fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
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
                                style: GoogleFonts.roboto(fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: digitValue,
                                      decoration: InputDecoration(
                                        labelText: 'Enter Number',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DropdownButton(
                                    value: dropdownValue2,
                                    items: rateMap.keys
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
                                    items: rateMap.keys
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
                              ],
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                ),
                                onPressed: () {
                                  setState(() {
                                    result2 = antToAny(
                                        digitValue.text,
                                        rateMap,
                                        rateMap,
                                        dropdownValue2,
                                        dropdownValue3);

                                    print(digitValue);
                                  });
                                },
                                child: Text(
                                  'Convert',
                                  style: GoogleFonts.roboto(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(result2.toStringAsFixed(4),
                                style: GoogleFonts.roboto(fontSize: 28)),
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
