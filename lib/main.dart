import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/home_screen.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open a box(box is the term used in flutter for db,create database)
  var box = await Hive.openBox("mybox");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
