// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Filter { all, active, completed }

class Todo extends Equatable {
  Todo({String? id, required this.desc, this.completed = false})
      : id = id ?? uuid.v4();

  final String id;
  final String desc;
  final bool completed;

  @override
  List<Object> get props => [id, desc, completed];

  @override
  bool get stringify => true;
}
