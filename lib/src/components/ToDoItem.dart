import "package:flutter/material.dart";

import "package:todo_list/src/model/model.dart";

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final deleteToDo;

  ToDoItem({
    @required this.todo,
    @required this.deleteToDo
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        onPressed: () => deleteToDo(this.todo),
        icon: Icon(Icons.delete),
      ),
      title: Card(
        color: new Color(0xFF616283),
        child: Padding(
          child: Container( 
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                  child: Text(this.todo.title),
                  padding: EdgeInsets.only(bottom: 10)),
              Text(this.todo.data)
            ]),
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
