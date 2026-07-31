import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ReportSmallStatCard extends StatelessWidget {
  final String title;
  final String value;

  const ReportSmallStatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        decoration: BoxDecoration(
          color: AppColors.white,

          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: AppColors.border),
        ),

        child: Column(
          children: [
            Text(
              title,

              style: const TextStyle(fontSize: 10, color: AppColors.gray),
            ),

            const SizedBox(height: 6),

            Text(
              value,

              style: const TextStyle(
                fontSize: 16,

                fontWeight: FontWeight.bold,

                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
