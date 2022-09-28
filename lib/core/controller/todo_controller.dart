import 'package:to_do_list_app/feature/home_page/model/todos_model.dart';
import 'package:to_do_list_app/core/base/repository.dart';

class TodoController {
  final Repository _repository;
  TodoController(this._repository);

  Future<List<TodosModel>?> fetchTodoList() async {
    return _repository.getTodoList();
  }

  Future<bool> updatePutComleted(TodosModel todo, int id) async {
    return _repository.putCompleted(todo, id);
  }

  Future<bool> deleteTodo(int id) async {
    return _repository.deletedTodo(id);
  }

  Future<bool> postTodo(TodosModel todo) async {
    return _repository.postTodo(todo);
  }
}
