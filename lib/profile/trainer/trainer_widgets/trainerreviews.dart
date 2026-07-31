import 'package:flutter/material.dart';

class TrainerReviews extends StatelessWidget {
  const TrainerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'آراء المتدربين',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000), // الأسود الصريح لعنوان القسم لضمان أعلى وضوح
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'عرض الكل >',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF0E216C), // الكحلي الغامق الأساسي للنص التفاعلي
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _buildReviewItem('سارة خالد', 'مدرب خلوق وصبور جداً. ساعدني كثيراً في تجاوز عقدة القيادة في الزحام. أنصح به بشدة.'),
        const SizedBox(height: 8),
        _buildReviewItem('محمود علي', 'أسلوب الشرح ممتاز والسيارة حديثة ومريحة جداً. تمكنت من اجتياز الاختبار بنجاح.'),
      ],
    );
  }

  Widget _buildReviewItem(String name, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000), // الأسود الصريح لاسم المتدرب لضمان أعلى وضوح
              ),
            ),
            const Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                Icon(Icons.star_rounded, color: Colors.amber, size: 14),
              ],
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          comment,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF838C91), // الرمادي المعتمد لنصوص التعليقات لضمان مظهر نظيف ومقروء
            height: 1.3,
          ),
        ),
      ],
    );
  }
}