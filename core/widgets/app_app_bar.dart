import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBack = true,
    this.centerTitle = false,
  });

  final String title;
  final List<Widget>? actions;
  final bool showBack;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      titleSpacing: showBack ? 0 : 20,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      title: Text(title,
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark)),
      actions: actions,
    );
  }
}
