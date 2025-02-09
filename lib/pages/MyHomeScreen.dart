import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pratikeee/Data/database.dart';
import 'package:pratikeee/components/DialogBox.dart';
import 'package:pratikeee/components/components.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.createinitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _mybox = Hive.box('mybox');
  final _controller = TextEditingController();

  void checkBoxChanged(bool value, int index) {
    setState(() {
      db.todo_List[index][1] = !db.todo_List[index][1];
    });
    db.upgradeDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todo_List.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.upgradeDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            controller: _controller,
            onPressedsave: saveNewTask,
            onPressedcancel: () => Navigator.of(context).pop(),
          );
        });
    db.upgradeDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todo_List.removeAt(index);
    });
    db.upgradeDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow.shade200,
          onPressed: createNewTask,
          child: Icon(Icons.add)),
      body: ListView.builder(
        itemCount: db.todo_List.length,
        itemBuilder: (context, index) {
          return Todotile(
            Taskname: db.todo_List[index][0],
            Taskcompleted: db.todo_List[index][1],
            onChanged: (value) => checkBoxChanged(value!, index),
            deletedFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
