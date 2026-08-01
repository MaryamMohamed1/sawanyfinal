import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({super.key});

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
            "الأسئلة الشائعة",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 16),

          _buildQuestion(
            "كم تستغرق مدة استخراج الرخصة؟",
            "عادةً تستغرق إجراءات استخراج الرخصة من يوم إلى عدة أيام حسب وحدة المرور واستكمال جميع الإجراءات.",
          ),

          const Divider(color: AppColors.border),

          _buildQuestion(
            "هل يمكن إعادة الاختبار إذا لم أنجح؟",
            "نعم، يمكن إعادة الاختبار مرة أخرى بعد تحديد موعد جديد وفقًا لتعليمات وحدة المرور.",
          ),

          const Divider(color: AppColors.border),

          _buildQuestion(
            "هل يشترط وجود شهادة قيادة؟",
            "يعتمد ذلك على نوع الرخصة والإجراءات المعمول بها داخل وحدة المرور التابع لها.",
          ),

          const Divider(color: AppColors.border),

          _buildQuestion(
            "هل يجب حجز موعد مسبق؟",
            "بعض وحدات المرور تتطلب حجز موعد مسبق، لذلك يُفضل التأكد قبل الذهاب لتجنب الانتظار.",
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(String question, String answer) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,

      childrenPadding: const EdgeInsets.fromLTRB(8, 0, 8, 14),

      controlAffinity: ListTileControlAffinity.leading,

      iconColor: AppColors.primary,

      collapsedIconColor: AppColors.gray,

      title: Text(
        question,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),

      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            answer,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 13,
              height: 1.7,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
