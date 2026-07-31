import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Brand Palette Constants (دليل ألوان منصة "سوقني")
  static const Color primaryNavy = Color(0xFF0E216C);      // 60%: الكحلي الغامق للعناوين والعناصر الرئيسية
  static const Color accentOrange = Color(0xFFFE8511);     // 10%: البرتقالي التفاعلي لأزرار الإجراءات (CTA)
  static const Color neutralWhite = Color(0xFFFFFFFF);     // 30%: الأبيض للكروت والخلفيات
  static const Color neutralGray = Color(0xFF838C91);      // 30%: الرمادي للنصوص الثانوية والحدود
  static const Color textBlack = Color(0xFF000000);        // الأسود للعناوين الرئيسية
  static const Color backgroundLight = Color(0xFFF8F9FB);  // خلفية الشاشة الهادئة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: primaryNavy,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تسجيل الحضور والانصراف',
          style: TextStyle(color: neutralWhite, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: neutralWhite),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: neutralWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSessionInfoCard(),
            const SizedBox(height: 16),
            _buildArrivalCard(),
            const SizedBox(height: 16),
            _buildDepartureCard(),
            const SizedBox(height: 16),
            _buildSummaryCard(),
            const SizedBox(height: 24),
            
            // رسالة التنبيه اللي تحت
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryNavy.withOpacity(0.06),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: primaryNavy),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'يرجى التأكد من تسجيل الوصول والانصراف في الوقت المناسب. هذا يساعدنا على تتبع حضورك بدقة.',
                      style: TextStyle(color: primaryNavy, fontSize: 12, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. كارت تفاصيل الجلسة
  Widget _buildSessionInfoCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: neutralGray.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // خريطة مصغرة
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 80,
              height: 100,
              color: backgroundLight,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: primaryNavy),
                  SizedBox(height: 4),
                  Text('الخريطة', style: TextStyle(fontSize: 10, color: neutralGray)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // التفاصيل
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('مركز تدريب القيادة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: textBlack)),
                    Icon(Icons.business, color: primaryNavy, size: 18),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: neutralGray),
                    SizedBox(width: 4),
                    Text('اليوم، 23 يوليو 2026', style: TextStyle(fontSize: 12, color: neutralGray)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: neutralGray),
                    SizedBox(width: 4),
                    Text('3:00 م - 5:00 م', style: TextStyle(fontSize: 12, color: neutralGray)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.directions_car, size: 14, color: neutralGray),
                    SizedBox(width: 4),
                    Text('تدريب عملي - أوتوماتيك', style: TextStyle(fontSize: 12, color: neutralGray)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. كارت تسجيل الوصول (الأخضر للحالة الناجحة مع لمسات متناسقة)
  Widget _buildArrivalCard() {
    return Container(
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('تسجيل الوصول', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.green.shade50,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('2:58', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green)),
                    SizedBox(width: 16),
                    Icon(Icons.check_circle, color: Colors.green, size: 36),
                  ],
                ),
                const Text('23 يوليو 2026', style: TextStyle(color: neutralGray)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.green.shade700, size: 16),
                    const SizedBox(width: 4),
                    Text('تم تسجيل الموقع بنجاح', style: TextStyle(color: Colors.green.shade700, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(11)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('تسجيل الوصول', style: TextStyle(color: neutralWhite, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Icon(Icons.check_circle_outline, color: neutralWhite, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. كارت تسجيل الانصراف (تم استبدال الأزرار العادية بلون التفاعل البرتقالي CTA أو الكحلي حسب الحاجة)
  Widget _buildDepartureCard() {
    return Container(
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: neutralGray.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('تسجيل الانصراف', style: TextStyle(color: accentOrange, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: accentOrange.withOpacity(0.06),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('--:--', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: accentOrange)),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, color: accentOrange, size: 36),
                  ],
                ),
                SizedBox(height: 8),
                Text('اضغط على زر تسجيل الانصراف عند انتهاء الحصة', style: TextStyle(color: neutralGray, fontSize: 12)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // كود تغيير الوقت عند الانصراف
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: accentOrange, // 10% البرتقالي التفاعلي للإجراءات الأساسية
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(11)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('تسجيل الانصراف', style: TextStyle(color: neutralWhite, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.stop_circle_outlined, color: neutralWhite, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. كارت ملخص الجلسة
  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: neutralGray.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('ملخص الجلسة', style: TextStyle(fontWeight: FontWeight.bold, color: textBlack)),
              SizedBox(width: 8),
              Icon(Icons.assignment_outlined, color: primaryNavy),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _summaryItem('وقت الوصول', '2:58 م', Colors.green),
              _summaryItem('وقت الانصراف', '-', textBlack),
              _summaryItem('مدة الجلسة', '-', textBlack),
              Column(
                children: [
                  const Text('الحالة', style: TextStyle(fontSize: 12, color: neutralGray)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: primaryNavy.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('لم تكتمل بعد', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryNavy)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryItem(String title, String value, Color valueColor) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 12, color: neutralGray)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: valueColor)),
      ],
    );
  }
}