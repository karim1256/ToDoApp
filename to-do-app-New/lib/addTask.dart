import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider.dart';

class add extends StatefulWidget {
  final int? index;
  final String? existingTask;

  const add({super.key, this.index, this.existingTask});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController textFieldTask = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingTask != null) {
      textFieldTask.text = widget.existingTask!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            widget.existingTask == null ? "Add Task" : "Edit Task",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            decoration: InputDecoration(hintText: "task"),
            maxLines: 1,
            maxLength: 20,
            controller: textFieldTask,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 80,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                if (widget.existingTask == null) {
                  Provider.of<Pro>(context, listen: false)
                      .addTask(textFieldTask.text);
                } else {
                  Provider.of<Pro>(context, listen: false)
                      .updateTask(widget.index!, textFieldTask.text);
                }
                textFieldTask.clear();
                Navigator.pop(
                    context); // Close the modal after adding or updating a task
              },
              child: Text(
                widget.existingTask == null ? "Add" : "Update",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
