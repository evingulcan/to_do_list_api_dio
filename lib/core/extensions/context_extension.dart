import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constants/app_colors.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => width * 0.11;
  double get maxValue => height * 0.10;
  double get mediumValue => height * 0.05;
  double get normalValue => height * 0.01;
}

extension DecorationExtension on BuildContext {
  BoxDecoration get boxDecoraiton => BoxDecoration(
      color: AppColors.outoftheblue.withOpacity(0.4),
      borderRadius: BorderRadius.circular(normalValue));
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical =>
      EdgeInsets.symmetric(horizontal: mediumValue);
}
