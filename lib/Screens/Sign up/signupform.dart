// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:xy2/PassConf.dart';

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({Key? key}) : super(key: key);

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         buildInputForm('First Name', firstName),
//         buildInputForm('Last Name', lastName),
//         buildInputForm('Email', email),
//         buildInputForm('Phone', phone),
//         const PassWord(),
//       ],
//     );
//   }

//   Padding buildInputForm(String hint, TextEditingController value2) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5),
//       child: TextFormField(
//           controller: value2,
//           decoration: InputDecoration(
//             fillColor: Colors.white,
//             filled: true,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             hintText: hint,
//             hintStyle: TextStyle(
//               color: Colors.grey,
//             ),
//           ),
//           onEditingComplete: () => FocusScope.of(context).nextFocus(),
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'please write your $hint';
//             } else {
//               return null;
//             }
//           }),
//     );
//   }
// }
