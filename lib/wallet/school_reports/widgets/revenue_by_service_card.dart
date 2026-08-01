import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RevenueByServiceCard extends StatelessWidget {
  const RevenueByServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        children: [
          _buildRevenueRow(
            title: 'دروس المبتدئين',
            revenue: '\$84,000',
            percentage: '54%',
            progress: 0.54,
          ),

          const SizedBox(height: 14),

          _buildRevenueRow(
            title: 'تحسين القيادة',
            revenue: '\$42,000',
            percentage: '27%',
            progress: 0.27,
          ),

          const SizedBox(height: 14),

          _buildRevenueRow(
            title: 'اختبار التقييم',
            revenue: '\$30,000',
            percentage: '19%',
            progress: 0.19,
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueRow({
    required String title,
    required String revenue,
    required String percentage,
    required double progress,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              percentage,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  revenue,
                  style: const TextStyle(fontSize: 10, color: AppColors.gray),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 6),

        LinearProgressIndicator(
          value: progress,
          minHeight: 6,
          backgroundColor: AppColors.border,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}
