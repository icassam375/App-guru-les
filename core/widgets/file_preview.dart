import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'icon_box.dart';

enum FileKind { pdf, video, doc, image, other }

class FilePreview extends StatelessWidget {
  const FilePreview({
    super.key,
    required this.name,
    this.sizeLabel,
    this.kind = FileKind.other,
    this.onTap,
  });

  final String name;
  final String? sizeLabel;
  final FileKind kind;
  final VoidCallback? onTap;

  (IconData, Color, Color) get _look {
    switch (kind) {
      case FileKind.pdf:
        return (Icons.picture_as_pdf_outlined, AppColors.danger,
            AppColors.dangerSoft);
      case FileKind.video:
        return (Icons.play_circle_outline, AppColors.orange,
            AppColors.orangeSoft);
      case FileKind.doc:
        return (Icons.description_outlined, AppColors.primary,
            AppColors.lavender);
      case FileKind.image:
        return (Icons.image_outlined, AppColors.teal, AppColors.mint);
      case FileKind.other:
        return (Icons.insert_drive_file_outlined, AppColors.textGrey,
            AppColors.lavenderSoft);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (icon, fg, bg) = _look;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Row(
        children: [
          IconBox(icon, bg: bg, fg: fg, size: 48),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.label),
                if (sizeLabel != null)
                  Text(sizeLabel!, style: AppTextStyles.small),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
