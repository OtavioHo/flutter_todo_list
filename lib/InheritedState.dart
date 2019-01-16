import 'package:flutter/material.dart';
import 'package:flutter_todo_list/Task.dart';
import 'package:flutter_todo_list/Categorie.dart';

class _Inherited extends InheritedWidget {
  _Inherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final TasksInheritedWidgetState data;

  @override
  bool updateShouldNotify(_Inherited oldWidget) {
    return true;
  }
}

class TasksInheritedWidget extends StatefulWidget {
  TasksInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  TasksInheritedWidgetState createState() => TasksInheritedWidgetState();

  static TasksInheritedWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_Inherited) as _Inherited)
        .data;
  }
}

class TasksInheritedWidgetState extends State<TasksInheritedWidget> {
  List<Task> taskList = <Task>[];

  List<Categorie> cats = <Categorie>[
    new Categorie('General', Icon(Icons.check)),
    new Categorie('Business', Icon(Icons.business)),
    new Categorie('Personal', Icon(Icons.contacts)),
  ];

  void addTask(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _Inherited(
      data: this,
      child: widget.child,
    );
  }
}
