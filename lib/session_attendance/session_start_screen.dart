import 'package:flutter/material.dart';
import 'attendance_screen.dart';

class SessionStartScreen extends StatelessWidget {
  const SessionStartScreen({super.key});

  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color neutralWhite = Color(0xFFFFFFFF);
  static const Color neutralGray = Color(0xFF838C91);
  static const Color textBlack = Color(0xFF000000);
  static const Color backgroundLight = Color(0xFFF8F9FB);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundLight,
      child: Column(
        children: [
          AppBar(
            backgroundColor: primaryNavy,
            iconTheme:  const IconThemeData(
    color: Colors.white,
  ),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'تسجيل الدخول للجلسة',
              style: TextStyle(color: neutralWhite, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'جلسة تدريب عملي - الطالب: أحمد محمد',
                    style: TextStyle(fontSize: 16, color: neutralWhite, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: neutralWhite,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: neutralGray.withOpacity(0.3), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: primaryNavy.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Text('متطابق', style: TextStyle(color: primaryNavy, fontWeight: FontWeight.bold)),
                                      SizedBox(width: 4),
                                      Icon(Icons.check_circle, color: primaryNavy, size: 16),
                                    ],
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Text('التحقق من الموقع',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textBlack)),
                                    SizedBox(width: 8),
                                    Icon(Icons.location_on_outlined, color: primaryNavy),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'تم التحقق من موقعك الحالي وتطابقه مع موقع بدء الجلسة المجدول.',
                              textAlign: TextAlign.right,
                              style: TextStyle(color: neutralGray, fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              color: backgroundLight,
                              child: const Center(
                                child: Icon(Icons.map, size: 50, color: neutralGray),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AttendanceScreen()),
                      );
                    },
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accentOrange,
                        boxShadow: [
                          BoxShadow(color: accentOrange.withOpacity(0.35), spreadRadius: 8, blurRadius: 18),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_circle_fill, color: neutralWhite, size: 60),
                          SizedBox(height: 8),
                          Text('بدء الجلسة',
                              style: TextStyle(color: neutralWhite, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('يرجى التأكد من استعداد الطالب قبل بدء المؤقت.',
                      style: TextStyle(color: neutralGray, fontSize: 13)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
