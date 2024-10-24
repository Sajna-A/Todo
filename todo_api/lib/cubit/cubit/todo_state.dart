part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class ViewData extends TodoState {
  final Todo data;
  ViewData({required this.data});
}
