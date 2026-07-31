import 'package:flutter/material.dart';

class PartnersBannerSection extends StatelessWidget {
  const PartnersBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0E216C), // الكحلي الغامق الأساسي
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'هل تملك مدرسة أو مركز تدريب قيادة؟',
            style: TextStyle(
              color: Color(0xFFFFFFFF), // أبيض للعناوين فوق الخلفية الداكنة
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'انضم إلى شبكة الشركاء المعتمدين واستقبل متدربين جدد يومياً عبر تطبيقنا.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF838C91), // رمادي ناعم للنصوص التوضيحية
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFE8511), // برتقالي التفاعل الأساسي (CTA)
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'تقديم طلب شراكة',
                style: TextStyle(
                  color: Color(0xFFFFFFFF), // أبيض فوق الزر البرتقالي لضمان التباين والقراءة
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}