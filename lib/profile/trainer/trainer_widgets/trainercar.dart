import 'package:flutter/material.dart';

class TrainerCar extends StatelessWidget {
  const TrainerCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المركبة التدريبية',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح لعنوان القسم لضمان أعلى وضوح
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1590362891991-f776e747a588?q=80&w=300',
                width: 90,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تويوتا كورولا 2023',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000), // الأسود الصريح لاسم السيارة لضمان أعلى وضوح
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildTag('أوتوماتيك'),
                      const SizedBox(width: 6),
                      _buildTag('دواسات مزدوجة'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF838C91).withOpacity(0.08), // خلفية رمادية خفيفة ونظيفة للوسوم
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xFF838C91).withOpacity(0.2), // حدود رمادية خفيفة ومتناسقة
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: Color(0xFF0E216C), 
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}