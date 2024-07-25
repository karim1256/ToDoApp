import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/MainPage.dart';
import 'package:todoapp/OneTask.dart';
import 'package:todoapp/addTask.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider.dart';

void main() {
  runApp(todo());
}

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Pro(),
        child: MaterialApp(
          home: TaskPage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
