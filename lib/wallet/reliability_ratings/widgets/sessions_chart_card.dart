import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_rating_model.dart';

class SessionsChartCard extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const SessionsChartCard({super.key, required this.trainers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(color: AppColors.border),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const Text(
            'الحصص المكتملة',

            style: TextStyle(
              fontSize: 12,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 180,

            child: CustomPaint(
              painter: SessionsChartPainter(trainers: trainers),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionsChartPainter extends CustomPainter {
  final List<TrainerRatingModel> trainers;

  SessionsChartPainter({required this.trainers});

  @override
  void paint(Canvas canvas, Size size) {
    if (trainers.isEmpty) return;

    final maxSessions = trainers
        .map((trainer) => trainer.completedSessions)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    final barWidth = size.width / (trainers.length * 2).toDouble();

    for (int i = 0; i < trainers.length; i++) {
      final trainer = trainers[i];

      final barHeight = maxSessions == 0
          ? 0.0
          : (trainer.completedSessions.toDouble() / maxSessions) *
                (size.height - 35.0);

      final x = i.toDouble() * barWidth * 2.0 + barWidth / 2.0;

      final y = size.height - barHeight - 20.0;

      final paint = Paint()..color = AppColors.primary;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),

          const Radius.circular(4),
        ),

        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: trainer.name.split(' ').first,

          style: const TextStyle(fontSize: 8, color: AppColors.gray),
        ),

        textDirection: TextDirection.rtl,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,

        Offset(x + (barWidth - textPainter.width) / 2, size.height - 16),
      );
    }
  }

  @override
  bool shouldRepaint(covariant SessionsChartPainter oldDelegate) {
    return oldDelegate.trainers != trainers;
  }
}
