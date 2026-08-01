import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class LicenseStepsCard extends StatelessWidget {
  const LicenseStepsCard({super.key});

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
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'خطوات استخراج الرخصة',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 18),

          _buildStep(
            "1",
            "الكشف الطبي",
            "ابدأ بإجراء الكشف الطبي داخل المرور أو في أحد المراكز الطبية المعتمدة.",
          ),

          _buildDivider(),

          _buildStep(
            "2",
            "التوجه إلى المرور",
            "شراء الملف واستلام نموذج استخراج رخصة القيادة.",
          ),

          _buildDivider(),

          _buildStep(
            "3",
            "تقديم المستندات",
            "تسليم جميع الأوراق المطلوبة إلى الموظف المختص.",
          ),

          _buildDivider(),

          _buildStep(
            "4",
            "الاختبار النظري",
            "اجتياز اختبار إشارات المرور وقواعد القيادة.",
          ),

          _buildDivider(),

          _buildStep(
            "5",
            "الاختبار العملي",
            "اجتياز اختبار القيادة ثم استلام الرخصة.",
          ),
        ],
      ),
    );
  }

  static Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: AppColors.border, height: 1),
    );
  }

  Widget _buildStep(String number, String title, String subtitle) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الدائرة
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // النص
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
