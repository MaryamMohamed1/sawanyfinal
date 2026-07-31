import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RequiredDocumentsCard extends StatelessWidget {
  const RequiredDocumentsCard({super.key});

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
            'الأوراق المطلوبة لاستخراج رخصة خاصة',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 16),

          _buildDocument(
            Icons.badge_outlined,
            'أصل بطاقة الرقم القومي (سارية) وصورة منها',
          ),

          _buildDocument(
            Icons.school_outlined,
            'أصل المؤهل الدراسي وصورة منه (أو إثبات قيد للطلاب)',
          ),

          _buildDocument(
            Icons.photo_camera_outlined,
            '4 صور شخصية حديثة (خلفية بيضاء)',
          ),

          _buildDocument(
            Icons.medical_information_outlined,
            'شهادة طبية (باطنة وعيون) من المرور أو مستشفى حكومي',
          ),

          _buildDocument(
            Icons.description_outlined,
            'نموذج 256 مرور (من إدارة المرور)',
          ),

          _buildDocument(
            Icons.fingerprint_outlined,
            'صحيفة الحالة الجنائية (فيش وتشبيه) موجهة للمرور',
          ),

          _buildDocument(
            Icons.workspace_premium_outlined,
            'شهادة إتمام دورة تدريبية في مدرسة القيادة التابعة للمرور',
          ),
        ],
      ),
    );
  }

  Widget _buildDocument(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.right,

              style: const TextStyle(
                fontSize: 13,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                height: 1.4, // ضفت مسافة بسيطة بين السطور عشان لو النص طويل
              ),
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 38,
            height: 38,

            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
        ],
      ),
    );
  }
}