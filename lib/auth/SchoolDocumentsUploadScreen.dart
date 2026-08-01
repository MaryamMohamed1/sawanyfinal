import 'package:flutter/material.dart';

// استيراد شاشة مراجعة الطلب اللي إنتي مجهزاها
import 'review_status_screen.dart'; 

class SchoolDocumentsUploadScreen extends StatefulWidget {
  const SchoolDocumentsUploadScreen({super.key});

  @override
  State<SchoolDocumentsUploadScreen> createState() => _SchoolDocumentsUploadScreenState();
}

class _SchoolDocumentsUploadScreenState extends State<SchoolDocumentsUploadScreen> {
  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color lightBg = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // دعم اللغة العربية
      child: Scaffold(
        backgroundColor: lightBg,
        appBar: AppBar(
          backgroundColor: primaryNavy,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'المستندات القانونية', 
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. هيدر توضيحي للمستخدم
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryNavy.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: primaryNavy.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline_rounded, color: primaryNavy, size: 30),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'توثيق مدرسة القيادة', 
                            style: TextStyle(fontWeight: FontWeight.bold, color: primaryNavy, fontSize: 15),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'يرجى رفع صور واضحة للمستندات التالية لضمان تفعيل حساب المدرسة وبدء استقبال المتدربين.',
                            style: TextStyle(color: Colors.black54, fontSize: 12, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              const Text(
                'قائمة المستندات المطلوبة', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy),
              ),
              const SizedBox(height: 16),

              // 2. استدعاء الميثودز بالـ Underscore المظبوطة زي الصورة بتاعتك بالظبط 👇
              _buildUploadCard(
                title: 'السجل التجاري (ساري)',
                subtitle: 'صورة واضحة من السجل التجاري الرسمي للمنشأة',
                icon: Icons.business_center_outlined,
              ),
              const  SizedBox(height: 12),
              _buildUploadCard(
                title: 'البطاقة الضريبية',
                subtitle: 'صورة واضحة للبطاقة الضريبية الخاصة بالمدرسة',
                icon: Icons.assignment_outlined,
              ),
              const  SizedBox(height: 12),
              _buildUploadCard(
                title: 'رخصة مزاولة نشاط مدرسة قيادة',
                subtitle: 'الرخصة الرسمية الصادرة من الإدارة العامة للمرور',
                icon: Icons.card_membership_rounded,
              ),
              const  SizedBox(height: 12),
              _buildUploadCard(
                title: 'عقد المقر / إثبات العنوان',
                subtitle: 'عقد إيجار أو تمليك موثق لمقر المدرسة الرئيسي',
                icon: Icons.location_city_rounded,
              ),
              const  SizedBox(height: 12),
              _buildUploadCard(
                title: 'بطاقة الرقم القومي للمدير المسئول',
                subtitle: 'صورة وجه وظهر البطاقة الشخصية سارية المفعول',
                icon: Icons.badge_outlined,
              ),

              const SizedBox(height: 40),

              // 3. زرار الإرسال الرئيسي الذي يفتح الديالوج
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => _showSuccessDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  child: const Text(
                    'إرسال المستندات للمراجعة', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // الميثود الخاصة بكِ بتبدأ بـ Underscore لتكون Private ومطابقة لملفك
  Widget _buildUploadCard({required String title, required String subtitle, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: primaryNavy.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: primaryNavy, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // أكشن فتح الـ File Picker لرفع الملفات
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: accentOrange),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'رفع', 
                style: TextStyle(color: accentOrange, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. الديالوج التأكيدي المربوط بشاشة المراجعة الحقيقية الخاصة بكِ
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // يمنع إغلاق الديالوج عند الضغط خارجه لضمان الضغط على الزر
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.green, size: 70),
            const SizedBox(height: 20),
            const Text(
              'تم استلام المستندات!', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryNavy),
            ),
            const SizedBox(height: 10),
            const Text(
              'سيقوم فريق سوقني بمراجعة بيانات مدرستكم خلال 48 ساعة والرد عبر البريد الإلكتروني.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  // 1. إغلاق الـ Dialog أولاً
                  Navigator.pop(context); 
                  
                  // 2. التوجيه والانتقال فوراً لشاشة مراجعة الطلب (review_status_screen.dart)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewStatusScreen(userType: 'school'), 
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryNavy,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('حسناً', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}