import 'package:flutter/material.dart';

import 'package:todo_flutter/edit_todo_dialog.dart';
import 'package:todo_flutter/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  const TodoList({this.todos, this.onTodoToggle});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  _updateTodo(todo, index) async {
    final updatedTodo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return EditTodoDialog(todo: todo);
      },
    );

    setState(() {
      widget.todos[index] = updatedTodo;
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = widget.todos[index];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Checkbox(
                value: todo.isDone,
                onChanged: (bool isChecked) {
                  widget.onTodoToggle(todo, isChecked);
                },
              ),
              Text(todo.title),
            ],
          ),
        ),
        PopupMenuButton(
          onSelected: (dynamic selected) => _updateTodo(todo, index),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: todo,
              child: Text("edit"),
            ),
            // when user tap this item, `todo.title` can be deleted.
            PopupMenuItem(
              value: todo,
              child: Text("delete"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: widget.todos.length,
    );
  }
}
