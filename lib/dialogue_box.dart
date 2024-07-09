import 'package:flutter/material.dart';
import 'package:todo/my_buttons.dart';
class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

 const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),


                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}