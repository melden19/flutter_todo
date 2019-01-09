import "package:flutter/material.dart";

import "package:todo_list/src/components/ToDoItem.dart";
import "package:todo_list/src/model/model.dart";

class ToDoList extends StatelessWidget {
  final model;
  ToDoList(this.model);
  
  Widget renderTodos(List<ToDo> todos) {
    if (todos.length > 0) return ListView(children: todos.map((todo) => new ToDoItem(
      todo: todo,
      deleteToDo: model.removeTodo,
    )).toList());
    else return Text("There are no todos for now.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Center( 
        child: renderTodos(model.todos)
      ),
    );
  }
}