import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class RatingsDistributionCard extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const RatingsDistributionCard({super.key, required this.trainers});

  @override
  Widget build(BuildContext context) {
    final distribution = {
      5: trainers.where((trainer) => trainer.rating >= 4.5).length,
      4: trainers
          .where((trainer) => trainer.rating >= 3.5 && trainer.rating < 4.5)
          .length,
      3: trainers
          .where((trainer) => trainer.rating >= 2.5 && trainer.rating < 3.5)
          .length,
      2: trainers
          .where((trainer) => trainer.rating >= 1.5 && trainer.rating < 2.5)
          .length,
      1: trainers.where((trainer) => trainer.rating < 1.5).length,
    };

    final maxValue = distribution.values.isEmpty
        ? 1
        : distribution.values.reduce((a, b) => a > b ? a : b);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'توزيع التقييمات',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 14),

          ...distribution.entries.map((entry) {
            final double progress = maxValue == 0 ? 0 : entry.value / maxValue;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),

              child: Row(
                children: [
                  // النجمة والرقم
                  SizedBox(
                    width: 38,

                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 13, color: Colors.amber),

                        const SizedBox(width: 3),

                        Text(
                          '${entry.key}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // شريط التقييم
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),

                      child: LinearProgressIndicator(
                        value: progress,

                        minHeight: 7,

                        backgroundColor: AppColors.lightBackground,

                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // عدد التقييمات
                  SizedBox(
                    width: 18,

                    child: Text(
                      '${entry.value}',

                      textAlign: TextAlign.left,

                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
