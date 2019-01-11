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

  ToDo.fromJson(Map json)
    : title = json['title'],
      data = json['data'];
  
  Map toJson() => {
    'title': title,
    'data': data
  };
}

class AppState {
  final List<ToDo> todos;

  AppState({
    @required this.todos
  });

  AppState.initialState() : todos = List.unmodifiable(<ToDo>[]);

  AppState.fromJson(Map json)
    : todos = (json['todos'] as List).map((todo) => ToDo.fromJson(todo)).toList();

  Map toJson() => {'todos': todos};
}