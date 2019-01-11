import 'package:todo_list/src/model/model.dart';

class AddToDo {
  final ToDo todo;

  AddToDo(this.todo);
}

class RemoveToDo {
  final ToDo todo;

  RemoveToDo(this.todo);
}

class GetTodosFromStorage {}

class AddTodosToStore {
  final List<ToDo> todos;

  AddTodosToStore(this.todos);
}



