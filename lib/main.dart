import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// استدعاء شاشة البداية من فولدر auth
import 'auth/splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

// تعريف سلوك التمرير ليدعم اللمس والماوس والـ Trackpad
class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // بيشيل علامة الـ Debug الحمرا
      title: 'sawany',
      scrollBehavior: MyScrollBehavior(), // تفعيل التمرير المخصص هنا
      theme: ThemeData(
        primaryColor: const Color(0xFF0047BA),
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),
      // بيخلي اتجاه التطبيق كله عربي من اليمين للشمال
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      // أول شاشة تفتح هي شاشة الـ Splash
      home: const SplashScreen(),    
    );
  }
}