import 'package:flutter/material.dart';
// استيراد شاشة التنقل الرئيسية (تأكد من مسار الاستيراد الصحيح حسب مشروعك)
import '../main_navigation_wrapper.dart'; 

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool showOtp = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  // ثوابت الألوان حسب دليل منصة "سوقني"
  static const Color primaryColor = Color(0xff0E216C); // كحلي غامق (60%)
  static const Color accentColor = Color(0xffFE8511);  // برتقالي جذاب للتفاعل (10%)
  static const Color neutralWhite = Color(0xffFFFFFF); // أبيض للخلفيات والكروت (30%)
  static const Color neutralGrey = Color(0xff838C91);  // رمادي للنصوص الثانوية والحدود
  static const Color neutralBlack = Color(0xff000000); // أسود للعناوين والنصوص الرئيسية
  static const Color backgroundColor = Color(0xffF5F7FA); // خلفية عامة للواجهة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.directions_car_filled,
                size: 80,
                color: primaryColor,
              ),

              const SizedBox(height: 15),

              const Text(
                "سَوِّقْنِي",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: neutralBlack,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "تعلم القيادة بسهولة",
                style: TextStyle(color: neutralGrey),
              ),

              const SizedBox(height: 35),

              // تبديل بين تسجيل الدخول وإنشاء حساب
              Container(
                decoration: BoxDecoration(
                  color: neutralWhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: neutralGrey.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                            showOtp = false;
                            otpController.clear();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: isLogin ? primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                color: isLogin ? neutralWhite : neutralBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                            showOtp = false;
                            otpController.clear();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: !isLogin ? primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "إنشاء حساب",
                              style: TextStyle(
                                color: !isLogin ? neutralWhite : neutralBlack,
                                fontWeight: FontWeight.bold,
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

              if (!showOtp) ...[
                if (!isLogin)
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "الاسم بالكامل",
                      labelStyle: const TextStyle(color: neutralGrey),
                      prefixIcon: const Icon(Icons.person, color: neutralGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: neutralGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: neutralGrey.withOpacity(0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: primaryColor, width: 2),
                      ),
                    ),
                  ),

                if (!isLogin) const SizedBox(height: 15),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "رقم الهاتف",
                    labelStyle: const TextStyle(color: neutralGrey),
                    prefixIcon: const Icon(Icons.phone, color: neutralGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: neutralGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: neutralGrey.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                if (!isLogin)
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "البريد الإلكتروني",
                      labelStyle: const TextStyle(color: neutralGrey),
                      prefixIcon: const Icon(Icons.email, color: neutralGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: neutralGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: neutralGrey.withOpacity(0.5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: primaryColor, width: 2),
                      ),
                    ),
                  ),

                if (!isLogin) const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "كلمة المرور",
                    labelStyle: const TextStyle(color: neutralGrey),
                    prefixIcon: const Icon(Icons.lock, color: neutralGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: neutralGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: neutralGrey.withOpacity(0.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                ),
              ] else ...[
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "أدخل رمز التحقق",
                    labelStyle: const TextStyle(color: neutralGrey),
                    prefixIcon: const Icon(Icons.verified, color: neutralGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: primaryColor, width: 2),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 25),

              // زر الإجراء الرئيسي
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isLogin) {
                        // في حالة تسجيل الدخول: الدخول مباشرة دون OTP
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainNavigationWrapper(),
                          ),
                        );
                      } else {
                        // في حالة إنشاء حساب:
                        if (!showOtp) {
                          // إظهار حقل الرمز أولاً
                          showOtp = true;
                        } else {
                          // التحقق من صحة الرمز (مثال افتراضي 1234)
                          if (otpController.text == "1234") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainNavigationWrapper(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("رمز التحقق غير صحيح، يرجى المحاولة مرة أخرى"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    showOtp
                        ? "تأكيد رمز التحقق"
                        : isLogin
                            ? "تسجيل الدخول"
                            : "إنشاء حساب",
                    style: const TextStyle(
                      fontSize: 18,
                      color: neutralWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(child: Divider(color: neutralGrey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("أو", style: TextStyle(color: neutralGrey)),
                  ),
                  Expanded(child: Divider(color: neutralGrey)),
                ],
              ),

              const SizedBox(height: 20),

              // زر تسجيل الدخول بجوجل
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationWrapper(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.g_mobiledata, size: 35, color: primaryColor),
                  label: const Text(
                    "المتابعة باستخدام جوجل",
                    style: TextStyle(fontSize: 16, color: neutralBlack),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: neutralGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  setState(() {
                    if (showOtp) {
                      showOtp = false;
                      otpController.clear();
                    } else {
                      isLogin = !isLogin;
                    }
                  });
                },
                child: Text(
                  showOtp
                      ? "رجوع"
                      : isLogin
                          ? "ليس لديك حساب؟ إنشاء حساب"
                          : "لديك حساب بالفعل؟ تسجيل الدخول",
                  style: const TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }
}