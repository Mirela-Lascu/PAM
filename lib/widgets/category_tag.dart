import 'package:flutter/material.dart';

enum CategoryTagStyle { blue, white }

class CategoryTag extends StatelessWidget {
  final String label;
  final CategoryTagStyle style;

  const CategoryTag(
      this.label, {
        super.key,
        this.style = CategoryTagStyle.blue,
      });

  @override
  Widget build(BuildContext context) {
    late final Color bg;
    late final Color borderColor;
    late final Color textColor;

    if (style == CategoryTagStyle.blue) {
      bg = const Color(0xFF00B0FF);
      borderColor = Colors.transparent;
      textColor = Colors.white;
    } else {
      bg = const Color(0xFFEAF3FF);
      borderColor = const Color(0xFF00B0FF);
      textColor = const Color(0xFF00B0FF);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}