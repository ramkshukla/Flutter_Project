import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../_utils/helper/response.dart';
import '../model/todo_dto.dart';

abstract class TodoRepository {
  Future<Response<List<TodoDTO>>> getAllTodos();
  Future<Response<Unit>> addTodo(TodoDTO todo);
  Future<Response<Unit>> updateTodo(TodoDTO todo);
  Future<Response<Unit>> removeTodo(TodoDTO todo);
}

class TodoRepositotyImpl implements TodoRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Response<List<TodoDTO>>> getAllTodos() async {
    List<TodoDTO> todos = [];
    final results =
        await firestore.collection('task').orderBy("created_at").get();
    print(results.toString());
    for (var snapshot in results.docs) {
      TodoDTO newTodo = TodoDTO.fromJson(snapshot.data());
      newTodo.id = snapshot.id;
      todos.add(newTodo);
    }
    return right(todos);
  }

  @override
  Future<Response<Unit>> addTodo(TodoDTO todo) async {
    await firestore.collection('task').add(todo.toMap());
    return right(unit);
  }

  @override
  Future<Response<Unit>> updateTodo(TodoDTO todo) async {
    await firestore.collection('task').doc(todo.id).update(todo.toMap());
    return right(unit);
  }

  @override
  Future<Response<Unit>> removeTodo(TodoDTO todo) async {
    await firestore.collection('task').doc(todo.id).delete();
    return right(unit);
  }
}
