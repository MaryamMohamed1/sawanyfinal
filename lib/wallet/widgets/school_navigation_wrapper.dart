import 'package:flutter/material.dart';
import 'package:sawany/partners/partners_screen.dart';
import 'package:sawany/session_attendance/session_start_screen.dart';
import 'package:sawany/wallet/incident_reports/screens/incident_reports_screen.dart';
import 'school_bottom_nav_bar.dart'; // تأكدي من مسار الفايل بتاع البوتوم بار اللي عدلناه
import '../trainer_management/screens/trainer_management_screen.dart';
import '../earnings_wallet/screens/earnings_wallet_screen.dart';

class SchoolNavigationWrapper extends StatefulWidget {
  final int initialIndex;
  const SchoolNavigationWrapper({super.key, this.initialIndex = 0});

  @override
  State<SchoolNavigationWrapper> createState() => _SchoolNavigationWrapperState();
}

class _SchoolNavigationWrapperState extends State<SchoolNavigationWrapper> {
  late int _currentIndex; 

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    
    // ترتيب الشاشات هنا مطابق تماماً لترتيب الأيقونات في الـ BottomNavigationBar
    _screens = [
      const TrainerManagementScreen(), // 0. المدربون
      const EarningsWalletScreen(),    // 1. المحفظة
      const SessionStartScreen(),      // 2. بدء الجلسة
      const IncidentReportsScreen(), 
      const PartnersScreen(),//
          ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: SchoolBottomNavBar(
          currentIndex: _currentIndex,
          onItemTapped: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}