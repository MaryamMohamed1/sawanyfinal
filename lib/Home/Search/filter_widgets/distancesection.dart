import 'package:flutter/material.dart';

class DistanceSection extends StatelessWidget {
  final double distance;
  final ValueChanged<double> onChanged;

  const DistanceSection({
    super.key,
    required this.distance,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'الموقع (المسافة)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
              ),
            ),
            Text(
              '${distance.toInt()} كم',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لعرض القيمة النشطة
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 9),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            value: distance,
            min: 0,
            max: 50,
            activeColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للجزء النشط من الشريط
            inactiveColor: const Color(0xFF838C91).withOpacity(0.3), // الرمادي المعتمد للجزء غير النشط
            onChanged: onChanged,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0 كم',
              style: TextStyle(
                color: Color(0xFF838C91), // الرمادي المعتمد للنصوص التفصيلية
                fontSize: 12,
              ),
            ),
            Text(
              '50 كم',
              style: TextStyle(
                color: Color(0xFF838C91), // الرمادي المعتمد للنصوص التفصيلية
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}