import 'package:flutter/material.dart';

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
