import 'package:flutter/material.dart';

import 'package:todo_flutter/todo.dart';

class EditTodoDialog extends StatelessWidget {
  final controller = new TextEditingController();
  final Todo todo;

  EditTodoDialog({@required this.todo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit todo'),
      // 初期値のバインドをしたい
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            // コンストラクタで初期化された時の todo を返したい
            Navigator.of(context).pop(todo);
          },
        ),
        FlatButton(
          child: Text('Edit'),
          onPressed: () {
            // これで合っているのか知らんが、
            // 編集後の todo を返したい
            todo.title = controller.value.text;
            controller.clear();

            Navigator.of(context).pop(todo);
          },
        ),
      ],
    );
  }
}
