import 'package:flutter/material.dart';
// 👍 استيراد شاشة التقييم الصحيح
import 'package:sawany/session_evaluation/session_evaluation_screen.dart';

class TrainerBottomBar extends StatelessWidget {
  const TrainerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF838C91).withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: const Color(0xFF838C91).withOpacity(0.2),
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // --- التعديل هنا 👇: الانتقال المباشر لشاشة تفاصيل وتقييم الجلسة ---
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SessionEvaluationScreen(), // 👈 الانتقال المباشر للشاشة بالكامل
                    ),
                  );
                },
                icon: const Icon(
                  Icons.rate_review_outlined, // أيقونة معبرة عن التقييم والتفاصيل
                  size: 18,
                  color: Color(0xFFFFFFFF),
                ),
                label: const Text(
                  'عرض تفاصيل الجلسة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E216C), // لون "سوقني" الكحلي المميز
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF838C91).withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF838C91).withOpacity(0.2),
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Color(0xFF0E216C),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}