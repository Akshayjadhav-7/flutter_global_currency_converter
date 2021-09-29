import 'package:flutter/material.dart';
import 'dart:convert';

class GetData {
  final double inr;
  final double aud;
  final double eur;
  final double gbp;
  GetData({
    required this.inr,
    required this.aud,
    required this.eur,
    required this.gbp,
  });

  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      inr: json['rates']['INR'],
      aud: json['rates']['AUD'],
      eur: json['rates']['EUR'],
      gbp: json['rates']['GBP'],
    );
  }
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Map<String, String> allCurrenciesFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allCurrenciesToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
