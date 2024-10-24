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
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            final cubit = context.read<TodoCubit>();
            return Column(children: [
              state is ViewData
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          cubit.fetchdatas();

                          return ListTile(
                            title: Text(state.data.id.toString()),
                            subtitle: Text(state.data.userId.toString()),
                          );
                        },
                      ),
                    )
                  : CircularProgressIndicator()
            ]);
          },
        ),
      ),
    );
  }
}
