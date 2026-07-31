import 'package:flutter/material.dart';

class CompletedLessonCard extends StatelessWidget {
  final String title;
  final String date;
  final String duration;

  const CompletedLessonCard({
    super.key,
    required this.title,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // الأبيض (الخلفية الرئيسية للكروت)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
      ),
      child: Row(
        children: [
          // 1. الأيقونة المميزة الدائرية (على اليمين)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0E216C).withOpacity(0.1), // خلفية كحلي فاتحة متناسقة
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_rounded,
              color: Color(0xFF0E216C), // الكحلي الغامق الأساسي (60%)
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          // 2. العنوان والتاريخ والمدة (في المنتصف محاذاة لليمين)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // الأسود المعتمد للعناوين الرئيسية (Readability)
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$date • $duration',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF838C91), // الرمادي المعتمد للتفاصيل الفرعية والنصوص الثانوية
                  ),
                ),
              ],
            ),
          ),


          
        ],
      ),
    );
  }
}