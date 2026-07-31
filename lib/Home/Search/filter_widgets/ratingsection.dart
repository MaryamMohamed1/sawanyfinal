import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  final String selectedRating;
  final ValueChanged<String> onRatingSelected;

  const RatingSection({
    super.key,
    required this.selectedRating,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'التقييم',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildRatingChip('5 نجوم', '5'),
            _buildRatingChip('4 نجوم فأكثر', '4+'),
            _buildRatingChip('3 نجوم فأكثر', '3+'),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingChip(String label, String value) {
    final isSelected = selectedRating == value;
    return InkWell(
      onTap: () => onRatingSelected(value),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0E216C) : const Color(0xFFFFFFFF), // الكحلي الغامق الأساسي عند التحديد، والأبيض كخلفية افتراضية
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91).withOpacity(0.3), // الرمادي المعتمد للحدود غير المحددة
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star_rounded,
              size: 16,
              color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFFFE8511), // البرتقالي التفاعلي المعتمد للنجوم بالحالة العادية، والأبيض عند التحديد
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF000000), // الأسود للنصوص العادية والأبيض للنصوص المحددة لضمان الوضوح
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}