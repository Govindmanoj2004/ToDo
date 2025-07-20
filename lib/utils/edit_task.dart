import 'package:flutter/material.dart';
import 'package:todo/utils/action_button.dart';

// ignore: must_be_immutable
class EditTask extends StatelessWidget {
  //methods
  void Function() onCancel;
  void Function() onEdit;
  final controller;

  EditTask({
    super.key,
    required this.onCancel,
    required this.onEdit,
    required this.controller,
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
                hint: Text("New Task name", textAlign: TextAlign.left),
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
                  buttonName: "Edit",
                  onPressed: onEdit,
                  buttonColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
