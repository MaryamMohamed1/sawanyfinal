import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class TopTrainersCard extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const TopTrainersCard({super.key, required this.trainers});

  @override
  Widget build(BuildContext context) {
    // عرض المدربين الذين درجة اعتماديتهم أكبر من أو تساوي 90
    final topTrainers =
        trainers.where((trainer) => trainer.reliabilityScore >= 90).toList()
          ..sort((a, b) => b.rating.compareTo(a.rating));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        const Text(
          'أفضل المدربين أداءً',

          textAlign: TextAlign.right,

          style: TextStyle(
            fontSize: 15,

            fontWeight: FontWeight.bold,

            color: AppColors.primary,
          ),
        ),

        const SizedBox(height: 10),

        ...topTrainers.map((trainer) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),

            child: _buildTrainerCard(trainer: trainer),
          );
        }),
      ],
    );
  }

  Widget _buildTrainerCard({required TrainerRatingModel trainer}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),

            blurRadius: 8,

            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        textDirection: TextDirection.ltr,

        children: [
          // الحالة والاعتمادية - الشمال
          Expanded(
            child: Column(
              textDirection: TextDirection.ltr,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'ممتاز',

                  style: TextStyle(
                    fontSize: 10,

                    fontWeight: FontWeight.bold,

                    color: AppColors.success,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  'درجة الاعتمادية ${trainer.reliabilityScore}%',

                  style: const TextStyle(fontSize: 8, color: AppColors.gray),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // الاسم والتقييم
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                trainer.name,

                style: const TextStyle(
                  fontSize: 12,

                  fontWeight: FontWeight.bold,

                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 4),

              Row(
                textDirection: TextDirection.ltr,

                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    trainer.rating.toStringAsFixed(1),

                    style: const TextStyle(
                      fontSize: 10,

                      color: AppColors.accent,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 3),

                  const Icon(Icons.star, size: 12, color: AppColors.accent),
                ],
              ),
            ],
          ),

          const SizedBox(width: 10),

          // الصورة
          _buildAvatar(trainer.image),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imageUrl) {
    return ClipOval(
      child: Image.network(
        imageUrl,

        width: 48,

        height: 48,

        fit: BoxFit.cover,

        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 48,

            height: 48,

            decoration: const BoxDecoration(
              shape: BoxShape.circle,

              color: AppColors.border,
            ),

            child: const Icon(Icons.person, color: AppColors.gray, size: 26),
          );
        },
      ),
    );
  }
}
