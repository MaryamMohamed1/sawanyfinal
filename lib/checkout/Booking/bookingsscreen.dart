import 'package:flutter/material.dart';

// استيراد الـ Widgets الخاصة بصفحة الحجوزات
import 'bookings_widgets/bookingappbar.dart';
import 'bookings_widgets/bookingstats.dart';
import 'bookings_widgets/upcomingbookingcard.dart';
import 'bookings_widgets/completedlessons.dart';
import 'bookings_widgets/cancelledlessons.dart';


class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  // تحديد الأيقونة النشطة (مثلاً Index 1 لو الحجوزات هي الشاشة الثانية)
  final int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF), // الأبيض الصافي كخلفية رئيسية عامة للشاشة
        appBar: const BookingsAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. قسم الإحصائيات (إجمالي الحجوزات، المكتملة، والقادمة)
              const BookingsStatsSection(),
              const SizedBox(height: 20),

              // 2. عنوان: الحجوزات القادمة
              const Text(
                'الحجوزات القادمة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              const SizedBox(height: 12),

              // كروت الحجوزات القادمة
              UpcomingBookingCard(
                trainerName: 'كابتن / أحمد منصوري',
                schoolName: 'مدرسة الأمل للقيادة',
                date: '15 أكتوبر 2023',
                time: '10:00 ص - 11:30 ص',
                location: 'الفرع الرئيسي - المعادي',
                onReschedule: () {},
                onDelete: () {},
              ),
              UpcomingBookingCard(
                trainerName: 'كابتن / سارة محمود',
                schoolName: 'مدرسة النور للقيادة',
                date: '18 أكتوبر 2023',
                time: '02:00 م - 03:30 م',
                location: 'فرع مدينة نصر',
                onReschedule: () {},
                onDelete: () {},
              ),
              const SizedBox(height: 16),

              // 3. عنوان: الحصص المكتملة
              const Text(
                'الحصص المكتملة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              const SizedBox(height: 12),

              // كروت الحصص المكتملة
              const CompletedLessonCard(
                title: 'حصة القيادة الليلية والسهل',
                date: '10 أكتوبر 2023',
                duration: 'ساعة ونصف',
              ),
              const CompletedLessonCard(
                title: 'أساسيات ركن السيارة والرجوع للخلف',
                date: '05 أكتوبر 2023',
                duration: 'ساعة ونصف',
              ),
              const SizedBox(height: 16),

              // 4. عنوان: الحصص الملغاة
              const Text(
                'الحصص الملغاة',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              const SizedBox(height: 12),

              // كروت الحصص الملغاة
              const CancelledLessonCard(
                title: 'حصة التدريب على السريع',
                date: '01 أكتوبر 2023',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}