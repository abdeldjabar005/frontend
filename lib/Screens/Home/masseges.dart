import 'package:flutter/material.dart';

class MassegesPage extends StatefulWidget {
  const MassegesPage({Key? key}) : super(key: key);

  @override
  State<MassegesPage> createState() => _MassegesPageState();
}

class _MassegesPageState extends State<MassegesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe9b7ce),
              Color(0xFFffb88e),
              Color(0xFFabc9e9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
