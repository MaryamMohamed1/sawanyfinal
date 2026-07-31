import 'package:flutter/material.dart';

class SessionDetailsSection extends StatelessWidget {
  const SessionDetailsSection({super.key});

  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تفاصيل الجلسة',
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: primaryNavy,
            ),
          ),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          
          // بيانات الكابتن
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // صورة المدرب
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أحمد محمود',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: accentOrange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '4.8 (120 تقييم)',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // التاريخ والوقت
          _buildDetailRow(
            icon: Icons.calendar_today_outlined,
            title: 'التاريخ والوقت',
            subtitle: 'الخميس، 25 مايو • 10:00 ص - 12:00 م',
          ),
          const SizedBox(height: 16),

          // المركبة ونوع الحصة
          _buildDetailRow(
            icon: Icons.directions_car_outlined,
            title: 'المركبة ونوع الحصة',
            subtitle: 'تدريب عملي (ساعتان) • تويوتا كورولا (أوتوماتيك)',
          ),
          const SizedBox(height: 16),

          // نقطة الالتقاء
          _buildDetailRow(
            icon: Icons.location_on_outlined,
            title: 'نقطة الالتقاء',
            subtitle: 'مدينة 6 أكتوبر، الجيزة',
          ),
        ],
      ),
    );
  }

  // ويدجت الصفوف الفرعية
  Widget _buildDetailRow({required IconData icon, required String title, required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: accentOrange, size: 20), // أيقونة برتقالية متناسقة مع التفاعل
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}