import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // استيراد مكتبة اختيار الصور


// استيراد شاشة حالة المراجعة
import 'review_status_screen.dart';

class CoachRegistrationScreen extends StatefulWidget {
  const CoachRegistrationScreen({super.key});

  @override
  State<CoachRegistrationScreen> createState() => _CoachRegistrationScreenState();
}

class _CoachRegistrationScreenState extends State<CoachRegistrationScreen> {
  // Brand Palette Constants (دليل ألوان منصة "سوقني")
  static const Color primaryNavy = Color(0xFF0E216C);      // الكحلي الغامق
  static const Color accentOrange = Color(0xFFFE8511);     // البرتقالي التفاعلي (CTA)
  static const Color neutralWhite = Color(0xFFFFFFFF);     // الأبيض
  static const Color neutralGray = Color(0xFF838C91);      // الرمادي
  static const Color textDark = Color(0xFF0F172A);         // الأسود الداكن
  static const Color backgroundLight = Color(0xFFF8FAFC);  // الخلفية

  final _formKey = GlobalKey<FormState>();
  bool _acceptedTerms = false;
  String _transmission = 'automatic';
  
  final ImagePicker _picker = ImagePicker(); // تعريف متغير الـ Picker

  // دالة اختيار واستهداف الصورة باستخدام image_picker
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        // هنا يمكنك تخزين مسار الصورة في متغير لعرضه داخل الـ CircleAvatar
        // مثال: setState(() { _selectedImageFile = File(image.path); });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم اختيار الصورة بنجاح')),
        );
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  // دالة لإظهار قائمة اختيار مصدر الصورة (كاميرا أو كمبيوتر/استوديو)
  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: neutralWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: neutralGray.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'اختر طريقة تحميل الصورة الشخصية',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryNavy),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryNavy.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.camera_alt, color: primaryNavy),
                ),
                title: const Text('التقاط صورة بالكاميرا', style: TextStyle(fontWeight: FontWeight.w600, color: textDark)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera); // فتح الكاميرا
                },
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accentOrange.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.computer, color: accentOrange),
                ),
                title: const Text('التحميل من الجهاز / الكمبيوتر', style: TextStyle(fontWeight: FontWeight.w600, color: textDark)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery); // فتح معرض الصور / الجهاز
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: primaryNavy,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'الانضمام كمدرب قيادة 🚘',
          style: TextStyle(fontWeight: FontWeight.bold, color: neutralWhite),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: neutralWhite),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar upload with BottomSheet trigger
              Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _showImageSourceBottomSheet,
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 46,
                            backgroundColor: Color(0xFFE2E8F0),
                            child: Icon(Icons.person, size: 50, color: neutralGray),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: accentOrange,
                              child: const Icon(Icons.camera_alt, size: 16, color: neutralWhite),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('تحميل الصورة الشخصية', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: neutralGray)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Basic Info Fields
              _buildInputField('الاسم بالكامل', 'أدخل اسمك كما هو بالمستندات', Icons.person_outline),
              const SizedBox(height: 16),
              _buildInputField('رقم الهاتف', '05xxxxxxxx', Icons.phone_outlined, keyboardType: TextInputType.phone),
              const SizedBox(height: 16),
              _buildInputField('البريد الإلكتروني', 'example@domain.com', Icons.email_outlined, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(child: _buildInputField('سنوات الخبرة', 'مثال: 5 سنوات', Icons.star_outline, keyboardType: TextInputType.number)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildInputField('نوع السيارة', 'تويوتا كامري 2024', Icons.directions_car_outlined)),
                ],
              ),
              const SizedBox(height: 20),

              const Text('ناقل الحركة (الجير)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primaryNavy)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('أوتوماتيك', style: TextStyle(fontSize: 13, color: textDark)),
                      value: 'automatic',
                      groupValue: _transmission,
                      activeColor: accentOrange,
                      onChanged: (val) => setState(() => _transmission = val!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('عادي (مانيوال)', style: TextStyle(fontSize: 13, color: textDark)),
                      value: 'manual',
                      groupValue: _transmission,
                      activeColor: accentOrange,
                      onChanged: (val) => setState(() => _transmission = val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Document Upload Cards
              const Text('رفع المستندات الرسمية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: primaryNavy)),
              const SizedBox(height: 12),
              _buildFileUploadCard('رخصة القيادة السارية', 'صور وجهي الرخصة بوضوح', Icons.badge_outlined),
              const SizedBox(height: 10),
              _buildFileUploadCard('البطاقة الشخصية / الهوية', 'صورة واضحة من الهوية الوطنية', Icons.credit_card_outlined),
              const SizedBox(height: 10),
              _buildFileUploadCard('شهادة التدريب المعتمدة', 'شهادة ممارسة مهنة تدريب القيادة', Icons.workspace_premium_outlined),
              const SizedBox(height: 10,),
              _buildFileUploadCard('الفيش والتشبيه','صحيفة الحالة الجنائية سارية',Icons.gavel_outlined,),
              const SizedBox(height: 10),
              _buildFileUploadCard('صورة سيارة التدريب','صورة واضحة لسيارة تعليم القيادة',Icons.directions_car_filled_outlined,),

              const SizedBox(height: 20),
              CheckboxListTile(
                value: _acceptedTerms,
                activeColor: accentOrange,
                onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
                title: const Text('أوافق على الشروط والأحكام وسياسة خصوصية منصة سوقني', style: TextStyle(fontSize: 12, color: textDark)),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewStatusScreen(userType: 'coach'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentOrange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('إرسال طلب الانضمام 📤', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: neutralWhite)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, IconData icon, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: primaryNavy)),
        const SizedBox(height: 6),
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: neutralGray.withOpacity(0.7)),
            prefixIcon: Icon(icon, color: neutralGray),
            filled: true,
            fillColor: neutralWhite,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: neutralGray.withOpacity(0.3))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: neutralGray.withOpacity(0.2))),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: neutralWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: neutralGray.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: primaryNavy.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: primaryNavy),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: textDark)),
                Text(subtitle, style: TextStyle(color: neutralGray, fontSize: 11)),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: accentOrange,
              side: const BorderSide(color: accentOrange),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: const Text('رفع الملف', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}