// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:todo_provider/models/todo_model.dart';
import 'package:todo_provider/providers/todo_filter.dart';
import 'package:todo_provider/providers/todo_list.dart';
import 'package:todo_provider/providers/todo_search.dart';

class FilteredTodoState extends Equatable {
  const FilteredTodoState({
    required this.filteredTodos,
  });
  final List<Todo> filteredTodos;

  factory FilteredTodoState.initial() {
    return const FilteredTodoState(filteredTodos: []);
  }

  @override
  List<Object> get props => [filteredTodos];

  FilteredTodoState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodoState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  bool get stringify => true;
}

class FilteredTodos with ChangeNotifier {
  FilteredTodoState _state = FilteredTodoState.initial();
  FilteredTodoState get state => _state;

  void update(
    TodoFilter todoFilter,
    TodoSearch todoSearch,
    TodoList todoList,
  ) {
    List<Todo> filteredTodos;
    switch (todoFilter.state.filter) {
      case Filter.all:
        filteredTodos = todoList.state.todos;
        break;
      case Filter.active:
        filteredTodos =
            todoList.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        filteredTodos =
            todoList.state.todos.where((Todo todo) => todo.completed).toList();
        break;
    }
    if (todoSearch.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearch.state.searchTerm.toLowerCase()))
          .toList();
    }
    print(filteredTodos);
    _state = _state.copyWith(filteredTodos: filteredTodos);
    notifyListeners();
  }
}
