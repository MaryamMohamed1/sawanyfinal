import 'package:flutter/material.dart';

class BookingsStatsSection extends StatelessWidget {
  const BookingsStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. كارت إجمالي الحجوزات (الأيقونة يمين - النص شمال)
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), // الأبيض (خلفية الكروت)
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الأيقونة جهة اليمين (استخدام الكحلي الأساسي 60%)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E216C), // كحلي غامق أساسي
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.smartphone_rounded,
                  color: Color(0xFFFFFFFF), // أبيض
                  size: 24,
                ),
              ),

              // النص والعدد جهة اليسار
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إجمالي الحجوزات',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF838C91), // الرمادي المعتمد للنصوص الثانوية
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '٢٤',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000), // الأسود المعتمد للنصوص الرئيسية
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // 2. كروت الحصص القادمة والمكتملة (الأيقونة يمين - النص شمال)
        Row(
          children: [
            // كارت الحصص القادمة
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF), // الأبيض
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // أيقونة الحصص القادمة (استخدام البرتقالي التفاعلي كـ Accent لجذب الانتباه 10%)
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xFFFE8511), 
                      size: 22,
                    ),
                    // الكلام جهة اليسار
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الحصص القادمة',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF838C91), // الرمادي المعتمد للنصوص الثانوية
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '٦',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // الأسود المعتمد للأرقام الرئيسية
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),

            // كارت الحصص المكتملة
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF), // الأبيض
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // أيقونة الحصص المكتملة (استخدام الكحلي الأساسي أو تدرج متناسق)
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: Color(0xFF0E216C), // الكحلي الغامق الأساسي
                      size: 22,
                    ),
                    // الكلام جهة اليسار
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الحصص المكتملة',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF838C91), // الرمادي المعتمد للنصوص الثانوية
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '١٨',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // الأسود المعتمد للأرقام الرئيسية
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}