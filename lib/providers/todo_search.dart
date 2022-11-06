// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TodoSearchState extends Equatable {
  const TodoSearchState({required this.searchTerm});

  final String searchTerm;
  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: 'searchTerm');
  }

  @override
  List<Object> get props => [searchTerm];

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  bool get stringify => true;
}

class TodoSearch with ChangeNotifier {
  TodoSearchState _state = TodoSearchState.initial();
  TodoSearchState get state => _state;

  void setSearchTerm(String newSearchTerm) {
    _state = _state.copyWith(searchTerm: newSearchTerm);
    notifyListeners();
  }
}
