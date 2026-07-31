import 'package:flutter/material.dart';

class SchoolBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const SchoolBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final int safeIndex = (currentIndex >= 0 && currentIndex <= 4) ? currentIndex : 0;

    return BottomNavigationBar(
      currentIndex: safeIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF0E216C),
      unselectedItemColor: const Color(0xFF838C91),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      unselectedLabelStyle: const TextStyle(fontSize: 11),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          activeIcon: Icon(Icons.groups),
          label: 'المدربون',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          activeIcon: Icon(Icons.account_balance_wallet),
          label: 'المحفظة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_rounded),
          activeIcon: Icon(Icons.play_circle_rounded),
          label: 'بدء الجلسة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_crash_outlined),
          activeIcon: Icon(Icons.car_crash),
          label: 'الحوادث',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.handshake_outlined),
          activeIcon: Icon(Icons.handshake),
          label: 'شركاؤنا',
        ),
      ],
    );
  }
}