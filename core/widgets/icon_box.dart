import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class IconBox extends StatelessWidget {
  const IconBox(
    this.icon, {
    super.key,
    this.size = 44,
    this.bg = AppColors.mintSoft,
    this.fg = AppColors.primary,
    this.radius = 14,
    this.iconSize,
  });

  final IconData icon;
  final double size;
  final Color bg;
  final Color fg;
  final double radius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(icon, color: fg, size: iconSize ?? size * 0.5),
    );
  }
}
