import 'package:flutter/material.dart';


import '../../../../core/theme/app_colors.dart';

class EarningsSummaryCard extends StatelessWidget {
  final String title;

  final String amount;

  final String subtitle;

  final IconData icon;

  final Color iconColor;

  const EarningsSummaryCard({
    super.key,

    required this.title,

    required this.amount,

    required this.subtitle,

    required this.icon,

    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 105,

        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: AppColors.white,

          borderRadius: BorderRadius.circular(12),

          border: Border.all(color: AppColors.border),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Icon(icon, size: 16, color: iconColor),

                Flexible(
                  child: Text(
                    title,

                    textAlign: TextAlign.right,

                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(fontSize: 9, color: AppColors.gray),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Text(
              amount,

              style: const TextStyle(
                fontSize: 12,

                fontWeight: FontWeight.bold,

                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              subtitle,

              style: const TextStyle(fontSize: 8, color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
