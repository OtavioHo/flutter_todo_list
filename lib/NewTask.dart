import 'package:flutter/material.dart';
import 'package:flutter_todo_list/Task.dart';
import 'package:flutter_todo_list/Categorie.dart';
import 'package:flutter_todo_list/InheritedState.dart';

class NewTask extends StatefulWidget {
  @override
  NewTaskState createState() => new NewTaskState();
}

class NewTaskState extends State<NewTask> {
  final _formKey = GlobalKey<FormState>();

  final titleControler = TextEditingController();
  final descriptionController = TextEditingController();

  int categorie = 0;

  @override
  void dispose() {
    titleControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TasksInheritedWidgetState state = TasksInheritedWidget.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.text_fields),
                    hintText: 'Task title',
                    labelText: 'Title'),
                controller: titleControler,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.album), labelText: 'Description'),
                controller: descriptionController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _genRadioBtns(),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  state.addTask(new Task(
                      titleControler.text,
                      new DateTime.now(),
                      false,
                      state.cats[categorie],
                      descriptionController.text));
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _genRadioBtns() {
    final TasksInheritedWidgetState state = TasksInheritedWidget.of(context);
    List<Widget> list = [];
    for (var i = 0; i < state.cats.length; i++) {
      list.add(new Radio(
        value: i,
        groupValue: categorie,
        onChanged: _handleRadioChange,
      ));

      list.add(new Text(state.cats[i].getName()));
    }
    return list;
  }

  void _handleRadioChange(int value) {
    setState(() {
      categorie = value;
    });
  }
}
