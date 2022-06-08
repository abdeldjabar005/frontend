import 'package:flutter/material.dart';

class PassWord extends StatefulWidget {
  const PassWord({Key? key}) : super(key: key);

  @override
  State<PassWord> createState() => _PassWordState();
}

class _PassWordState extends State<PassWord> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        passw('Password'),
        passw('Confirm Password'),
      ],
    );
  }

  String Password = '';
  bool isPasswordVisible = true;
  Widget passw(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
        obscureText: isPasswordVisible,
      ),
    );
  }
}
