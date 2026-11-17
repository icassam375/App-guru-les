import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle h1 = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.primaryDark);
  static const TextStyle h2 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.primaryDark);
  static const TextStyle h3 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const TextStyle title = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const TextStyle body = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textDark);
  static const TextStyle bodyGrey = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textGrey);
  static const TextStyle small = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textGrey);
  static const TextStyle label = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static const TextStyle price = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.primary);
  static const TextStyle button = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white);
}
