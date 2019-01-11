import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/actions.dart';
import 'package:todo_list/src/components/ToDoList.dart';

class AddToDoScreen extends StatefulWidget {
  final Function(ToDo) createTodo;

  AddToDoScreen({this.createTodo});

  @override
    State<StatefulWidget> createState() => AddToDoScreenState();
}

class AddToDoScreenState extends State<AddToDoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createToDo() {
    widget.createTodo(new ToDo(
      title: titleController.text,
      data: descriptionController.text
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Create ToDo")),
        body: Container(
          margin: EdgeInsets.all(40),
          child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(1, 0, 0, 0),
                  labelText: "Title" 
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(1, 0, 0, 0),
                    labelText: "Description" 
                  ),
                ), 
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  onPressed: createToDo,
                  child: Text("Create Todo"),
                )
              ),
            ],
          ),
        ), 
      );
  }
} 