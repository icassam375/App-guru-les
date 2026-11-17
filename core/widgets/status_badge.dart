import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum BadgeTone { green, orange, red, blue, grey, amber }

class StatusBadge extends StatelessWidget {
  const StatusBadge(
    this.label, {
    super.key,
    this.tone = BadgeTone.green,
    this.icon,
    this.dot = false,
    this.small = false,
  });

  final String label;
  final BadgeTone tone;
  final IconData? icon;
  final bool dot;
  final bool small;

  (Color, Color) get _colors {
    switch (tone) {
      case BadgeTone.green:
        return (AppColors.mint, AppColors.primary);
      case BadgeTone.orange:
        return (AppColors.orangeSoft, AppColors.orange);
      case BadgeTone.red:
        return (AppColors.dangerSoft, AppColors.danger);
      case BadgeTone.blue:
        return (AppColors.lavender, const Color(0xFF3949AB));
      case BadgeTone.grey:
        return (const Color(0xFFEDF1F0), AppColors.textGrey);
      case BadgeTone.amber:
        return (AppColors.cream, const Color(0xFF8A5A00));
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = _colors;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: small ? 8 : 10, vertical: small ? 3 : 5),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(color: fg, shape: BoxShape.circle)),
            const SizedBox(width: 6),
          ] else if (icon != null) ...[
            Icon(icon, size: small ? 12 : 14, color: fg),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: small ? 10.5 : 12,
                    fontWeight: FontWeight.w700,
                    color: fg)),
          ),
        ],
      ),
    );
  }
}
