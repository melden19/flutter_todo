import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/actions.dart';
import 'package:todo_list/src/redux/reducers.dart';
import 'package:todo_list/src/screens/HomeScreen.dart';
import 'package:todo_list/src/screens/AddTodoScreen.dart';
import 'package:todo_list/src/redux/middleware.dart';

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
      middleware: [
        appStateMiddelware
      ], 
      initialState: AppState.initialState(),
    );

    print('root'); 

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => StoreBuilder<AppState>(
            builder: (BuildContext context, Store<AppState> store) => HomeScreen(),
            onInit: (store) => store.dispatch(GetTodosFromStorage()),
          ),
          '/addTodo': (context) => AddToDoScreen(),
        }
      ),
    );
  }
}