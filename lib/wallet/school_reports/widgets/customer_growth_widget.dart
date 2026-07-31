import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomerGrowthWidget extends StatelessWidget {
  const CustomerGrowthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'نمو العملاء',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),

          decoration: BoxDecoration(
            color: AppColors.white,

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
              Expanded(
                child: _buildGrowthItem(
                  title: 'العملاء الجدد',
                  value: '145',
                  subtitle: 'هذا الشهر',
                  valueColor: AppColors.primary,
                ),
              ),

              Container(height: 55, width: 1, color: AppColors.border),

              Expanded(
                child: _buildGrowthItem(
                  title: 'معدل الاحتفاظ',
                  value: '75%',
                  subtitle: 'من العملاء',
                  valueColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrowthItem({
    required String title,
    required String value,
    required String subtitle,
    required Color valueColor,
  }) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 9, color: AppColors.gray)),

        const SizedBox(height: 6),

        Text(
          value,

          style: TextStyle(
            fontSize: 22,

            fontWeight: FontWeight.bold,

            color: valueColor,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          subtitle,

          style: const TextStyle(fontSize: 8, color: AppColors.gray),
        ),
      ],
    );
  }
}
