import 'package:flutter/material.dart';

class SchoolsList extends StatelessWidget {
  const SchoolsList({super.key});

  final List<Map<String, dynamic>> _schools = const [
    {
      'title': 'مدرسة النجوم',
      'rating': '4.9',
      'reviews': '(+200)',
      'icon': Icons.apartment_rounded,
    },
    {
      'title': 'أكاديمية الطريق الأفضل',
      'rating': '4.7',
      'reviews': '(+150)',
      'icon': Icons.directions_car_rounded,
    },
    {
      'title': 'ثقة لتعليم القيادة',
      'rating': '4.5',
      'reviews': '(+90)',
      'icon': Icons.verified_user_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: _schools.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final school = _schools[index];

          return Container(
            width: 135,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF), // الأبيض كخلفية رئيسية للكارت
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // مربع الصورة / الأيقونة
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E216C).withOpacity(0.08), // خلفية كحلي خفيفة ومريحة
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    school['icon'] as IconData,
                    size: 40,
                    color: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للأيقونة
                  ),
                ),
                const SizedBox(height: 8),

                // الاسم
                Text(
                  school['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // الأسود المعتمد للعناوين الرئيسية
                  ),
                ),
                const SizedBox(height: 4),

                // التقييم
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      school['reviews'] as String,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF838C91), // الرمادي المعتمد للمراجعات والنصوص الثانوية
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      school['rating'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000), // الأسود الصريح للرقم
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: Color(0xFFFE8511), // البرتقالي التفاعلي المعتمد للنجوم والأوسمة
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}