import 'package:flutter/material.dart';
import 'package:sawany/auth/SchoolDocumentsUploadScreen.dart';
import 'package:sawany/wallet/widgets/school_navigation_wrapper.dart';
import 'review_status_screen.dart';

class SchoolAuthScreen extends StatefulWidget {
  const SchoolAuthScreen({super.key});

  @override
  State<SchoolAuthScreen> createState() => _SchoolAuthScreenState();
}

class _SchoolAuthScreenState extends State<SchoolAuthScreen> {
  bool isLogin = true;
  bool showOtp = false;

  final schoolNameController = TextEditingController();
  final licenseNumberController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  // ثوابت الألوان حسب دليل منصة "سوقني"
  static const Color primaryColor = Color(0xff0E216C); // كحلي غامق (60%)
  static const Color accentColor = Color(0xffFE8511); // برتقالي جذاب للتفاعل (10%)
  static const Color neutralWhite = Color(0xffFFFFFF); // أبيض للخلفيات والكروت (30%)
  static const Color neutralGrey = Color(0xff838C91); // رمادي للنصوص الثانوية والحدود
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
              const SizedBox(height: 20),

              // أيقونة مدرسة التدريب
              const Icon(
                Icons.apartment_rounded,
                size: 80,
                color: primaryColor,
              ),

              const SizedBox(height: 15),

              const Text(
                "بوابة مدارس التدريب",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: neutralBlack,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "منصة سوقني لشركاء النجاح",
                style: TextStyle(color: neutralGrey, fontSize: 14),
              ),

              const SizedBox(height: 35),

              // تبديل بين تسجيل الدخول وإنشاء حساب مدرسة
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
                              "تسجيل مدرسة جديدة",
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

              // حقول الإدخال
              if (!showOtp) ...[
                if (!isLogin) ...[
                  TextField(
                    controller: schoolNameController,
                    decoration: InputDecoration(
                      labelText: "اسم مدرسة التدريب بالكامل",
                      labelStyle: const TextStyle(color: neutralGrey),
                      prefixIcon: const Icon(Icons.business_rounded, color: neutralGrey),
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
                  TextField(
                    controller: licenseNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "رقم الترخيص / السجل التجاري",
                      labelStyle: const TextStyle(color: neutralGrey),
                      prefixIcon: const Icon(Icons.badge_rounded, color: neutralGrey),
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
                ],

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "رقم هاتف التواصل",
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

                if (!isLogin) ...[
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "البريد الإلكتروني الرسمي للمدرسة",
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
                  const SizedBox(height: 15),
                ],

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
                    labelText: "أدخل رمز التحقق للمدرسة",
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SchoolMainNavigationWrapper(),
                          ),
                        );
                      } else {
                        if (!showOtp) {
                          showOtp = true;
                        } else {
                          if (otpController.text == "1234") {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SchoolDocumentsUploadScreen(),
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
                            ? "تسجيل دخول المدرسة"
                            : "تسجيل المدرسة",
                    style: const TextStyle(
                      fontSize: 18,
                      color: neutralWhite,
                      fontWeight: FontWeight.bold,
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
                          ? "تريد تسجيل مدرسة جديدة؟ اضغط هنا"
                          : "لديك حساب مدرسة بالفعل؟ تسجيل الدخول",
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
    schoolNameController.dispose();
    licenseNumberController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }
}

// ⚠️ شاشة مؤقتة لتفادي الخطأ، قم بحذفها عند استيراد الشاشة الحقيقية
class SchoolMainNavigationWrapper extends StatelessWidget {
  const SchoolMainNavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const SchoolNavigationWrapper();
  }
}