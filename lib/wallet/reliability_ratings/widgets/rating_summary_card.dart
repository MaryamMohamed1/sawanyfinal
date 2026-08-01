import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class RatingsDistributionCard extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const RatingsDistributionCard({
    super.key,
    required this.trainers,
  });

  @override
  Widget build(BuildContext context) {
    final distribution = {
      5: trainers.where((e) => e.rating >= 4.5).length,
      4: trainers
          .where(
            (e) => e.rating >= 3.5 && e.rating < 4.5,
          )
          .length,
      3: trainers
          .where(
            (e) => e.rating >= 2.5 && e.rating < 3.5,
          )
          .length,
      2: trainers
          .where(
            (e) => e.rating >= 1.5 && e.rating < 2.5,
          )
          .length,
      1: trainers.where((e) => e.rating < 1.5).length,
    };

    final maxValue = distribution.values.isEmpty
        ? 1
        : distribution.values.reduce(
            (a, b) => a > b ? a : b,
          );

    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'توزيع التقييمات',

            style: TextStyle(
              fontSize: 12,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 12),

          ...distribution.entries.map(
            (entry) {
              final percentage = maxValue == 0
                  ? 0.0
                  : entry.value / maxValue;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),

                child: Row(
                  children: [
                    Text(
                      '${entry.value}',

                      style: const TextStyle(
                        fontSize: 9,
                        color: AppColors.gray,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: LinearProgressIndicator(
                        value: percentage.toDouble(),

                        minHeight: 6,

                        backgroundColor:
                            AppColors.lightBackground,

                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      '${entry.key} ⭐',

                      style: const TextStyle(
                        fontSize: 9,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}