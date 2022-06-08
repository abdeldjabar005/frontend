import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
  }) : super(key: key);
  final Icon icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 60,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: press,
          color: Colors.white,
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
