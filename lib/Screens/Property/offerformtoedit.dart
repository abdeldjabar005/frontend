import 'package:flutter/material.dart';

class OfferFormEdit extends StatefulWidget {
  final int maxLines;
  final String hint;
  final String text;
  final ValueChanged<String> onChanged;

  const OfferFormEdit({
    Key? key,
    this.maxLines = 1,
    required this.hint,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _OfferFormEditState createState() => _OfferFormEditState();
}

class _OfferFormEditState extends State<OfferFormEdit> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          maxLines: widget.maxLines,
        ),
      );
}
