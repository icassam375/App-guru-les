import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SnackbarHelper {
  SnackbarHelper._();

  static void show(BuildContext context, String message,
      {bool error = false}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: error ? AppColors.danger : AppColors.primary,
      ));
  }

  static void error(BuildContext context, String message) =>
      show(context, message, error: true);
}
