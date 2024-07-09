
import 'dialogue_box.dart';
import 'package:flutter/material.dart';
import 'todo_list.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   @override

   List toDoList = [
   ["Make Tutorial", false],
   ["Do Exercise", false],
   ];
  final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }


  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();

  }


  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(
          child: const Text('TO DO',
          style: TextStyle(
            fontSize: 25
          ),),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}