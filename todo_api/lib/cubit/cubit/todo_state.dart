part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class ViewData extends TodoState {
  final Todoapi data; // Assuming you're using Todoapi as the data type

  ViewData({required this.data});
}
