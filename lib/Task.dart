import 'Categorie.dart';

class Task {
  String title;
  DateTime date;
  bool completed;
  Categorie categorie;
  String description;
  bool open;
  Task(String title, DateTime date, bool completed, Categorie categorie,
      String description) {
    this.title = title;
    this.date = date;
    this.completed = completed;
    this.categorie = categorie;
    this.description = description;
    this.open = false;
  }

  bool isOpen() {
    return this.open;
  }

  String getTitle() {
    return this.title;
  }

  DateTime getDate() {
    return this.date;
  }

  bool getCompleted() {
    return this.completed;
  }

  Categorie getCategorie() {
    return this.categorie;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setDate(DateTime date) {
    this.date = date;
  }

  void setCompleted(bool completed) {
    this.completed = completed;
  }

  void setCategorie(Categorie categorie) {
    this.categorie = categorie;
  }

  void openInfo() {
    this.open = !this.open;
  }

  void done() {
    this.completed = !this.completed;
  }
}
