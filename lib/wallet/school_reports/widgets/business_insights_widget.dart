import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class BusinessInsightsWidget extends StatelessWidget {
  const BusinessInsightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // عنوان القسم
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'رؤى الأعمال',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: AppColors.primary,
            ),
          ],
        ),

        const SizedBox(height: 10),

        // ارتفاع الإيرادات
        _buildInsightCard(
          icon: Icons.trending_up,
          iconColor: Colors.green,
          backgroundColor: const Color(0xFFE9FFF3),
          text: 'ارتفعت الإيرادات بنسبة 12% مقارنة بالشهر الماضي',
          textColor: Colors.green.shade700,
        ),

        const SizedBox(height: 10),

        // أعلى معدل استخدام
        _buildInsightCard(
          icon: Icons.calendar_month_outlined,
          iconColor: AppColors.primary,
          text: 'عطلة نهاية الأسبوع شهدت أعلى معدل لاستخدام التدريب',
        ),

        const SizedBox(height: 10),

        // انخفاض إلغاء الحجوزات
        _buildInsightCard(
          icon: Icons.info_outline,
          iconColor: Colors.blue.shade300,
          text: 'انخفض معدل إلغاء الحجوزات بنسبة 15% هذا الأسبوع',
        ),
      ],
    );
  }

  Widget _buildInsightCard({
    required IconData icon,
    required Color iconColor,
    required String text,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 8,

            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          Icon(icon, size: 20, color: iconColor),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              text,

              textAlign: TextAlign.right,

              style: TextStyle(
                fontSize: 11,

                fontWeight: FontWeight.bold,

                color: textColor ?? AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
