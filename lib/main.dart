import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/reducers.dart';
import 'package:todo_list/src/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ToDo> mockedList = [
      new ToDo(data: "1", title: 'qwe'),
      new ToDo(data: "2", title: 'qwe')
    ];
    final Store<AppState> store = Store<AppState>(
      appReducer,
      // initialState: AppState(todos: mockedList)
      initialState: AppState.initialState()
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: HomeScreen(),
      ),
    );
  }
}