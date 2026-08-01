import 'package:flutter/material.dart';

class TrainerBookingsScreen extends StatelessWidget {
  const TrainerBookingsScreen({super.key});

  // الألوان الأساسية عشان نوحد التصميم
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  @override
  Widget build(BuildContext context) {
    // استخدمنا DefaultTabController عشان يدير التابات بسهولة من غير State معقدة
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          // شريط التابات (Tabs)
          Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: primaryNavy,
              unselectedLabelColor: Colors.grey,
              indicatorColor: accentOrange,
              indicatorWeight: 3,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              tabs: [
                Tab(text: 'طلبات جديدة'),
                Tab(text: 'جلسات مؤكدة'),
                Tab(text: 'سجل الحجوزات'),
              ],
            ),
          ),
          
          // محتوى التابات
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildNewRequestsTab(),
                _buildConfirmedTab(),
                _buildHistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 1. تابة الطلبات الجديدة (قيد الانتظار)
  // ==========================================
  Widget _buildNewRequestsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildBookingCard(
          studentName: 'أحمد محمد',
          image: 'https://images.unsplash.com/photo-1590086782957-93c06ef21604?q=80&w=200&auto=format&fit=crop',

          date: '24 يوليو 2026',
          time: '10:00 صباحاً',
          carType: 'أوتوماتيك',
          package: 'باقة 10 حصص مانيوال',
          location: 'مضمار مدينة نصر',
          isNewRequest: true,
        ),
        const SizedBox(height: 16),
        _buildBookingCard(
          studentName: 'سارة خالد',
          image: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=200',
          date: '25 يوليو 2026',
          time: '01:30 مساءً',
          carType: 'أوتوماتيك',
          package: 'باقة التقييم المبدئي',
          location: 'شوارع المعادي',
          isNewRequest: true,
        ),
      ],
    );
  }

  // ==========================================
  // 2. تابة الجلسات المؤكدة (القادمة)
  // ==========================================
  Widget _buildConfirmedTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildBookingCard(
          studentName: 'عمر فاروق',
          image: 'https://images.unsplash.com/photo-1590086782957-93c06ef21604?q=80&w=200&auto=format&fit=crop',
          date: '26 يوليو 2026',
          time: '09:00 صباحاً',
          carType: 'أوتوماتيك',
          package: 'الباقة الشاملة للمبتدئين',
          location: 'التجمع الخامس',
          isNewRequest: false,
          statusText: 'مؤكد',
        ),
      ],
    );
  }

  // ==========================================
  // 3. تابة سجل الحجوزات (السابقة)
  // ==========================================
  Widget _buildHistoryTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildBookingCard(
          studentName: 'ياسر علي',
          image: 'https://images.unsplash.com/photo-1590086782957-93c06ef21604?q=80&w=200&auto=format&fit=crop',
          date: '20 يوليو 2026',
          time: '04:00 مساءً',
          carType: 'مانيوال',
          package: 'باقة مكثفة',
          location: 'الدقي',
          isNewRequest: false,
          statusText: 'مكتمل',
          statusColor: Colors.green,
        ),
      ],
    );
  }

  // ==========================================
  // تصميم الكارت الموحد للطلبات
  // ==========================================
  Widget _buildBookingCard({
    required String studentName,
    required String image,
    required String date,
    required String time,
    required String carType,
    required String package,
    required String location,
    required bool isNewRequest,
    String? statusText,
    Color? statusColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // الجزء العلوي: صورة المتدرب والاسم والوقت
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(image),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentName,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.directions_car_rounded, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(carType, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(width: 12),
                          const Icon(Icons.bookmark_rounded, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(package, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                // لو مش طلب جديد، نعرض حالة الطلب (مؤكد/مكتمل)
                if (!isNewRequest && statusText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: (statusColor ?? accentOrange).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: statusColor ?? accentOrange,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          
          // الجزء الأوسط: تفاصيل الميعاد والمكان
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn(Icons.calendar_month_rounded, 'التاريخ', date),
                _buildInfoColumn(Icons.access_time_rounded, 'الوقت', time),
                _buildInfoColumn(Icons.location_on_rounded, 'المكان', location),
              ],
            ),
          ),

          // الجزء السفلي: الأزرار (تظهر بس لو طلب جديد)
          if (isNewRequest)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red.shade200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text('رفض', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryNavy,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text('قبول الحجز', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ويدجت صغيرة لعرض الأيقونة وتحتها العنوان والتفاصيل
  Widget _buildInfoColumn(IconData icon, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: accentOrange),
            const SizedBox(width: 4),
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryNavy)),
      ],
    );
  }
}