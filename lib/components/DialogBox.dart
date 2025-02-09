import 'package:flutter/material.dart';
import 'MyButton.dart';

class Dialogbox extends StatelessWidget {
  Dialogbox(
      {super.key,
      required this.onPressedcancel,
      required this.onPressedsave,
      required this.controller});

  final controller;
  VoidCallback onPressedsave;
  VoidCallback onPressedcancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user inputs
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Please Type in a activity..',
                  border: OutlineInputBorder()),
            ),
            // 2 buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: 'Save', onPressed: onPressedsave),
                SizedBox(
                  width: 10,
                ),
                Mybutton(text: 'Cancel', onPressed: onPressedcancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
