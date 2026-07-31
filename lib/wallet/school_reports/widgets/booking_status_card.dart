import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class BookingStatusCard extends StatelessWidget {
  const BookingStatusCard({super.key});

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
          _buildStatusRow(title: 'مكتملة', percentage: '70%', progress: 0.70),

          const SizedBox(height: 12),

          _buildStatusRow(
            title: 'قيد التنفيذ',
            percentage: '20%',
            progress: 0.20,
          ),

          const SizedBox(height: 12),

          _buildStatusRow(title: 'ملغاة', percentage: '10%', progress: 0.10),
        ],
      ),
    );
  }

  Widget _buildStatusRow({
    required String title,
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

            Text(
              title,

              style: const TextStyle(fontSize: 10, color: AppColors.gray),
            ),
          ],
        ),

        const SizedBox(height: 5),

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
