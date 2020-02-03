import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String subject;
  bool completed;
  String userId;

  Todo(this.subject, this.userId, this.completed);

  Todo.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.["id"],
        userId = snapshot.["userId"],
        subject = snapshot["subject"],
        completed = snapshot["completed"];

  toJson() {
    return {
      "userId": userId,
      "subject": subject,
      "completed": completed,
    };
  }
}
