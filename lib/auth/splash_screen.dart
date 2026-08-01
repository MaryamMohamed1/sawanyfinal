import 'package:flutter/material.dart';

// ⚠️ لو الشاشة دي في ملف منفصل عن الـ Onboarding، اتأكدي إن اسم الملف ده صح عندك
import 'onboarding_screens.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            // ⚠️ اتأكدي إن OnboardingScreen هو نفس اسم الكلاس اللي في ملف الأونبوردنج
            builder: (context) => const OnboardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              "assets/back.jpeg",
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),

          // 2. المحتوى الأمامي 
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- اللوجو ---
                  Image.asset(
                    'assets/logosawaqny.png',
                    width: 320, 
                    fit: BoxFit.contain,
                  ),
                  
                  const SizedBox(height: 50), 

                  // --- كلمة جاري التحميل ---
                  const Text(
                    "جاري التحميل...",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E216C), 
                    ),
                  ),
                  
                  const SizedBox(height: 15),

                  // --- شريط التحميل ---
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const LinearProgressIndicator(
                      minHeight: 8,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF0E216C), 
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 80), 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}