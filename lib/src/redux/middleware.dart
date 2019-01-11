import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_list/src/model/model.dart';
import 'package:todo_list/src/redux/actions.dart';

void saveToPrefs(AppState store) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String string = json.encode(store.toJson());
  var res = await pref.setString('appstate', string);
  print(res);
}    

Future<AppState> loadFromPrefs() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String string = pref.getString('appstate');
  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }
  return AppState.initialState(); 
}

void appStateMiddelware(Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  print('qwe');
  if (action is RemoveToDo ||
      action is AddToDo) {
    saveToPrefs(store.state);
  }

  if (action is GetTodosFromStorage) {
    AppState rehydratedState = await loadFromPrefs();
    store.dispatch(AddTodosToStore(rehydratedState.todos));
  }
}