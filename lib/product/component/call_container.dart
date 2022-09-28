import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constants/app_colors.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';

class CallContainer extends StatelessWidget {
  String title;

  CallContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.lowValue,
        height: context.mediumValue,
        decoration: context.boxDecoraiton,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: AppColors.black,
                ),
          ),
        ));
  }
}
