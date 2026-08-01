import 'package:flutter/material.dart';

class TrainerHomeScreen extends StatelessWidget {
  const TrainerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الترحيب
          const Text(
            'أهلاً بك، كابتن أحمد',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0E216C)),
          ),
          const SizedBox(height: 4),
          const Text(
            'إليك ملخص أداءك لهذا الأسبوع.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // 2. كروت الإحصائيات (4 كروت)
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _buildStatCard('الطلاب', '24', Icons.school_rounded),
              _buildStatCard('ساعات التدريب', '6.5', Icons.access_time_rounded),
              _buildStatCard('التقييم', '4.9', Icons.star_rounded, iconColor: Colors.amber),
              _buildStatCard('الأرباح (ج.م)', '8.4k', Icons.payments_rounded), // بالمصري
            ],
          ),
          const SizedBox(height: 24),

          // 3. كارت الجلسة القادمة
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0E216C), // كحلي
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الجلسة القادمة', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        SizedBox(height: 4),
                        Text('محمود حسن', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), // اسم مصري
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white70, size: 14),
                            SizedBox(width: 4),
                            Text('مدينة نصر، القاهرة', style: TextStyle(color: Colors.white70, fontSize: 12)), // منطقة مصرية
                          ],
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(                  'https://images.unsplash.com/photo-1590086782957-93c06ef21604?q=80&w=200&auto=format&fit=crop',
),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('اليوم، 04:30 م', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFE8511), // برتقالي
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.directions_car_rounded, size: 18),
                      label: const Text('بدء الرحلة', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 4. الأداء الأسبوعي (مكان الرسم البياني)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('الأداء الأسبوعي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0E216C))),
              DropdownButton<String>(
                value: 'آخر 7 أيام',
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                underline: const SizedBox(),
                items: <String>['آخر 7 أيام', 'هذا الشهر'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          // شكل وهمي للرسم البياني
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: const Center(child: Text('الرسم البياني هنا', style: TextStyle(color: Colors.grey))),
          ),
          const SizedBox(height: 24),

          // 5. النشاط الأخير
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('النشاط الأخير', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0E216C))),
              TextButton(
                onPressed: () {},
                child: const Text('عرض الكل', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ),
            ],
          ),
          _buildActivityItem('إيداع أرباح', 'من جلسة سارة أحمد', '+ 250 ج.م', 'أمس', Icons.account_balance_wallet, Colors.orange.shade100, Colors.orange),
          _buildActivityItem('حجز جديد', 'كريم مصطفى', '18:00', 'الاثنين', Icons.calendar_month, Colors.blue.shade100, Colors.blue),
        ],
      ),
    );
  }

  // ويدجت لبناء كارت الإحصائيات
  Widget _buildStatCard(String title, String value, IconData icon, {Color iconColor = const Color(0xFF0E216C)}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const Spacer(),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0E216C))),
        ],
      ),
    );
  }

  // ويدجت لبناء النشاط الأخير
  Widget _buildActivityItem(String title, String subtitle, String trailing1, String trailing2, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(trailing1, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0E216C))),
              Text(trailing2, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}