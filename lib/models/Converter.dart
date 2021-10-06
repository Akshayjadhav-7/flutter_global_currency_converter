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





// To parse this JSON data, do
//
//     final rateModel = rateModelFromJson(jsonString);

RateModel rateModelFromJson(String str) => RateModel.fromJson(json.decode(str));

String rateModelToJson(RateModel data) => json.encode(data.toJson());

class RateModel {
  RateModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
