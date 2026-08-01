import 'package:flutter/material.dart';
import '../wallet/widgets/school_navigation_wrapper.dart';
import '../tranier/trainer_main_wrapper.dart';

class AcceptedScreen extends StatelessWidget {
  final String userType;
  const AcceptedScreen({super.key, this.userType = 'school'});

  // تعريف الألوان المستخدمة في التصميم
  static const Color _primaryDark = Color(0xFF001055); // الأزرق الغامق (AppBar)
  static const Color _accentOrange = Color(0xFFFF8C00); // البرتقالي (الزر)
  static const Color _textGrey = Color(0xFF757575); // الرمادي (النص الفرعي)
  static const Color _lightGreenBg = Color(
    0xFFE8F5E9,
  ); // الأخضر الفاتح (خلفية الأيقونة)
  static const Color _iconGreen = Color(0xFF2E7D32); // الأخضر الغامق (الأيقونة)

  @override
  Widget build(BuildContext context) {
    // استخدام Directionality لضمان محاذاة العناصر من اليمين إلى اليسار (RTL)
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // 1. شريط التطبيق (AppBar)
        appBar: AppBar(
          backgroundColor: _primaryDark,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // العودة للشاشة السابقة
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'حالة الطلب',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'تتبع تقدم مراجعة طلبك',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        // 2. محتوى الشاشة الرئيسي
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // 3. البطاقة البيضاء الرئيسية
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        // 3.1. دائرة الأيقونة الخضراء
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: _lightGreenBg,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check_circle,
                              color: _iconGreen,
                              size: 80,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // 3.2. العنوان الرئيسي "تم قبول الطلب"
                        const Text(
                          'تم قبول الطلب',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),

                        // 3.3. النص الفرعي
                        const Text(
                          'تهانينا! تم التحقق من مستنداتك بنجاح. يمكنك الآن البدء في استخدام المنصة.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _textGrey,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // 3.4. شريط التقدم (Progress Bar)
                        const Row(
                          children: [
                            Expanded(
                              child: _ProgressSegment(
                                color: _iconGreen,
                                isFirst: true,
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: _ProgressSegment(color: _iconGreen),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: _ProgressSegment(
                                color: _iconGreen,
                                isFirst: false,
                                isLast: true,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),

                        // 3.5. زر "عرض الملف الشخصي" (ينقل لشاشة إدارة المدربين)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // الانتقال إلى شاشة إدارة المدربين
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => userType == 'coach'
                                      ? const TrainerMainWrapper()
                                      : const SchoolNavigationWrapper(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _accentOrange,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'عرض الملف الشخصي',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ويدجت مساعد لإنشاء جزء واحد من شريط التقدم
class _ProgressSegment extends StatelessWidget {
  final Color color;
  final bool isFirst;
  final bool isLast;

  const _ProgressSegment({
    required this.color,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(4) : Radius.zero,
          bottomLeft: isFirst ? const Radius.circular(4) : Radius.zero,
          topRight: isLast ? const Radius.circular(4) : Radius.zero,
          bottomRight: isLast ? const Radius.circular(4) : Radius.zero,
        ),
      ),
    );
  }
}