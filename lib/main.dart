import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do List App'),
          backgroundColor: Colors.blueGrey[900],
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cinzel',
            letterSpacing: 3,
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: TaskList(),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = [];
  TextEditingController _taskController =
      TextEditingController(); // Add a TextEditingController

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _taskController, // Assign the controller to the TextField

          onSubmitted: (newTask) {
            setState(() {
              tasks.add(newTask);
              _taskController.clear(); // Clear the text field
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter a task',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
