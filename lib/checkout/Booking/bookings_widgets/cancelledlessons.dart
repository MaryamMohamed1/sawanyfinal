import 'package:flutter/material.dart';

class CancelledLessonCard extends StatelessWidget {
  final String title;
  final String date;

  const CancelledLessonCard({
    super.key,
    required this.title,
    required this.date,
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
          // 1. أيقونة الإلغاء (على اليمين)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF838C91).withOpacity(0.1), // خلفية رمادية فاتحة متناسقة
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cancel_outlined,
              color: Color(0xFF838C91), // الرمادي المعتمد للأيقونات غير النشطة
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          // 2. العنوان والتاريخ (في المنتصف محاذاة لليمين)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // الأسود المعتمد للعناوين لضمان الوضوح
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF838C91), // الرمادي المعتمد للنصوص الثانوية والتفاصيل الفرعية
                  ),
                ),
              ],
            ),
          ),

          // 3. كلمة "ملغى" (على اليسار)
          const Text(
            'ملغى',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF838C91), // الرمادي المعتمد للنصوص الفرعية
            ),
          ),
        ],
      ),
    );
  }
}