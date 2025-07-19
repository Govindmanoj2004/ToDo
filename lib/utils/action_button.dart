import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  //button name
  final String buttonName;
  //button color
  final Color buttonColor;
  //button method
  VoidCallback onPressed;

  ActionButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      elevation: 0,
      //adding boder radius to a MaterialButton
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Text(buttonName, style: TextStyle(color: Colors.white)),
    );
  }
}
