import 'package:flutter/material.dart';

class RejectedScreen extends StatelessWidget {
  const RejectedScreen({super.key});

  // الألوان المستخدمة في التصميم
  static const Color _primaryDark = Color(0xFF001055);
  static const Color _accentOrange = Color(0xFFFF8C00);
  static const Color _textGrey = Color(0xFF757575);
  static const Color _lightRedBg = Color(0xFFFFE0E0);
  static const Color _iconRed = Color(0xFFC62828);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضمان توافق اتجاه الشاشة مع اللغة العربية
      child: Scaffold(
        // شريط التطبيق العلوي
        appBar: AppBar(
          backgroundColor: _primaryDark,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // تفعيل زر الرجوع
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start, // تم التعديل لتبدأ من اليمين بشكل صحيح
            children: [
              Text(
                'حالة الطلب',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                'تتبع تقدم مراجعة طلبك',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ),
        // محتوى الشاشة الرئيسي
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // البطاقة البيضاء الرئيسية
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        // أيقونة الرفض (دائرة حمراء كبيرة)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: _lightRedBg,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.error,
                              color: _iconRed,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // علامة "مرفوض"
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: _lightRedBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'مرفوض',
                            style: TextStyle(color: _iconRed, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // العنوان الرئيسي "تم رفض الطلب"
                        const Text(
                          'تم رفض الطلب',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        // النص التفصيلي للرفض
                        const Text(
                          'للأسف، لم يتم التحقق من المستندات التي قدمتها. يرجى إعادة رفع المستندات المطلوبة مرة أخرى.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _textGrey, height: 1.5),
                        ),
                        const SizedBox(height: 30),

                        // قسم بطاقات أسباب الرفض
                        _buildRejectionReasonItem(
                          title: 'إثبات الشخصية',
                          subtitle: 'الصورة غير واضحة أو غير مقروءة',
                        ),
                        const SizedBox(height: 15),
                        _buildRejectionReasonItem(
                          title: 'رخصة القيادة',
                          subtitle: 'المستند منتهي الصلاحية',
                        ),

                        const SizedBox(height: 40),

                        // زر "إعادة رفع المستندات"
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // إجراء إعادة الرفع
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _accentOrange,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0,
                            ),
                            child: const Text(
                              'إعادة رفع المستندات',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // نص "تواصل مع الدعم" في الأسفل خارج البطاقة
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // إجراء التواصل
                  },
                  child: const Text(
                    'تواصل مع الدعم للمساعدة',
                    style: TextStyle(color: _primaryDark, fontWeight: FontWeight.w500),
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

  // دالة مساعدة لإنشاء عنصر سبب الرفض الواحد
  Widget _buildRejectionReasonItem({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الجزء الأيمن: النص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: _textGrey, fontSize: 12),
              ),
            ],
          ),
          // الجزء الأيسر: أيقونة الإكس
          const Icon(
            Icons.cancel_outlined,
            color: _iconRed,
            size: 22,
          ),
        ],
      ),
    );
  }
}
