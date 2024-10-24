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
      print(response.body);
      final res = jsonDecode(response.body);
      final data = Todo.fromJson(res);
      emit(ViewData(data: data));
    }
  }
}
