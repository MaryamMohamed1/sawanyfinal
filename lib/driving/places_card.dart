import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key});

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
            'الأماكن التي ستزورها',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 16),

          _buildPlace(
            icon: Icons.local_hospital_outlined,
            title: 'المركز الطبي',
            papers: const ['بطاقة الرقم القومي', 'صورتان شخصيتان'],
          ),

          const SizedBox(height: 14),

          _buildPlace(
            icon: Icons.account_balance_outlined,
            title: 'وحدة المرور',
            papers: const [
              'بطاقة الرقم القومي',
              'الصور الشخصية',
              'الشهادة الطبية',
            ],
          ),

          const SizedBox(height: 14),

          _buildPlace(
            icon: Icons.payments_outlined,
            title: 'الخزينة',
            papers: const ['نموذج الطلب', 'بطاقة الرقم القومي'],
          ),

          const SizedBox(height: 14),

          _buildPlace(
            icon: Icons.school_outlined,
            title: 'قاعة الاختبار',
            papers: const ['إيصال السداد', 'بطاقة الرقم القومي'],
          ),
        ],
      ),
    );
  }

  Widget _buildPlace({
    required IconData icon,
    required String title,
    required List<String> papers,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),

              Icon(icon, color: AppColors.primary),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "الأوراق المطلوبة",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 11, color: AppColors.gray),
          ),

          const SizedBox(height: 8),

          ...papers.map(
            (paper) => Padding(
              padding: const EdgeInsets.only(bottom: 6),

              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      paper,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: AppColors.success,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
