import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskState;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskState,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskState,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.blue[300],
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 2.0, color: Colors.white),
                ),
              ),
              //Task name
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: taskState
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
