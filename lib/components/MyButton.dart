import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  Mybutton({super.key, required this.text, required this.onPressed});

  VoidCallback onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(text),
      onPressed: onPressed,
      color: Colors.yellow.shade200,
    );
  }
}
