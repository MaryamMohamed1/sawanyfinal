import 'package:flutter/material.dart';

// استيراد الشاشات الخاصة بالمدرب
import 'trainer_home_screen.dart';
import 'trainer_bookings_screen.dart';
import 'trainer_students_screen.dart';
import 'trainer_finance_screen.dart';
import 'trainer_reviews_screen.dart';
import 'trainer_profile_screen.dart'; // شاشة البروفايل

class TrainerMainWrapper extends StatefulWidget {
  const TrainerMainWrapper({super.key});

  @override
  State<TrainerMainWrapper> createState() => _TrainerMainWrapperState();
}

class _TrainerMainWrapperState extends State<TrainerMainWrapper> {
  int _currentIndex = 0; // بيبدأ بالشاشة الرئيسية

  // عناوين الـ AppBar بتتغير حسب الشاشة اللي واقفين عليها
  final List<String> _appBarTitles = [
    'بوابة المدرب',
    'طلبات الحجز',
    'متابعة المتدربين',
    'المالية والسحب',
    'الشكاوي والتقييمات',
  ];

  // الشاشات الـ 5
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const TrainerHomeScreen(),        // 0
      const TrainerBookingsScreen(),    // 1
      const TrainerStudentsScreen(),    // 2
      const TrainerFinanceScreen(),     // 3
      const TrainerReviewsScreen(),     // 4
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // التطبيق عربي
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA), // لون خلفية فاتح مريح
        
        // === الـ AppBar الثابت ===
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E216C), // اللون الكحلي المطلوب
          elevation: 0,
          centerTitle: true,
          title: Text(
            _appBarTitles[_currentIndex], // العنوان بيتغير ديناميكياً
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          
          // التعديل هنا 👇: البروفايل بقى على اليمين (leading)
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TrainerProfileScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0), // padding خفيف عشان الصورة متكونش لازقة في الحرف
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), 
              ),
            ),
          ),
          
          // التعديل هنا 👇: الإشعارات بقت على الشمال (actions)
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
              onPressed: () {
                // أكشن الإشعارات
              },
            ),
            const SizedBox(width: 8), // مسافة صغيرة عشان الأيقونة متلزقش في الشاشة من الشمال
          ],
        ),
        
        // === الشاشات (محتوى متغيّر) ===
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),

        // === الـ Bottom Navigation Bar الثابت ===
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed, // مهم عشان يظهروا كلهم
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0E216C), // اللون الكحلي عند الاختيار
          unselectedItemColor: Colors.grey.shade400, // لون رمادي لغير المختار
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'الحجوزات'),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: 'المتدربين'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_rounded), label: 'المالية'),
            BottomNavigationBarItem(icon: Icon(Icons.rate_review_rounded), label: 'التقييمات'),
          ],
        ),
      ),
    );
  }
}