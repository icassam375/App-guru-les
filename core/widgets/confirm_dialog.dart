import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import 'app_button.dart';

class ConfirmDialog {
  ConfirmDialog._();

  /// Mengembalikan true bila pengguna menekan tombol konfirmasi.
  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Ya',
    String cancelLabel = 'Batal',
    bool danger = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h3),
              const SizedBox(height: 8),
              Text(message, style: AppTextStyles.bodyGrey),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: cancelLabel,
                      style: AppButtonStyle.tonal,
                      height: 46,
                      onPressed: () => Navigator.of(ctx).pop(false),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      label: confirmLabel,
                      style: danger
                          ? AppButtonStyle.danger
                          : AppButtonStyle.filled,
                      height: 46,
                      onPressed: () => Navigator.of(ctx).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return result ?? false;
  }
}
