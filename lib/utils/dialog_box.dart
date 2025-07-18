import 'package:flutter/material.dart';
import 'package:todo/utils/action_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  //controller for new task (from home_screen)
  final controller;

  //actionButton methods
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hint: Text("New Task", textAlign: TextAlign.left),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            //Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //cancel button
                ActionButton(
                  buttonName: "Cancel",
                  onPressed: onCancel,
                  buttonColor: Colors.redAccent,
                ),
                //Add button
                ActionButton(
                  buttonName: "Add",
                  onPressed: onSave,
                  buttonColor: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
