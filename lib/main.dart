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
  TextEditingController _taskController = TextEditingController();
  int editingIndex = -1; // To track the task being edited

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _taskController,
          onSubmitted: (newTask) {
            if (editingIndex == -1) {
              setState(() {
                tasks.add(newTask);
                _taskController.clear();
              });
            } else {
              setState(() {
                tasks[editingIndex] = newTask;
                _taskController.clear();
                editingIndex = -1;
              });
            }
          },
          decoration: InputDecoration(
            hintText: 'Enter a to-do task ',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index]),
              subtitle: Text('This is a task'),
              leading: CircleAvatar(),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          _taskController.text = tasks[index];
                          editingIndex = index;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}
