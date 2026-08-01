import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ReportStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ReportStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: AppColors.border,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),

            blurRadius: 6,

            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Icon(
                icon,

                size: 18,

                color: AppColors.primary,
              ),

              Expanded(
                child: Text(
                  title,

                  textAlign: TextAlign.right,

                  style: const TextStyle(
                    fontSize: 10,

                    color: AppColors.gray,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            value,

            style: const TextStyle(
              fontSize: 20,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}