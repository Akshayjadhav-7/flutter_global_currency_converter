import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:global_currency/widgets/listTile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../models/Converter.dart';
import '../screens/currency_converter.dart';

List<GetData> api = [];
Map<String, double> rateMap = {};

Future<Map<String, double>> fetchRates() async {
  var response = await http.get(Uri.parse(
      'https://openexchangerates.org/api/latest.json?base=USD&app_id=c0217358131f4f5e981823bd8a42073d'));
  final result = rateModelFromJson(response.body);
  print('fetchrates line 20:${response.body}');
  print('fetchrates:${result.rates}');
  rateMap = result.rates;
  print('rateMap line no23 Home:$rateMap');
  return rateMap;
}

Future<List<GetData>> apiCall() async {
  print('enteredddddddddddd');
  var response = await http.get(
    Uri.parse(
        'https://openexchangerates.org/api/latest.json?app_id=c0217358131f4f5e981823bd8a42073d'),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to load album');
  }
  api.add(
    GetData.fromJson(
      jsonDecode(response.body),
    ),
  );
  print('response===Home Page line 32${response.body}');
  print(api);
  return api;
}

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Widget>> _pages;
  int _selectedPageIndex = 0;

  initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': CurrencyConverter(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange.shade300,
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.wifi_protected_setup_outlined,
            ),
            label: 'Convert Currency',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<GetData>> futureValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureValue = apiCall();
    // fetchCurrencies();
    // futureMap =
    fetchRates();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.orange,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'Global Currency Converter',
              style: GoogleFonts.roboto(fontSize: 25, color: Colors.white),
            )),
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/currencyRB.png',
                    height: 300,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white70,
                    indent: 100,
                    endIndent: 100,
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
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
