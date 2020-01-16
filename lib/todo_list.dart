import 'package:flutter/material.dart';
import 'package:todo_flutter/todo.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [
    Todo(title: 'Learn Dartasac'),
    Todo(title: 'Try Flutter'),
    Todo(title: 'Be amazed'),
  ];

  _toggleTodo(Todo todo, bool isChecked) {
    print('${todo.title} ${todo.isDone}');
    print('mounted $mounted');
    setState(() {
      todo.isDone = isChecked;
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    print('mounted2 $mounted');

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  @override
  initState() {
    print('mounted4 $mounted');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('mounted3 $mounted');
    return ListView.builder(
      itemBuilder:_buildItem,
      itemCount: todos.length,
    );
  }
}