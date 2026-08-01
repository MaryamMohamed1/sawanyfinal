import 'package:flutter/material.dart';
import 'package:sawany/tranier/trainer_main_wrapper.dart';
import 'coach_registration_screen.dart';

class CoachAuthScreen extends StatefulWidget {
  const CoachAuthScreen({super.key});

  @override
  State<CoachAuthScreen> createState() => _CoachAuthScreenState();
}

class _CoachAuthScreenState extends State<CoachAuthScreen> {
  // حالة الشاشة
  bool isLogin = true;
  bool showOtp = false;
  bool _isObscured = true;

  // Controllers للبيانات
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final carTypeController = TextEditingController();
  final experienceController = TextEditingController();
  final otpController = TextEditingController();

// ألوان الهوية
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color lightBg = Color(0xFFF8F9FA);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // 1. اللوجو (أيقونة السيارة + اسم سوقني)
                const Icon(Icons.directions_car_filled_rounded, size: 70, color: primaryNavy),
                const SizedBox(height: 8),
                const Text(
                  'سَوِّقْنِي',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1),
                ),
                const Text(
                  'بوابة الكباتن والمدربين',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                
                const SizedBox(height: 35),

                // 2. تابة التبديل (تسجيل الدخول / إنشاء حساب)
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      // زر تسجيل الدخول
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = true;
                              showOtp = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isLogin ? primaryNavy : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: isLogin ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // زر إنشاء حساب
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLogin = false;
                              showOtp = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !isLogin ? primaryNavy : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  color: !isLogin ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ==========================================
                // 3. عرض الحقول بناءً على الحالة (OTP / تسجيل / حساب جديد)
                // ==========================================
                
                if (showOtp) ...[
                  // ---------------- حالة الـ OTP ----------------
                  const Text('تم إرسال كود التحقق إلى رقم هاتفك', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: otpController,
                    hint: 'أدخل رمز التحقق (OTP)',
                    icon: Icons.verified_user_rounded,
                    keyboardType: TextInputType.number,
                  ),
                ] 
                
                else if (isLogin) ...[
                  // ---------------- حالة تسجيل الدخول ----------------
                  _buildTextField(
                    controller: phoneController,
                    hint: 'رقم الهاتف',
                    icon: Icons.phone_enabled_rounded,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: passwordController,
                    hint: 'كلمة المرور',
                    icon: Icons.lock_outline_rounded,
                    isPassword: true,
                    isObscured: _isObscured,
                    onSuffixTap: () => setState(() => _isObscured = !_isObscured),
                  ),
                ] 
                
                else ...[
                  // ---------------- حالة إنشاء حساب جديد ----------------
                  
                  // صورة البروفايل
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(Icons.person, size: 50, color: Colors.grey.shade400),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(color: accentOrange, shape: BoxShape.circle),
                              child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text('تحميل الصورة الشخصية', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(controller: nameController, hint: 'الاسم بالكامل', icon: Icons.person_outline),
                  const SizedBox(height: 16),
                  _buildTextField(controller: phoneController, hint: 'رقم الهاتف', icon: Icons.phone_android_rounded, keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),
                  _buildTextField(controller: emailController, hint: 'البريد الإلكتروني', icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  
                  // نوع السيارة والخبرة في سطر واحد
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(controller: carTypeController, hint: 'نوع السيارة', icon: Icons.directions_car_outlined),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTextField(controller: experienceController, hint: 'سنوات الخبرة', icon: Icons.star_border_rounded, keyboardType: TextInputType.number),
                      ),
                    ],
                  ),
                ],

                // ==========================================
                // 4. زر الإجراء الرئيسي (ديناميكي حسب الحالة)
                // ==========================================
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLogin) {
                        // لو بيعمل تسجيل دخول، يدخل للداشبورد فوراً
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TrainerMainWrapper()));
                      } else {
                        // لو بيسجل حساب جديد
                        if (!showOtp) {
                          // يفتحله شاشة الـ OTP الأول
                          setState(() => showOtp = true);
                        } else {
                          // لو دخل الـ OTP صح يدخله على شاشة تسجيل الكوتش
                          if (otpController.text.isNotEmpty) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CoachRegistrationScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('برجاء إدخال رمز التحقق'), backgroundColor: Colors.red),
                            );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentOrange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      showOtp ? 'تأكيد الرمز' : (isLogin ? 'تسجيل الدخول' : 'إنشاء حساب مدرب'),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // 6. المتابعة باستخدام جوجل (المعدل والمحمي من الإيرور)
SizedBox(
  width: double.infinity,
  height: 52,
  child: OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: BorderSide(color: Colors.grey.shade400, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'المتابعة باستخدام جوجل', 
          style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold)
        ),
        const SizedBox(width: 12),
        // حددنا الحجم هنا وحطينا لينك بديل ومستقر تماماً 👇
        SizedBox(
          width: 18,
          height: 18,
          child: Image.network(
            'https://fonts.gstatic.com/s/i/productlogos/googleg/v6/web-24dp/logo_googleg_color_24dp.png',
            fit: BoxFit.contain,
            // ده عشان لو اللينك قطع لأي سبب يعرض أيقونة بديلة وميبوظش الشاشة
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.g_mobiledata_rounded, color: Colors.red, size: 24);
            },
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

  // ---------------------------------------------------
  // ويدجتس مساعدة (Helpers)
  // ---------------------------------------------------

  // 1. حقل إدخال مخصص
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isObscured = false,
    VoidCallback? onSuffixTap,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscured,
        keyboardType: keyboardType,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.normal, fontSize: 13),
          prefixIcon: Icon(icon, color: Colors.grey.shade500, size: 20),
          suffixIcon: isPassword 
              ? IconButton(
                  icon: Icon(isObscured ? Icons.lock_outline_rounded : Icons.lock_open_rounded, color: Colors.grey.shade600, size: 20),
                  onPressed: onSuffixTap,
                ) 
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    carTypeController.dispose();
    experienceController.dispose();
    otpController.dispose();
    super.dispose();
  }
}