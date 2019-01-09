import 'package:flutter/material.dart';
import 'Task.dart';

class TaskList extends StatefulWidget {
  @override
  TaskListState createState() => new TaskListState();
}

class TaskListState extends State<TaskList> {
  final List<Task> _tasks = [
    new Task('um', new DateTime(2019), false),
    new Task('dois', new DateTime(2019), false),
    new Task('tres', new DateTime(2019), false),
    new Task('quatro', new DateTime(2019), false)
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildTaskList();
  }

  Widget _buildTaskList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2; /*3*/
          if (index < _tasks.length) {
            return _buildRow(_tasks[index], index);
          }
        });
  }

  Widget _buildRow(Task _task, int index) {
    return ListTile(
      title: Text(
        _task.getTitle(),
        style: _biggerFont,
      ),
      trailing: new Icon(_task.getCompleted()
          ? Icons.check_box
          : Icons.check_box_outline_blank),
      onTap: () {
        setState(() {
          if (_task.getCompleted()) {
            _task.setCompleted(false);
          } else {
            _task.setCompleted(true);
          }
        });
      },
    );
  }
}
