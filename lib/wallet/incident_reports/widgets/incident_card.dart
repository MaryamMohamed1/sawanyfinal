import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/incident_model.dart';

class IncidentCard extends StatelessWidget {
  final IncidentModel incident;

  const IncidentCard({super.key, required this.incident});

  Color get priorityColor {
    switch (incident.priority) {
      case 'مرتفع':
        return AppColors.accent;

      case 'متوسط':
        return AppColors.accent;

      default:
        return AppColors.gray;
    }
  }

  Color get statusColor {
    switch (incident.status) {
      case 'مفتوح':
        return AppColors.accent;

      case 'قيد المراجعة':
        return AppColors.accent;

      case 'مغلق':
        return AppColors.success;

      default:
        return AppColors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),

            blurRadius: 6,

            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          // Priority + Incident ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                incident.id,

                style: const TextStyle(
                  fontSize: 11,

                  color: AppColors.gray,

                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),

                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: Text(
                  incident.priority,

                  style: TextStyle(
                    fontSize: 11,

                    color: priorityColor,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Title
          Text(
            incident.title,

            textAlign: TextAlign.right,

            style: const TextStyle(
              fontSize: 14,

              fontWeight: FontWeight.bold,

              color: AppColors.black,
            ),
          ),

          const SizedBox(height: 5),

          // Date and Time
          Text(
            '${incident.date} - ${incident.time}',

            textAlign: TextAlign.right,

            style: const TextStyle(fontSize: 11, color: AppColors.gray),
          ),

          const SizedBox(height: 10),

          // Trainer
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(
                'المدرب: ${incident.trainerName}',

                style: const TextStyle(fontSize: 11, color: AppColors.gray),
              ),

              const SizedBox(width: 5),

              const Icon(Icons.person_outline, size: 14, color: AppColors.gray),
            ],
          ),

          const SizedBox(height: 6),

          // Location
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(
                incident.location,

                style: const TextStyle(fontSize: 11, color: AppColors.gray),
              ),

              const SizedBox(width: 5),

              const Icon(
                Icons.location_on_outlined,

                size: 14,

                color: AppColors.gray,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Status + Arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // Arrow

              // Status
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),

                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: Text(
                  incident.status,

                  style: TextStyle(
                    fontSize: 10,

                    color: statusColor,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
