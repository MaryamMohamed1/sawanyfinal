import 'package:flutter/material.dart';

class PartnersStatsSection extends StatelessWidget {
  const PartnersStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildStatCard('مراكز التدريب الشريكة', '14', 'موزعة في الجيزة والقاهرة')),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('مضامير قيادة مغلقة', '08', 'مجهزة بالكامل')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildStatCard('أجهزة محاكاة (Simulator)', '12', 'أحدث طراز')),
            const SizedBox(width: 12),
            Expanded(child: _buildStatCard('نسبة نجاح اختبار المرور', '94%', 'للمتدربين عبر الشركاء')),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String number, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // أبيض لخلفية الكروت
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF838C91)), // حدود رمادية
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF838C91), // رمادي للعناوين الفرعية
            ),
          ),
          const SizedBox(height: 4),
          Text(
            number,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E216C), // كحلي أساسي للأرقام البارزة
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF838C91), // رمادي للتفاصيل لتوحيد الألوان بدلاً من الأخضر
            ),
          ),
        ],
      ),
    );
  }
}