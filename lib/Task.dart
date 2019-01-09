class Task {
  String title;
  DateTime date;
  bool completed;
  Task(String title, DateTime date, bool completed) {
    this.title = title;
    this.date = date;
    this.completed = completed;
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

  void setTitle(String title) {
    this.title = title;
  }

  void setDate(DateTime date) {
    this.date = date;
  }

  void setCompleted(bool completed) {
    this.completed = completed;
  }
}
