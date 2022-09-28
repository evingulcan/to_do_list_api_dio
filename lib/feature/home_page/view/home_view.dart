import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constants/app_colors.dart';
import 'package:to_do_list_app/core/constants/app_string.dart';
import 'package:to_do_list_app/core/constants/duration_items.dart';
import 'package:to_do_list_app/core/controller/todo_controller.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/feature/home_page/model/todos_model.dart';
import 'package:to_do_list_app/feature/home_page/service/todo_service.dart';

import 'package:to_do_list_app/product/utlis/component/call_container.dart';
import 'package:to_do_list_app/product/utlis/component/custom_divider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoController = TodoController(TodoService());
    todoController.fetchTodoList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringConstant.appBar,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: AppColors.black,
                ),
          ),
        ),
        body: FutureBuilder<List<TodosModel>?>(
          future: todoController.fetchTodoList(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    var todo = snapshot.data?[index];
                    return SizedBox(
                      height: context.maxValue,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                  backgroundColor:
                                      AppColors.poppypower.withOpacity(0.3),
                                  child: Text(
                                    '${todo?.id}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                          color: AppColors.black,
                                        ),
                                  )),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                '${todo?.title}',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      color: AppColors.black,
                                    ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          TodosModel todo = TodosModel(
                                              userId: 3,
                                              title: StringConstant.sample,
                                              completed: false);
                                          todoController.postTodo(todo);
                                        },
                                        child: CallContainer(
                                          title: StringConstant.post,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          todoController
                                              .updatePutComleted(todo!, index)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: DurationItems
                                                        .durationNormal(),
                                                    content: Text(
                                                        value.toString())));
                                          });
                                        },
                                        child: CallContainer(
                                          title: StringConstant.put,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          todoController
                                              .deleteTodo(index)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: DurationItems
                                                        .durationNormal(),
                                                    content: Text(
                                                        value.toString())));
                                          });
                                        },
                                        child: CallContainer(
                                          title: StringConstant.deleted,
                                        )),
                                  ],
                                )),
                          ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const DividerSheet();
                  },
                  itemCount: snapshot.data?.length ?? 0),
            );
          }),
        ));
  }
}
