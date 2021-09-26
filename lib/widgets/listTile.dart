import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyTile extends StatelessWidget {
  final double inr;
  final double gbp;
  final double aud;
  final double eur;

  CurrencyTile({required this.inr,required this.gbp, required this.aud,required this.eur});
  // required this.aud,required this.eur,required this.gbp

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          title: Text('🇺🇸 USD => 🇮🇳 INR'),
          subtitle: Text('1 USD = $inr INR',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
        ), Divider(
          height: 1,
          color: Colors.blueGrey,
          indent: 20,
          endIndent: 20,
        ),

        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          title: Text('🇺🇸 USD => 🇬🇧 GBP'),
          subtitle: Text('1 USD = $gbp GBP',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
        ), Divider(
          height: 1,
          color: Colors.blueGrey,
          indent: 20,
          endIndent: 20,
        ),

        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          title: Text('🇺🇸USD => 🇦🇺 AUD'),
          subtitle: Text('1 USD = $aud AUD',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
        ), Divider(
          height: 1,
          color: Colors.blueGrey,
          indent: 20,
          endIndent: 20,
        ),

        ListTile(
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          title: Text('🇺🇸USD => 🇺🇳 EUR'),
          subtitle: Text('1 USD = $eur EUR',style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
        ),
      ],
    );
  }
}
