import 'package:flutter/material.dart';
import 'map_details_section.dart';
import 'session_stats_section.dart';
import 'performance_notes_section.dart';
import 'rating_section.dart';
import 'package:sawany/profile/trainer/trainer_widgets/trainerbottombar.dart';
// استيراد الشاشات المرتبطة
import '../report_problem/report_problem_screen.dart'; 
import '../change_instructor/change_instructor_screen.dart';

class SessionEvaluationScreen extends StatelessWidget {
  const SessionEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E216C),
        elevation: 0,
        centerTitle: true,
        // سهم الرجوع في مكانه الحالي (على اليمين في الأبلكيشن العربي)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'تفاصيل الجلسة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      // التعديل هنا: خليانا جسم الشاشة فقط هو اللي من الشمال لليمين LTR
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // قسم تفاصيل الخريطة والموقع
              const MapDetailsSection(),
              const SizedBox(height: 16),

              // قسم إحصائيات الجلسة
              const SessionStatsSection(),
              const SizedBox(height: 16),
              
              // زرار تبديل المدرب
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0047BA),
                  side: const BorderSide(color: Color(0xFF0047BA)),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.swap_horiz, size: 18),
                label: const Text(
                  'هل تريد تبديل هذا المدرب؟',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeInstructorScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // قسم ملاحظات الأداء
              const PerformanceNotesSection(),
              const SizedBox(height: 16),

              // قسم التقييم
              const RatingSection(),
              const SizedBox(height: 12),

              // زرار الإبلاغ عن مشكلة
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.flag_outlined, size: 18),
                label: const Text(
                  'الإبلاغ عن مشكلة',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportProblemScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}