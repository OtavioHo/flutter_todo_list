import 'package:flutter/material.dart';
import 'TaskList.dart';

class Tabs extends StatelessWidget {
  Tabs({
    Key key,
    this.tabLength,
    this.title,
  }) : super(key: key);

  final int tabLength;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.tabLength,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ]),
          title: this.title,
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            TaskList(),
          ],
        ),
      ),
    );
  }
}
