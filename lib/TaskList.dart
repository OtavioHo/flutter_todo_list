import 'package:flutter/material.dart';
import 'package:flutter_todo_list/tabBar.dart';
import 'package:flutter_todo_list/Task.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key key, this.taskList}) : super(key: key);

  final List<Task> taskList;

  @override
  TaskListState createState() => new TaskListState();
}

class TaskListState extends State<TaskList> {
  final Set<int> _openned = new Set<int>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return _buildTaskList();
  }

  Widget _buildTaskList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < widget.taskList.length) {
            return _buildRow(widget.taskList[i], i);
          }
        });
  }

  Widget _buildRow(Task _task, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(_task.getCompleted()
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              onPressed: () => Tabs.of(context).setState(() => _task.done()),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(_task.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    IconButton(
                      icon: Icon(_task.isOpen()
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                      onPressed: () {
                        Tabs.of(context).setState(() {
                          _task.openInfo();
                        });
                      },
                    )
                  ],
                ),
                _taskInfo(_task),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _taskInfo(Task _task) {
    if (_task.isOpen()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            _task.description,
            overflow: TextOverflow.ellipsis,
          ),
          RaisedButton(
            onPressed: () => print('edit'),
            child: Text('edit'),
          )
        ],
      );
    }
    String date = _task.date.toString();
    String year = date.split('-')[0];
    String month = date.split('-')[1];
    String day = date.split('-')[2].split(' ')[0];
    return Text(day + '/' + month + '/' + year);
  }

  bool isOpenned(index) {
    return _openned.contains(index);
  }
}
