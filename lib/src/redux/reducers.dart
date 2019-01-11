import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/actions.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    todos: todosReducer(state.todos, action)
  );
}

List<ToDo> todosReducer(List<ToDo> state, action) {
  if (action is AddToDo) {
    return []
      ..addAll(state)
      ..add(action.todo);
  }

  if (action is RemoveToDo) {
    return List.unmodifiable(List.from(state)..remove(action.todo));
  }

  if (action is AddTodosToStore) {
    return action.todos;
  }

  return state;
} 