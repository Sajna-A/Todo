// To parse this JSON data, do
//
//     final todoapi = todoapiFromJson(jsonString);

import 'dart:convert';

Todoapi todoapiFromJson(String str) => Todoapi.fromJson(json.decode(str));

String todoapiToJson(Todoapi data) => json.encode(data.toJson());

class Todoapi {
  List<Todo>? todos;
  int? total;
  int? skip;
  int? limit;

  Todoapi({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  factory Todoapi.fromJson(Map<String, dynamic> json) => Todoapi(
        todos: json["todos"] == null
            ? []
            : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": todos == null
            ? []
            : List<dynamic>.from(todos!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
