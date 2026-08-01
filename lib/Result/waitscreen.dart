import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {
  const WaitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF102065), // لون الخلفية العلوية
        appBar: AppBar(
          backgroundColor: const Color(0xFF102065),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              // يمكنك إضافة الكود العودة هنا
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'حالة الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'تتبع تقدم مراجعة طلبك',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // البطاقة البيضاء الكبرى
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            // أيقونة الساعة الرملية
                            Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF3E0),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.hourglass_empty,
                                size: 50,
                                color: Color(0xFFF57C00),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // عنوان الحالة
                            const Text(
                              'طلبك قيد المراجعة',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // وصف الحالة
                            const Text(
                              'مستنداتك قيد المراجعة حاليًا. سنقوم بإخطارك بمجرد اكتمال عملية التحقق.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 25),
                            // الخطوة والتقدم
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'الخطوة 2 من 3: التحقق',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  'جارِ المعالجة',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF57C00),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // شريط التقدم (Progress Bar)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.66, // يمثل الخطوة الثانية من 3
                                backgroundColor: Colors.grey.shade200,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFFF57C00),
                                ),
                                minHeight: 8,
                              ),
                            ),
                            const SizedBox(height: 25),
                            // المربعات السفلية (تاريخ التقديم وحالة الهوية)
                            Row(
                              children: [
                                Expanded(
                                  child: _buildInfoCard(
                                    title: 'حالة الهوية',
                                    value: 'تم الرفع',
                                    valueColor: const Color(0xFF102065),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildInfoCard(
                                    title: 'تاريخ التقديم',
                                    value: '12 أكتوبر 2023',
                                    valueColor: const Color(0xFF102065),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      // النص السفلي للإرشاد
                      const Text(
                        'وقت المراجعة المعتاد هو 2-3 أيام عمل. يرجى التحقق لاحقًا.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لإنشاء البطاقات الصغيرة في الأسفل
  Widget _buildInfoCard({
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}