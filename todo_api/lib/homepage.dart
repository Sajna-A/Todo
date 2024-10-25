import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_api/cubit/cubit/todo_cubit.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  get data => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TODO")),
      ),
      body: BlocProvider(
        create: (context) => TodoCubit(context),
        child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
          final cubit = context.read<TodoCubit>();
          return Column(children: [
            state is ViewData
                ? Expanded(
                    child: ListView.builder(
                      itemCount: state.data.todos?.length ??
                          0, // Access length of the todos list
                      itemBuilder: (context, index) {
                        final todo = state
                            .data.todos![index]; // Access individual todo items

                        return ListTile(
                          title: Text(
                              todo.todo ?? "No Title"), // Access todo title
                          subtitle:
                              Text(todo.userId.toString()), // Access userId
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator()
          ]);
        }),
      ),
    );
  }
}
