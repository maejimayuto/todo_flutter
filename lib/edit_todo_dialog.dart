import 'package:flutter/material.dart';

import 'package:todo_flutter/todo.dart';

class EditTodoDialog extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();
  final Todo todo;

  EditTodoDialog({@required this.todo}) {
    this.controller.text = todo.title;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(todo);
          },
        ),
        FlatButton(
          child: Text('Edit'),
          onPressed: () {
            todo.title = controller.value.text;
            controller.clear();

            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
