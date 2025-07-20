import 'package:hive_flutter/hive_flutter.dart';

class Database {
  //todo Task list
  List toDoTask = [];

  //reference the box(refereence the databse)
  final _mybox = Hive.box("mybox");

  //create startup data
  void createStatupData() {
    toDoTask = [
      ["Add a new task", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoTask = _mybox.get("todolist");
  }

  //update the database
  void updateData() {
    _mybox.put("todolist", toDoTask);
  }
}
