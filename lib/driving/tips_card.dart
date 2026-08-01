import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'نصائح قبل الذهاب',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 16),

          _tip('احضر قبل الموعد بـ 30 دقيقة.'),
          _tip('احتفظ بجميع الإيصالات حتى استلام الرخصة.'),
          _tip('تأكد من صلاحية بطاقة الرقم القومي.'),
          _tip('راجع إشارات المرور قبل الاختبار النظري.'),
          _tip('التزم بتعليمات لجنة الاختبار أثناء الامتحان العملي.'),
        ],
      ),
    );
  }

  Widget _tip(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 12, color: AppColors.black),
            ),
          ),

          const Icon(
            Icons.lightbulb_outline,
            color: AppColors.accent,
            size: 20,
          ),
        ],
      ),
    );
  }
}
