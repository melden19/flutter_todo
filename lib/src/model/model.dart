import 'package:flutter/foundation.dart';

class ToDo {
  final String title;
  final String data;

  ToDo({
    @required this.title,
    @required this.data
  });

  ToDo copyWith({ String title, String data }) {
    return ToDo(
      title: title ?? this.title,
      data: data ?? this.data
    );
  }
}

class AppState {
  final List<ToDo> todos;

  AppState({
    @required this.todos
  });

  AppState.initialState() : todos = List.unmodifiable(<ToDo>[]);
}