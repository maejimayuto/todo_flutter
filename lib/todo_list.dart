import 'package:flutter/material.dart';

import 'package:todo_flutter/edit_todo_dialog.dart';
import 'package:todo_flutter/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  TodoList({@required this.todos, this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Checkbox(
                value: todo.isDone,
                onChanged: (bool isChecked) {
                  onTodoToggle(todo, isChecked);
                },
              ),
              Text(todo.title),
            ],
          ),
        ),
        PopupMenuButton(
          onSelected: (todo) async {
            todos[index] = await showDialog<Todo>(
              context: context,
              builder: (BuildContext context) {
                return EditTodoDialog(todo: todo);
              },
            );
            print(todos[index].title);
          },
          itemBuilder: (context) => [
            // when user tap this item, `todo.title` can be changed.
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
      itemCount: todos.length,
    );
  }
}
