import 'package:flutter/material.dart';
import 'package:sawany/change_instructor/change_instructor_screen.dart';
import 'package:sawany/profile/trainer/trainerscreen.dart'; // استيراد شاشة المدرب الصحيحة

class UpcomingBookingCard extends StatelessWidget {
  final String trainerName;
  final String schoolName;
  final String date;
  final String time;
  final String? location;
  final VoidCallback? onReschedule;
  final VoidCallback? onDelete;

  const UpcomingBookingCard({
    super.key,
    required this.trainerName,
    required this.schoolName,
    required this.date,
    required this.time,
    this.location,
    this.onReschedule,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), 
      ),
      child: Column(
        children: [
          // 1. أعلى الكارت: صورة والاسم (يمين) + badge مؤكد (شمال)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 48,
                      height: 48,
                      color: const Color(0xFF838C91).withOpacity(0.1),
                      child: const Icon(Icons.person, color: Color(0xFF838C91), size: 28),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainerName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000), 
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        schoolName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF838C91), 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFE8511).withOpacity(0.15), 
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'مؤكد',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFE8511), 
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 2. شريط التاريخ والوقت
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF), 
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF838C91).withOpacity(0.15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14, color: Color(0xFF838C91)),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF838C91)), 
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded, size: 14, color: Color(0xFF838C91)),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF838C91)), 
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. الموقع
          if (location != null) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF838C91).withOpacity(0.15)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 15, color: Color(0xFF838C91)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      location!,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF838C91)),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),

          // 4. أزرار الأكشن
          Row(
            children: [
              // زر عرض التفاصيل (ينقل لبروفايل المدرب TrainerScreen)
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainerScreen(), // التربيطة اتصلحت هنا
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0E216C), 
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'عرض التفاصيل',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // زر إعادة الجدولة
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeInstructorScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF838C91)), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'إعادة الجدولة',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E216C), 
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),

              // زر سلة المهملات
              IconButton(
                onPressed: onDelete ?? () {},
                icon: const Icon(Icons.delete_outline_rounded, color: Color(0xFFEF4444), size: 22),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}