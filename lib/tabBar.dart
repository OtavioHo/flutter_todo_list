import 'package:flutter/material.dart';
import 'package:flutter_todo_list/TaskList.dart';
import 'package:flutter_todo_list/Task.dart';
import 'package:flutter_todo_list/NewTask.dart';
import 'package:flutter_todo_list/InheritedState.dart';

class Tabs extends StatefulWidget {
  Tabs({
    Key key,
    this.title,
  }) : super(key: key);

  final Text title;

  static TabsState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<TabsState>());

  @override
  TabsState createState() => new TabsState();
}

class CategorieView extends StatelessWidget {
  CategorieView({Key key, this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final TasksInheritedWidgetState state = TasksInheritedWidget.of(context);

    return new TabBarView(
      controller: tabController,
      children: []..addAll(
          state.cats.map((cat) {
            return new TaskList(
              taskList: state.taskList
                  .where((task) => task.categorie.name == cat.name)
                  .toList(),
            );
          }),
        ),
    );
  }
}

class CategorieTabs extends StatelessWidget implements PreferredSizeWidget {
  CategorieTabs({Key key, this.tabController}) : super(key: key);

  final tabController;

  @override
  Widget build(BuildContext context) {
    final TasksInheritedWidgetState state = TasksInheritedWidget.of(context);

    return new TabBar(
        controller: tabController,
        tabs: []..addAll(state.cats.map((cat) => Tab(
              icon: cat.getIcon(),
            ))));
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(45.0);
  }
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        bottom: CategorieTabs(
          tabController: _tabController,
        ),
        title: this.widget.title,
      ),
      body: new CategorieView(
        tabController: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openNewTask();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future _openNewTask() async {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new NewTask();
        },
        fullscreenDialog: true));
  }
}
