import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class ReliabilitySummaryCards extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const ReliabilitySummaryCards({super.key, required this.trainers});

  double get averageRating {
    if (trainers.isEmpty) return 0;

    return trainers.fold<double>(0, (sum, trainer) => sum + trainer.rating) /
        trainers.length;
  }

  double get averageReliability {
    if (trainers.isEmpty) return 0;

    return trainers.fold<double>(
          0,
          (sum, trainer) => sum + trainer.reliabilityScore,
        ) /
        trainers.length;
  }

  double get averageAttendance {
    if (trainers.isEmpty) return 0;

    return trainers.fold<double>(
          0,
          (sum, trainer) => sum + trainer.attendanceRate,
        ) /
        trainers.length;
  }

  double get averagePunctuality {
    if (trainers.isEmpty) return 0;

    return trainers.fold<double>(
          0,
          (sum, trainer) => sum + trainer.punctualityRate,
        ) /
        trainers.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'معدل التقييم',
                value: '${averageRating.toStringAsFixed(1)} ⭐',
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: _buildCard(
                title: 'متوسط الاعتمادية',
                value: '${averageReliability.toInt()}%',
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'معدل الحضور',
                value: '${averageAttendance.toInt()}%',
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: _buildCard(
                title: 'الالتزام بالمواعيد',
                value: '${averagePunctuality.toInt()}%',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required String value}) {
    return Container(
      height: 65,

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            title,

            textAlign: TextAlign.center,

            style: const TextStyle(fontSize: 8, color: AppColors.gray),
          ),

          const SizedBox(height: 5),

          Text(
            value,

            style: const TextStyle(
              fontSize: 12,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
