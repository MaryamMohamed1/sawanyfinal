import 'package:flutter/material.dart';

class LicenseMapScreen extends StatelessWidget {
  const LicenseMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'خريطة استخراج الرخصة 🗺️',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('إجمالي نسبة التقدم', style: TextStyle(color: Colors.white70, fontSize: 13)),
                          SizedBox(height: 4),
                          Text('40% مكتملة', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D4ED8).withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.stars_rounded, color: Colors.amber, size: 32),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 0.40,
                      minHeight: 10,
                      backgroundColor: Colors.white24,
                      color: Color(0xFF3B82F6),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2 من 5 خطوات مكتملة', style: TextStyle(color: Colors.white60, fontSize: 12)),
                      Text('الخطوة القادمة: الاختبار النظري', style: TextStyle(color: Color(0xFF60A5FA), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const Text(
              'مراحل استخراج رخصة القيادة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 16),

            // Timeline Items
            _buildTimelineStep(
              stepNumber: '1',
              title: 'تجهيز الأوراق والمستندات المطلوبة',
              desc: 'رفع الهوية وصور شخصية والمؤهل الدراسي.',
              status: StepStatus.completed,
            ),
            _buildTimelineStep(
              stepNumber: '2',
              title: 'الكشف الطبي المعتمد',
              desc: 'فحوصات النظر وفصيلة الدم واللياقة البدنية.',
              status: StepStatus.completed,
            ),
            _buildTimelineStep(
              stepNumber: '3',
              title: 'الاختبار النظري (قواعد المرور)',
              desc: 'اختبار محوسب يتكون من 20 سؤالاً في إشارات المرور.',
              status: StepStatus.current,
            ),
            _buildTimelineStep(
              stepNumber: '4',
              title: 'الاختبار العملي وميدان القيادة',
              desc: 'تقييم مهارات القيادة والمناورة والركن.',
              status: StepStatus.locked,
            ),
            _buildTimelineStep(
              stepNumber: '5',
              title: 'إصدار واستلام رخصة القيادة',
              desc: 'طباعة الرخصة الذكية الرسمية أو التوصيل.',
              status: StepStatus.locked,
              isLast: true,
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D4ED8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text(
                  'متابعة الخطوة الحالية 🚀',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep({
    required String stepNumber,
    required String title,
    required String desc,
    required StepStatus status,
    bool isLast = false,
  }) {
    Color iconBgColor;
    IconData iconData;
    String statusLabel;
    Color statusBg;
    Color statusTextColor;

    switch (status) {
      case StepStatus.completed:
        iconBgColor = const Color(0xFF10B981);
        iconData = Icons.check_circle_rounded;
        statusLabel = 'مكتملة';
        statusBg = const Color(0xFFD1FAE5);
        statusTextColor = const Color(0xFF047857);
        break;
      case StepStatus.current:
        iconBgColor = const Color(0xFF1D4ED8);
        iconData = Icons.play_circle_fill_rounded;
        statusLabel = 'الحالية';
        statusBg = const Color(0xFFDBEAFE);
        statusTextColor = const Color(0xFF1D4ED8);
        break;
      case StepStatus.locked:
        iconBgColor = const Color(0xFF94A3B8);
        iconData = Icons.lock_rounded;
        statusLabel = 'مقفلة';
        statusBg = const Color(0xFFF1F5F9);
        statusTextColor = const Color(0xFF64748B);
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
              child: Icon(iconData, color: Colors.white, size: 20),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 70,
                color: status == StepStatus.completed ? const Color(0xFF10B981) : Colors.grey.shade300,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: status == StepStatus.current ? const Color(0xFF1D4ED8) : Colors.grey.shade200,
                width: status == StepStatus.current ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: statusBg, borderRadius: BorderRadius.circular(8)),
                      child: Text(statusLabel, style: TextStyle(color: statusTextColor, fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum StepStatus { completed, current, locked }
