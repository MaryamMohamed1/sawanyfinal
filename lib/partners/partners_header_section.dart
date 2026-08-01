import 'package:flutter/material.dart';

class PartnersHeaderSection extends StatelessWidget {
  const PartnersHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Column(
            children: [
              Text(
                'شبكة مراكز وأكاديميات القيادة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // أسود للعناوين الرئيسية
                ),
              ),
              SizedBox(height: 4),
              Text(
                'نثق بأفضل مدارس ومراكز تدريب القيادة المعتمدة في مصر',
                style: TextStyle(
                  color: Color(0xFF838C91), // رمادي للنصوص الثانوية
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFE8511), // برتقالي التفاعل الأساسي (CTA)
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            icon: const Icon(Icons.add_business_outlined, color: Color(0xFFFFFFFF), size: 18), // أبيض فوق البرتقالي
            label: const Text(
              'انضمام مدرسة / مركز تدريب',
              style: TextStyle(
                color: Color(0xFFFFFFFF), // أبيض فوق البرتقالي
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}