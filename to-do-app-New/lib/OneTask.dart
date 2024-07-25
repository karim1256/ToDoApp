/*import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/MainPage.dart';
import 'package:todoapp/CheckBox.dart';
import 'package:todoapp/Logic.dart';

class Onetask extends StatefulWidget {
  Onetask({super.key, int? i});

  @override
  State<Onetask> createState() => _OnetaskState();
}

class _OnetaskState extends State<Onetask> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            title: Text(Tasks.tasks.toString(),
                style: TextStyle(
                  color: Colors.teal,
                )),
            trailing: Checkbox(
                value: isChecked,
                onChanged: (newvalue) {
                  setState(() {
                    isChecked = newvalue;
                  });
                }),
            tileColor: Colors.white));
  }
}
*/
