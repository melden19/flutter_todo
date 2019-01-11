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
    return Dismissible(

      key: Key(todo.title),
      onDismissed: (direction) {
        deleteToDo(this.todo);
        Scaffold
        .of(context)
        .showSnackBar(SnackBar(content: Text("${todo.title} removed"))); 
      },
      background: Center(
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.delete_sweep)
            )
          ] 
        ),
      ),
      direction: DismissDirection.endToStart, 
      child: ListTile(
        // trailing: IconButton(
        //   onPressed: () => deleteToDo(this.todo),
        //   icon: Icon(Icons.delete),
        // ),
        title: Card(
          elevation: 10, 
          color: new Color(0xFFCDEDFB), 
          child: Padding(
            child: Container( 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    child: Text(
                      this.todo.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: <Shadow>[ Shadow(blurRadius: 2, color: Color(0xFF97F9F9)) ],
                      ),
                    ),
                    padding: EdgeInsets.only(bottom: 10)
                  ),
                  Text(this.todo.data, style: TextStyle(color: Colors.black))
                ]
              ), 
            ),
            padding: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
