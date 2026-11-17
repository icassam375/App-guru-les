import 'package:flutter/material.dart';

import 'empty_view.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, this.onRetry});
  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return EmptyView(
      icon: Icons.error_outline,
      title: 'Terjadi kesalahan',
      message: message,
      actionLabel: onRetry == null ? null : 'Coba lagi',
      onAction: onRetry,
    );
  }
}
