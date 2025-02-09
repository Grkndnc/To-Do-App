import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todo_List = [];

  final _mybox = Hive.box('mybox');

  void createinitialData() {
    todo_List = [
      ['Work Hard', false],
      ['Do Exercise', false]
    ];
  }

  void loadData() {
    _mybox.get('TODOLIST');
  }

  void upgradeDataBase() {
    _mybox.put('TODOLIST', todo_List);
  }
}
