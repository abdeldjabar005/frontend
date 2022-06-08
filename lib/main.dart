import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy2/Screens/Welcome/welcomepage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
