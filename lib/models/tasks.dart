import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  int position;
  String name;
  String details;
  bool isDone;

  Task({
    this.position,
    this.name,
    this.details,
    this.isDone = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        position: json["position"],
        name: json["name"],
        details: json["details"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toMap() {
    return {
      "position": position,
      "name": name,
      "details": details,
      "isDone": isDone ? 1 : 0,
    };
  }

//  Future<List<Task>> getTasks() async {
//    final List<Task> _taskData = await DBProvider.db.getTask();
//    notifyListeners();
//    return _taskData;
//  }

//  Future<int> getLength() async {
//    var list = await getTasks();
//    int len = list.length;
//    return len;
//  }
}
