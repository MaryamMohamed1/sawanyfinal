import 'package:flutter/material.dart';

// تم تحديث الاستيراد إلى شاشة النتائج المطلوبة

import '../Result/result.dart';

class ReviewStatusScreen extends StatelessWidget {
  final String userType;
  const ReviewStatusScreen({super.key, this.userType = 'school'});

  // Brand Palette Constants (دليل ألوان منصة "سوقني")
  static const Color primaryNavy = Color(
    0xFF0E216C,
  ); // 60%: الكحلي الغامق للعناوين والعناصر الرئيسية
  static const Color accentOrange = Color(
    0xFFFE8511,
  ); // 10%: البرتقالي المميز لأزرار الإجراءات (CTA) وبعض التنبيهات
  static const Color neutralWhite = Color(
    0xFFFFFFFF,
  ); // 30%: الأبيض للكروت والعناصر البارزة
  static const Color neutralGray = Color(
    0xFF838C91,
  ); // 30%: الرمادي للنصوص الثانوية
  static const Color backgroundLight = Color(
    0xFFF8FAFC,
  ); // خلفية الشاشة الهادئة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: primaryNavy,
        elevation: 0,
        iconTheme: const IconThemeData(color: neutralWhite),
        title: const Text(
          'حالة مراجعة الطلب 📋',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: neutralWhite, // 60% الكحلي لعنوان الشاشة
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Status Big Card (Under Review Example)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    primaryNavy,
                    Color(0xFF1D3580),
                  ], // تدرج مستوحى من الكحلي الأساسي
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: primaryNavy.withOpacity(0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: neutralWhite.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.manage_search_rounded,
                      color: neutralWhite,
                      size: 42,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'طلبك جاري مراجعته حاليًا ⏳',
                    style: TextStyle(
                      color: neutralWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'يقوم فريق التدريب والاعتماد في سوقني بالفحص المباشر للوثائق المرفوقة.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color:
                          accentOrange, // 10% البرتقالي المميز للنتيجة والتنبيهات
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'النتيجة المتوقعة: خلال 24 ساعة',
                      style: TextStyle(
                        color: neutralWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'مراحل التدقيق والمراجعة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryNavy,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Timeline Items
            _buildStatusStep(
              'تم إرسال الطلب بنجاح',
              '15 يوليو 2026 - 02:30 م',
              isDone: true,
            ),
            _buildStatusStep(
              'تم استلام الوثائق والمستندات',
              '15 يوليو 2026 - 02:35 م',
              isDone: true,
            ),
            _buildStatusStep(
              'جاري المراجعة بواسطة اللجنة المختصة',
              'جاري العمل الآن',
              isCurrent: true,
            ),
            _buildStatusStep(
              'القرار النهائي (القبول أو الرفض)',
              'في الانتظار...',
              isLocked: true,
              isLast: true,
            ),

            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file_rounded),
                    label: const Text('إعادة رفع المستندات'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryNavy,
                      side: const BorderSide(color: primaryNavy, width: 1.5),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(userType: userType),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.dashboard_rounded,
                      color: neutralWhite,
                    ),
                    label: const Text(
                      'عرض النتائج',
                      style: TextStyle(color: neutralWhite),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          accentOrange, // 10% البرتقالي المميز لزر الإجراءات الأساسي (CTA)
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(
    String title,
    String time, {
    bool isDone = false,
    bool isCurrent = false,
    bool isLocked = false,
    bool isLast = false,
  }) {
    Color iconBg = isDone
        ? const Color(0xFF10B981) // أخضر للحالات المكتملة
        : isCurrent
        ? accentOrange // 10% البرتقالي المميز للحالة الجارية حالياً
        : neutralGray.withOpacity(0.4);

    IconData icon = isDone
        ? Icons.check
        : isCurrent
        ? Icons.sync
        : Icons.circle_outlined;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
              child: Icon(icon, color: neutralWhite, size: 18),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: isDone
                    ? const Color(0xFF10B981)
                    : neutralGray.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isLocked
                        ? neutralGray
                        : primaryNavy, // 60% الكحلي للنصوص النشطة
                  ),
                ),
                Text(time, style: TextStyle(fontSize: 12, color: neutralGray)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
