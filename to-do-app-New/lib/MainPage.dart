import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/CheckBox.dart';
import 'package:todoapp/provider.dart';
import 'package:todoapp/addTask.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => add(),
            );
          },
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.teal[400],
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ToDoApp ",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Icon(
                  Icons.task_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rCon(
                    "${Provider.of<Pro>(context).tasks.length.toString()} tasks"),
                SizedBox(width: 10), // Add some spacing between the containers
                rCon("${Provider.of<Pro>(context).doneTasks().toString()} Done")
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Container(
                  height: 500,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 12, top: 20),
                  child: Container(
                    height: 450,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Consumer<Pro>(
                      builder: (context, pro, child) {
                        return ListView.builder(
                          itemCount: pro.tasks.length,
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: 60,
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    pro.tasks[i],
                                    style: TextStyle(
                                      color: Colors.teal,
                                      decoration: pro.isChecked[i]
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      checkBox(
                                        isChecked: pro.isChecked[i],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            pro.isChecked[i] = value ?? false;
                                          });
                                        },
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Provider.of<Pro>(context,
                                                  listen: false)
                                              .deleteTask(i);
                                        },
                                        icon: Icon(
                                          Icons.delete_forever_outlined,
                                          color: Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) => add(
                                              index: i,
                                              existingTask: pro.tasks[i],
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  tileColor: Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget rCon(String text) {
  return Container(
    height: 30,
    width: 75,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.teal[400])),
  );
}
