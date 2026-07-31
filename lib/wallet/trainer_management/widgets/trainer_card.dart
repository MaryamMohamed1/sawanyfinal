import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 8,

            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          // =========================
          // Trainer Header
          // =========================
          Row(
            textDirection: TextDirection.ltr,

            children: [
              // زرار المزيد - أقصى الشمال
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,

                  size: 20,

                  color: AppColors.gray,
                ),

                onSelected: (value) {
                  // الأكشنز بعدين
                },

                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(value: 'edit', child: Text('تعديل البيانات')),

                    PopupMenuItem(
                      value: 'disable',

                      child: Text('تعطيل المدرب'),
                    ),
                  ];
                },
              ),

              const Spacer(),

              // اسم المدرب وحالة التوثيق
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Text(
                    trainer.name,

                    style: const TextStyle(
                      fontSize: 15,

                      fontWeight: FontWeight.bold,

                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    textDirection: TextDirection.rtl,

                    children: [
                      Icon(
                        trainer.verificationStatus == 'موثق'
                            ? Icons.verified
                            : Icons.pending_outlined,

                        size: 14,

                        color: trainer.verificationStatus == 'موثق'
                            ? AppColors.success
                            : AppColors.accent,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        trainer.verificationStatus,

                        style: TextStyle(
                          fontSize: 11,

                          color: trainer.verificationStatus == 'موثق'
                              ? AppColors.success
                              : AppColors.accent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 10),

              // صورة المدرب - أقصى اليمين
              CircleAvatar(
                radius: 27,

                backgroundColor: AppColors.border,

                backgroundImage: NetworkImage(trainer.image),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(height: 1, color: AppColors.border),

          const SizedBox(height: 12),

          // =========================
          // Trainer Statistics
          // =========================
          Row(
            textDirection: TextDirection.rtl,

            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              // الاعتمادية - اليمين
              _buildStat(
                title: 'الاعتمادية',

                value: '${trainer.reliabilityScore}%',
              ),

              // التقييم - المنتصف
              _buildStat(title: 'التقييم', value: '${trainer.rating} ⭐'),

              // الحصص - الشمال
              _buildStat(title: 'الحصص', value: '${trainer.completedSessions}'),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(height: 1, color: AppColors.border),

          const SizedBox(height: 10),

          // =========================
          // Availability
          // =========================
          Row(
            textDirection: TextDirection.ltr,

            children: [
              Container(
                width: 8,

                height: 8,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: trainer.isAvailable
                      ? AppColors.success
                      : AppColors.gray,
                ),
              ),

              const SizedBox(width: 6),

              Text(
                trainer.availability,

                style: const TextStyle(fontSize: 11, color: AppColors.gray),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat({required String title, required String value}) {
    return Column(
      children: [
        Text(
          title,

          style: const TextStyle(fontSize: 11, color: AppColors.gray),
        ),

        const SizedBox(height: 5),

        Text(
          value,

          style: const TextStyle(
            fontSize: 13,

            fontWeight: FontWeight.bold,

            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
