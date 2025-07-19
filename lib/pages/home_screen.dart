import 'package:flutter/material.dart';
import 'package:todo/utils/todo_tile.dart';
import 'package:todo/utils/dialog_box.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //task list
  List toDoTask = [];

  //Task state change method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoTask[index][1] = !toDoTask[index][1];
    });
  }

  //new task controller
  final _controller = TextEditingController();

  //Add new task
  void newTaskSave() {
    setState(() {
      toDoTask.add([_controller.text, false]);
      //close alertbox
      Navigator.of(context).pop();
    });
  }

  //create new task
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
      toDoTask.removeAt(index);
    });
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
        itemCount: toDoTask.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoTask[index][0],
            taskState: toDoTask[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
