import 'package:flutter/material.dart';

class TrainerHeader extends StatelessWidget {
  const TrainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // --- تعديل الصورة هنا لأحمد المنصوري الحقيقي 👨 ---
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop',
              ),
            ),
            // أيقونة الحساب الموثق (Verified)
            Positioned(
              bottom: 2, // تظبيط مكان الأيقونة على الحافة بالظبط
              left: 2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF), // خلفية بيضاء صافية لتنظيف الإطار حول أيقونة التوثيق
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لأيقونة التوثيق البارزة
                  size: 18,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 6),
        const Text(
          'أحمد المنصوري',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لاسم المدرب البارز
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              '4.9',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xFF000000), // الأسود الصريح لرقم التقييم لضمان أعلى وضوح
              ),
            ),
            SizedBox(width: 8),
            Text(
              '•   خبرة 8 سنوات',
              style: TextStyle(
                color: Color(0xFF838C91), 
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}