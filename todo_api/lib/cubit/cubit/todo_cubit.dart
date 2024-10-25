import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:todo_api/model/api_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.context) : super(TodoInitial()) {
    fetchdatas();
  }
  BuildContext context;
  fetchdatas() async {
    final String Url = 'https://dummyjson.com/todos';
    final Uri uri = Uri.parse(Url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body); // Already there to print full JSON response

      final res = jsonDecode(response.body);
      final todos =
          (res['todos'] as List).map((todo) => Todo.fromJson(todo)).toList();

      // Debugging: Print the parsed todos list
      print(todos); // Check if it's not empty or null
      emit(ViewData(data: Todoapi(todos: todos)));
    } else {
      print("Failed to load todos: ${response.statusCode}");
    }
  }
}
