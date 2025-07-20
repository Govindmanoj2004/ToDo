import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utils/todo_tile.dart';
import 'package:todo/utils/dialog_box.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //reference the database class
  Database db = Database();

  //object for databse
  final _mybox = Hive.box("mybox");

  //initalize the data
  @override
  void initState() {
    //first time openingthe app,the create the demo data
    if (_mybox.get("todolist") == null) {
      db.createStatupData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //Task state change method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoTask[index][1] = !db.toDoTask[index][1];
    });
    db.updateData();
  }

  //new task controller
  final _controller = TextEditingController();

  //Add new task
  void newTaskSave() {
    setState(() {
      db.toDoTask.add([_controller.text, false]);
      //close alertbox
      Navigator.of(context).pop();
      if (!db.toDoTask[0][1]) {
        if (db.toDoTask[0][0] == "Add a new task") {
          db.toDoTask[0][1] = !db.toDoTask[0][1];
        }
      }
    });
    db.updateData();
    _controller.clear();
  }

  //create new task(Dialog)
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: Navigator.of(context).pop,
          onSave: newTaskSave,
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoTask.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "TODO",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue[300],
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: db.toDoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoTask[index][0],
            taskState: db.toDoTask[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
