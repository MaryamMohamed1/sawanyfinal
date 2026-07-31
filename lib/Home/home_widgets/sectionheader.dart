import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية (Readability)
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: const Text(
            'عرض الكل',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0E216C), // الكحلي الغامق الأساسي (60%) لروابط وأزرار "عرض الكل"
            ),
          ),
        ),
      ],
    );
  }
}