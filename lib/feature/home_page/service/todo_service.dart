import 'package:dio/dio.dart';
import 'package:to_do_list_app/feature/home_page/model/todos_model.dart';
import 'package:to_do_list_app/core/base/repository.dart';
import 'package:to_do_list_app/product/utlis/const.dart';

class TodoService implements Repository {
  final Dio _dio;
  TodoService() : _dio = Dio(BaseOptions(baseUrl: ApiConst.todoUrl));

  @override
  Future<List<TodosModel>?> getTodoList() async {
    try {
      final response = await _dio.get(ApiConst.todopath);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          return data.map((e) => TodosModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (_) {
      return null;
    }

    return null;
  }

  @override
  Future<bool> postTodo(TodosModel todo) async {
    try {
      final response = await _dio.post(ApiConst.todopath, data: todo);

      return response.statusCode == 201;
    } on DioError catch (_) {}
    return true;
  }

  @override
  Future<bool> putCompleted(TodosModel todo, int id) async {
    try {
      final response =
          await _dio.put('${ApiConst.todopath}/${id + 1}', data: todo);

      return response.statusCode == 200;
    } on DioError catch (_) {}
    return false;
  }

  @override
  Future<bool> deletedTodo(int id) async {
    try {
      final response = await _dio.delete('${ApiConst.todopath}/$id');

      return response.statusCode == 200;
    } on DioError catch (_) {}
    return false;
  }
}
