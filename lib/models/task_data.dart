import 'package:check_it_fixed_version/utils/database.dart';
import 'package:flutter/material.dart';
import 'tasks.dart';

class Data extends ChangeNotifier {
  List<Task> tasks = [];
  int toDoNumber = 0;

//  getTasks() {
//    List<Task> oldTasks = DBProvider.db.getTasks();
//    for (Task task in oldTasks) {
//      tasks.insert(oldTasks.indexOf(task), task);
//    }
//    notifyListeners();
//  }

  void newTask({String name, details}) {
    Task newTask =
        Task(position: 0, name: name, details: details, isDone: false);
    tasks.insert(0, newTask);
    for (Task task in tasks) {
      print(tasks.indexOf(task));
      task.position = tasks.indexOf(task);
    }

    getToDoNumber();
    notifyListeners();
    DBProvider.db.saveTasks(tasks);
  }

  void reorderItems(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    Task item = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, item);
    setPosition();
    notifyListeners();
    DBProvider.db.saveTasks(tasks);
  }

  void getToDoNumber() {
    int counter = 0;
    for (var i in tasks) {
      !i.isDone ? counter++ : counter = counter;
    }
    toDoNumber = counter;
  }

  void removeItem(index) {
    tasks.removeAt(index);
    notifyListeners();
    setPosition();
    DBProvider.db.saveTasks(tasks);
    getToDoNumber();
  }

  void changeTitle({index, title}) {
    tasks[index].name = title;
    DBProvider.db.saveTasks(tasks);
  }

  void changeDetails({index, details}) {
    tasks[index].details = details;
    DBProvider.db.saveTasks(tasks);
  }

  void toggleDone(index) {
    tasks[index].isDone = !tasks[index].isDone;
    DBProvider.db.saveTasks(tasks);
    getToDoNumber();
    notifyListeners();
  }

  void setPosition() {
    for (Task task in tasks) {
      task.position = tasks.indexOf(task);
    }
  }
}
