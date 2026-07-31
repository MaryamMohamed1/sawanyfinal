import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class TotalRevenueCard extends StatelessWidget {
  final String revenue;
  final String percentage;

  const TotalRevenueCard({
    super.key,
    required this.revenue,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.primary,

        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'إجمالي الإيرادات',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 11, color: AppColors.white),
          ),

          const SizedBox(height: 5),

          Text(
            revenue,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.15),

                  borderRadius: BorderRadius.circular(12),
                ),

                child: Text(
                  percentage,
                  style: const TextStyle(
                    fontSize: 9,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Text(
                'مقارنة بالشهر السابق',
                style: TextStyle(fontSize: 9, color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
