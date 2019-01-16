import 'package:flutter/material.dart';

class Categorie {
  String name;
  Icon icon;
  int taskNumber = 0;

  Categorie(String name, Icon icon) {
    this.name = name;
    this.icon = icon;
  }

  String getName() {
    return this.name;
  }

  Icon getIcon() {
    return this.icon;
  }

  int getTaskNumber() {
    return this.taskNumber;
  }

  void addTask() {
    this.taskNumber++;
  }

  void setName(String name) {
    this.name = name;
  }

  void setIcon(Icon icon) {
    this.icon = icon;
  }
}
