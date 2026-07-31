import 'package:flutter/material.dart';

class TrainerBio extends StatelessWidget {
  const TrainerBio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نبذة عن المدرب',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح للعنوان الرئيسي لضمان أعلى وضوح
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'مدرب قيادة معتمد ومحترف بخبرة تتجاوز 8 سنوات في تدريب القيادة المتقدمة والوقائية. متخصص في تأهيل المتدربين لاجتياز اختبارات القيادة بكفاءة عالية.',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF838C91), // الرمادي المعتمد لنصوص التفاصيل والوصف
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildBadgeCard('مدرب معتمد', 'هيئة النقل', Icons.verified_user_outlined)),
            const SizedBox(width: 8),
            Expanded(child: _buildBadgeCard('إسعافات أولية', 'شهادة معتمدة', Icons.medical_services_outlined)),
          ],
        ),
      ],
    );
  }

  Widget _buildBadgeCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF838C91).withOpacity(0.08), // خلفية رمادية خفيفة ومصقولة للبطاقات
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF838C91).withOpacity(0.2), // الرمادي المعتمد للحدود
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: const Color(0xFF0E216C), // الكحلي الغامق الأساسي لأيقونات الشارات
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // الأسود الصريح لعنوان الشارة لضمان أعلى وضوح
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color(0xFF838C91), // الرمادي المعتمد للعنوان الفرعي
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}