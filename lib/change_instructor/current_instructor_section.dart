import 'package:flutter/material.dart';

class CurrentInstructorSection extends StatelessWidget {
  const CurrentInstructorSection({super.key});

  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المدرب الحالي',
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // صورة المدرب
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'أحمد محمود',
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: accentOrange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '4.8 (120 تقييم)',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // بادج (نشط)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: accentOrange.withOpacity(0.1), // خلفية برتقالية خفيفة متناسقة
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'نشط',
                  style: TextStyle(
                    color: accentOrange, 
                    fontSize: 12, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}