import 'package:flutter/material.dart';

class Pro extends ChangeNotifier {
  List<String> tasks = [];
  List<bool> isChecked = [];
  TextEditingController textFieldTask = TextEditingController();

  void addTask(String task) {
    tasks.add(task);
    isChecked.add(false);
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    isChecked.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, String newTask) {
    tasks[index] = newTask;
    notifyListeners();
  }

  int doneTasks() {
    int done = 0;
    for (bool i in isChecked) {
      if (i == true) {
        done++;
      }
    }
    return done;
  }
}
