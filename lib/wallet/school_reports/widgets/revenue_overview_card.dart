import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RevenueOverviewCard extends StatelessWidget {
  const RevenueOverviewCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          SizedBox(
            height: 150,

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,

              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                _buildBar(month: 'يناير', height: 0.45),

                _buildBar(month: 'فبراير', height: 0.65),

                _buildBar(month: 'مارس', height: 0.55),

                _buildBar(month: 'أبريل', height: 0.80),

                _buildBar(month: 'مايو', height: 0.70),

                _buildBar(month: 'يونيو', height: 1.0),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'الإيرادات خلال الأشهر السابقة',
            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 9, color: AppColors.gray),
          ),
        ],
      ),
    );
  }

  Widget _buildBar({required String month, required double height}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,

              child: FractionallySizedBox(
                heightFactor: height,

                child: Container(
                  width: 24,

                  decoration: BoxDecoration(
                    color: AppColors.primary,

                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            month,

            style: const TextStyle(fontSize: 8, color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
