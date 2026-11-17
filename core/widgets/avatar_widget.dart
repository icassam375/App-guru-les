import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Avatar bundar. Tanpa foto, tampil inisial nama di atas warna lembut.
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 24,
    this.online,
    this.verified = false,
    this.square = false,
  });

  final String name;
  final String? imageUrl;
  final double radius;

  /// null = tidak ada titik status, true = hijau, false = abu-abu.
  final bool? online;
  final bool verified;
  final bool square;

  static const List<Color> _palette = [
    Color(0xFFCDEFE3),
    Color(0xFFD8E0FF),
    Color(0xFFFFE6C7),
    Color(0xFFF9D9E3),
    Color(0xFFD6EEF7),
  ];

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) return '?';
    final skip = {'kak', 'ibu', 'bu', 'pak', 'bapak'};
    final useful = parts.where((p) => !skip.contains(p.toLowerCase())).toList();
    final list = useful.isEmpty ? parts : useful;
    return list.take(2).map((p) => p[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final bg = _palette[name.hashCode.abs() % _palette.length];
    final size = radius * 2;
    final radiusShape = square ? BorderRadius.circular(radius * 0.6) : null;

    Widget inner;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      inner = ClipRRect(
        borderRadius: radiusShape ?? BorderRadius.circular(radius),
        child: Image.network(imageUrl!,
            width: size, height: size, fit: BoxFit.cover),
      );
    } else {
      inner = Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          shape: square ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: radiusShape,
        ),
        child: Text(_initials,
            style: TextStyle(
                fontSize: radius * 0.8,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryDark)),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          inner,
          if (online != null)
            Positioned(
              right: -1,
              bottom: -1,
              child: Container(
                width: radius * 0.5,
                height: radius * 0.5,
                decoration: BoxDecoration(
                  color: online! ? AppColors.success : AppColors.textHint,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          if (verified)
            Positioned(
              right: -2,
              top: -2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: Icon(Icons.check, size: radius * 0.45, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
