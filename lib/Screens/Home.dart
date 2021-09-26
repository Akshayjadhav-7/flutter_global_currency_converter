import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:global_currency/widgets/listTile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Converter.dart';

List<GetData> api = [];

Future<List<GetData>> apiCall() async {
  print('enteredddddddddddd');
  var response = await http.get(
    Uri.parse(
        'https://openexchangerates.org/api/latest.json?app_id=c0217358131f4f5e981823bd8a42073d'),
  );
  print('responsevvvvvvvvvvvv$response');
  if (response.statusCode != 200) {
    throw Exception('Failed to load album');
  }

  api.add(
    GetData.fromJson(
      jsonDecode(response.body),
    ),
  );

  print('response===${response.body}');
  print('response=======================${api[0].inr}');
  print('response=======================${api[0].aud}');
  print('response=======================${api[0].eur}');
  print('response=======================${api[0].gbp}');
  print(api);
  return api;
}

class Home extends StatefulWidget {
  int selectedIndex = 0;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  late Future<List<GetData>> futureValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureValue = apiCall();
  }

  @override
  Widget build(BuildContext context) {
    var index;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Center(
              child: Text(
            'Global Currency Converter',
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          )),
          // backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/currency.png',
                  height: 350,
                ),
                Text(
                  'Popular',
                  style: TextStyle(fontSize: 15, color: Colors.indigo),
                ),
                Divider(
                  height: 1,
                  color: Colors.blueGrey,
                  indent: 20,
                  endIndent: 20,
                ),
                FutureBuilder(
                    future: futureValue,
                    builder: (context, i) {
                      if (!i.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          Container(
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: api.length,
                              itemBuilder: (context, i) {
                                return CurrencyTile(
                                  inr: api[0].inr,
                                  aud: api[0].aud,
                                  gbp: api[0].gbp,
                                  eur: api[0].eur,
                                );
                              },
                            ),
                          )
                        ],
                      );
                    }),
                BottomNavigationBar(
                    elevation: 1,
                    selectedItemColor: Colors.red,
                    currentIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    // fixedColor: Colors.white,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                          backgroundColor: Colors.white),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.wifi_protected_setup_outlined),
                          label: 'Convert',
                          backgroundColor: Colors.black),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
