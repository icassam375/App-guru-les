import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum AppButtonStyle { filled, outlined, tonal, danger }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.trailingIcon,
    this.style = AppButtonStyle.filled,
    this.expanded = true,
    this.height = 52,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final IconData? trailingIcon;
  final AppButtonStyle style;
  final bool expanded;
  final double height;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    BorderSide side = BorderSide.none;
    switch (style) {
      case AppButtonStyle.filled:
        bg = AppColors.primary;
        fg = Colors.white;
        break;
      case AppButtonStyle.outlined:
        bg = Colors.white;
        fg = AppColors.primary;
        side = const BorderSide(color: AppColors.primary, width: 1.4);
        break;
      case AppButtonStyle.tonal:
        bg = AppColors.lavender;
        fg = AppColors.primaryDark;
        break;
      case AppButtonStyle.danger:
        bg = AppColors.dangerSoft;
        fg = AppColors.danger;
        break;
    }

    final content = loading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2.4, color: fg),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8),
                Icon(trailingIcon, size: 18),
              ],
            ],
          );

    return SizedBox(
      width: expanded ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          disabledBackgroundColor: bg.withOpacity(0.6),
          disabledForegroundColor: fg.withOpacity(0.7),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
            side: side,
          ),
        ),
        child: content,
      ),
    );
  }
}
