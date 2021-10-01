// import 'package:flutter/material.dart';
//
// // var no1 = TextEditingController();
// // var no2 = TextEditingController();
//
// int firstfield = 0;
// int secondfield = 0;
// class CheckValue extends StatefulWidget {
//
//
//   @override
//   _CheckValueState createState() => _CheckValueState();
// }
//
// class _CheckValueState extends State<CheckValue> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: Container(
//             child: Column(
//               children: [
//                 TextFormField(
//                   // controller: no1,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Number',
//                   ),
//                   onChanged: (value){
//                     firstfield = value as int;
//                   },
//                 ),
//                 TextFormField(
//                   // controller: no2,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Enter Number',
//                   ),
//                   onChanged: (value){
//
//                     secondfield = value as int;
//                   },
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       print(firstfield);
//                       print(secondfield);
//
//                       calculate(firstfield, secondfield);
//
//                     });
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// int calculate(int number1, int number2){
//
//   var answer;
//   answer = number1 * number2;
//   print(answer);
//   return answer;
//
// }
