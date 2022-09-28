import 'package:to_do_list_app/feature/home_page/model/todos_model.dart';

abstract class Repository {
  Future<List<TodosModel>?> getTodoList();

  Future<bool> putCompleted(TodosModel todo, int id);

  Future<bool> deletedTodo(int id);

  Future<bool> postTodo(TodosModel todo);
}
