import 'package:flutter/material.dart';
import 'package:todo/Widgets/Task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/tasks_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return Dismissible(
                key: UniqueKey(),
            background: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.red,
            child: Align(
            alignment: Alignment.centerRight,
            child: Text(
            'DELETE',
            style: TextStyle(color: Colors.white),
            ),
            ),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
            taskData.deleteTask(task);
            },
            child: TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}