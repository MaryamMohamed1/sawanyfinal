import 'package:flutter/material.dart';

// استيراد الملفات المطلوبة (تأكدي من صحة المسارات في مشروعك)
import 'student_signup_screens.dart';
import 'school_signup_screen.dart';
import 'coach_signin_screen.dart';
import 'review_status_screen.dart'; 

// --- 🌟 شاشة "قريباً" الجديدة للبرنامج الرابع ---
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E216C),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'برنامج مدرب الفريلانسر',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // إنيميشن أو أيقونة معبرة
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE8511).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.rocket_launch_rounded,
                  size: 80,
                  color: Color(0xFFFE8511),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'قريباً جداً... 🚀',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'نحن نعمل على تجهيز المنهج التدريبي المتكامل لنساعدك على تحويل مهارتك في القيادة إلى مصدر دخل مستدام والعمل كمدرب فريلانسر معتمد عبر منصة سوقني.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF838C91),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- شاشة اختيار الهوية الرئيسية ---
class IdentitySelectionScreen extends StatelessWidget {
  const IdentitySelectionScreen({Key? key}) : super(key: key);

  // Brand Palette Constants (دليل ألوان منصة "سوقني")
  static const Color primaryNavy = Color(0xFF0E216C);      // 60%: الكحلي الغامق
  static const Color accentOrange = Color(0xFFFE8511);     // 10%: البرتقالي المميز
  static const Color neutralWhite = Color(0xFFFFFFFF);     // 30%: الأبيض
  static const Color neutralGray = Color(0xFF838C91);      // 30%: الرمادي للنصوص الثانوية
  static const Color neutralBlack = Color(0xFF000000);     // 30%: الأسود للعناوين

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // خلفية رمادي فاتح جداً لتبان الكروت البيضاء
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              // Screen Title
              const Text(
                'كيف تحب أن تبدأ رحلتك؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: neutralBlack,
                ),
              ),

              const SizedBox(height: 32),
              
              // --- 1. Driving School Option (مدرسة تدريب) ---
              _buildHorizontalIdentityCard(
                context: context,
                title: 'مدرسة تدريب قيادة',
                description: 'إدارة المتدربين والمدربين، وتوسيع نطاق مدرستك الاستثماري.',
                icon: Icons.apartment_rounded,
                iconBgColor: primaryNavy.withOpacity(0.08),
                iconColor: primaryNavy,
                buttonWidget: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SchoolAuthScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryNavy, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('طلب انضمام مدرسة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryNavy)),
                ),
              ),

              const SizedBox(height: 16),

              // --- 2. Coach/Trainer Option (مدرب مستقل) ---
              _buildHorizontalIdentityCard(
                context: context,
                title: 'كابتن / مدرب مستقل',
                description: 'تقديم حصص تدريبية عملية، تدريب الطلاب، وحصد الأرباح شهرياً.',
                icon: Icons.directions_car_filled_rounded,
                iconBgColor: primaryNavy.withOpacity(0.08),
                iconColor: primaryNavy,
                buttonWidget: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CoachAuthScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryNavy, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('تسجيل كمدرب', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryNavy)),
                ),
              ),

              const SizedBox(height: 16),

              // --- 3. Student Option (متدرب قيادة) ---
              _buildHorizontalIdentityCard(
                context: context,
                title: 'متدرب قيادة الجديد',
                description: 'ابحث عن أفضل الدورات والمدارس القريبة منك، وابدأ رحلة التعلم الآن.',
                icon: Icons.school_rounded,
                iconBgColor: accentOrange.withOpacity(0.1),
                iconColor: accentOrange,
                titleColor: accentOrange,
                buttonWidget: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentOrange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('استمرار كمتدرب', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: neutralWhite)),
                ),
              ),

              const SizedBox(height: 16),

              // --- 4. ✨ الخيار الجديد: من متدرب إلى مدرب (فريلانسر) ---
              _buildHorizontalIdentityCard(
                context: context,
                title: 'من متدرب إلى مدرب (فريلانسر)',
                description: 'هل أتقنت القيادة وتريد العمل؟ تعلم كيف تصبح مدرباً معتمداً وابدأ جني الأرباح معنا.',
                icon: Icons.engineering_rounded,
                iconBgColor: const Color(0xFFE2E8F0),
                iconColor: primaryNavy,
                titleColor: primaryNavy,
                buttonWidget: ElevatedButton(
                  onPressed: () {
                    // الانتقال المباشر لشاشة قريباً المتواجدة بالأعلى 🚀
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ComingSoonScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryNavy,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('اكتشف البرنامج', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: neutralWhite)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت ذكية لعمل الكارت بالعرض منعا لتكرار الكود
  Widget _buildHorizontalIdentityCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required Widget buttonWidget,
    Color titleColor = primaryNavy,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: neutralGray.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: primaryNavy.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // الأيقونة على اليمين (عربي)
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
          
          const SizedBox(width: 16),
          
          // النصوص والزرار في المنتصف واليسار
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: titleColor),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: neutralGray, height: 1.4),
                ),
                const SizedBox(height: 12),
                // الزرار مخصص لكل كارت وبياخد مساحته المريحة تحت النص
                SizedBox(
                  width: 140, // حجم مناسب جداً للزرار بالعرض
                  height: 36,
                  child: buttonWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}