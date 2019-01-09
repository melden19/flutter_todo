import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/actions.dart';
import 'package:todo_list/src/components/ToDoList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
            appBar: AppBar(title: Text("ToDo application")),
            body: ToDoList(viewModel), 
            floatingActionButton: FloatingActionButton(
              onPressed: () => viewModel.addTodo(new ToDo(data: 'fourth item', title: 'qwe')),
              tooltip: 'Add Todo', 
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}

class _ViewModel {
  final List<ToDo> todos;
  final Function(ToDo) addTodo;
  final Function(ToDo) removeTodo;

  _ViewModel({
    this.todos,
    this.addTodo,
    this.removeTodo
  });

  factory _ViewModel.create(Store<AppState> store) {
    _addTodo(ToDo todo) {
      store.dispatch(AddToDo(todo));
    }

    _removeToDo(ToDo todo) {
      store.dispatch(RemoveToDo(todo));
    }

    return _ViewModel(
      todos: store.state.todos,
      addTodo: _addTodo,
      removeTodo: _removeToDo
    );
  }
}