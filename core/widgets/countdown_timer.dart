import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../utils/formatters.dart';

/// Hitung mundur ke [deadline]. Dipakai untuk tahan slot 15 menit,
/// batas respons guru, dan "Sesi Terdekat".
class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.deadline,
    this.onFinished,
    this.pill = true,
    this.style,
  });

  final DateTime deadline;
  final VoidCallback? onFinished;
  final bool pill;
  final TextStyle? style;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  late Duration _left;

  @override
  void initState() {
    super.initState();
    _left = widget.deadline.difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final left = widget.deadline.difference(DateTime.now());
      if (!mounted) return;
      setState(() => _left = left);
      if (left.isNegative || left.inSeconds == 0) {
        _timer?.cancel();
        widget.onFinished?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = Text(
      Formatters.countdown(_left),
      style: widget.style ??
          const TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Colors.white),
    );
    if (!widget.pill) return text;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
      child: text,
    );
  }
}
