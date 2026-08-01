import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class ReliabilityScoreSection extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const ReliabilityScoreSection({super.key, required this.trainers});

  double get averageReliability {
    if (trainers.isEmpty) return 0;

    return trainers.fold<double>(
          0,
          (sum, trainer) => sum + trainer.reliabilityScore,
        ) /
        trainers.length;
  }

  @override
  Widget build(BuildContext context) {
    final excellentCount = trainers
        .where((trainer) => trainer.reliabilityScore >= 90)
        .length;

    final improvementCount = trainers
        .where((trainer) => trainer.reliabilityScore < 90)
        .length;

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'درجة الاعتمادية العامة',

            textAlign: TextAlign.right,

            style: TextStyle(
              fontSize: 11,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            textDirection: TextDirection.ltr,

            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    _buildStatusRow(
                      title: 'أداء ممتاز',

                      value: '$excellentCount',

                      color: AppColors.success,
                    ),

                    const SizedBox(height: 10),

                    _buildStatusRow(
                      title: 'يحتاج إلى تحسين',

                      value: '$improvementCount',

                      color: AppColors.accent,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              SizedBox(
                width: 95,

                height: 95,

                child: Stack(
                  alignment: Alignment.center,

                  children: [
                    SizedBox(
                      width: 85,

                      height: 85,

                      child: CircularProgressIndicator(
                        value: averageReliability / 100,

                        strokeWidth: 7,

                        backgroundColor: AppColors.border,

                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),

                    Text(
                      '${averageReliability.toInt()}%',

                      style: const TextStyle(
                        fontSize: 17,

                        fontWeight: FontWeight.bold,

                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow({
    required String title,

    required String value,

    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 24),

          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),

          decoration: BoxDecoration(
            color: color.withOpacity(0.1),

            borderRadius: BorderRadius.circular(6),
          ),

          child: Text(
            value,

            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 11,

              fontWeight: FontWeight.bold,

              color: color,
            ),
          ),
        ),

        const SizedBox(width: 8),

        Text(title, style: const TextStyle(fontSize: 9, color: AppColors.gray)),
      ],
    );
  }
}
