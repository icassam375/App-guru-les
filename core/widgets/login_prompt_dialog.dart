import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../router/route_names.dart';
import '../theme/app_text_styles.dart';
import 'app_button.dart';
import 'icon_box.dart';

/// Ajakan login untuk pengunjung (aksi booking, favorit, dan chat).
class LoginPromptDialog extends StatelessWidget {
  const LoginPromptDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (_) => const LoginPromptDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const IconBox(Icons.lock_outline,
                size: 64, bg: AppColors.mint, radius: 22, iconSize: 30),
            const SizedBox(height: 16),
            const Text('Masuk dulu, yuk', style: AppTextStyles.h3),
            const SizedBox(height: 8),
            const Text(AppStrings.loginRequired,
                textAlign: TextAlign.center, style: AppTextStyles.bodyGrey),
            const SizedBox(height: 20),
            AppButton(
              label: AppStrings.continueWithGoogle,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RouteNames.login);
              },
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Nanti saja',
                  style: TextStyle(color: AppColors.textGrey)),
            ),
          ],
        ),
      ),
    );
  }
}
