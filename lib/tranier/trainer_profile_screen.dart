import 'package:flutter/material.dart';
import 'package:sawany/auth/identity_selection_screen.dart';

class TrainerProfileScreen extends StatelessWidget {
  const TrainerProfileScreen({super.key});

  // الألوان الأساسية
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color lightBg = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg,
        appBar: AppBar(
          backgroundColor: primaryNavy,
          elevation: 0,
          centerTitle: true,
          title: const Text('الملف الشخصي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. صورة البروفايل والاسم
              _buildProfileHeader(),
              const SizedBox(height: 24),

              // 2. المعلومات الشخصية
              _buildPersonalInfoCard(),
              const SizedBox(height: 16),

              // 3. ساعات العمل
              _buildWorkHoursCard(),
              const SizedBox(height: 16),

              // 4. تفاصيل المركبة
              _buildVehicleDetailsCard(),
              const SizedBox(height: 16),

              // 5. الشهادات والاعتمادات
              _buildCertificationsCard(),
              const SizedBox(height: 32),

              // 6. زر تسجيل الخروج
              TextButton.icon(
              onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const IdentitySelectionScreen(),
    ),
  );
},
                icon: const Icon(Icons.logout_rounded, color: Colors.red),
                label: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // 1. الهيدر (الصورة والاسم والزرار)
  // ==========================================
  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.verified_rounded, color: accentOrange, size: 22),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text('كابتن أحمد محمد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryNavy)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFFFFF7ED), borderRadius: BorderRadius.circular(20)),
          child: const Text('مدرب معتمد', style: TextStyle(color: accentOrange, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 200,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryNavy,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            icon: const Icon(Icons.edit_rounded, size: 16),
            label: const Text('تعديل الملف الشخصي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
        ),
      ],
    );
  }

  // ==========================================
  // 2. المعلومات الشخصية
  // ==========================================
  Widget _buildPersonalInfoCard() {
    return _buildCardWrapper(
      title: 'المعلومات الشخصية',
      icon: Icons.person_outline_rounded,
      child: Column(
        children: [
          _buildInfoRow('رقم الهاتف', '+20 10 1234 5678'),
          const Divider(height: 24, color: Color(0xFFF0F0F0)),
          _buildInfoRow('البريد الإلكتروني', 'ahmed@sooqny.com'),
          const Divider(height: 24, color: Color(0xFFF0F0F0)),
          _buildInfoRow('المدينة', 'القاهرة، مدينة نصر'),
        ],
      ),
    );
  }

  // ==========================================
  // 3. ساعات العمل
  // ==========================================
  Widget _buildWorkHoursCard() {
    return _buildCardWrapper(
      title: 'ساعات العمل',
      icon: Icons.access_time_rounded,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('الأحد - الخميس', style: TextStyle(color: Colors.grey, fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: primaryNavy.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
                child: const Text('08:00 ص - 04:00 م', style: TextStyle(fontWeight: FontWeight.bold, color: primaryNavy, fontSize: 12)),
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF0F0F0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('الجمعة - السبت', style: TextStyle(color: Colors.grey, fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFFFFF7ED), borderRadius: BorderRadius.circular(8)),
                child: const Text('مغلق', style: TextStyle(fontWeight: FontWeight.bold, color: accentOrange, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 4. تفاصيل المركبة
  // ==========================================
  Widget _buildVehicleDetailsCard() {
    return _buildCardWrapper(
      title: 'تفاصيل المركبة',
      icon: Icons.directions_car_outlined,
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
        child: const Text('تويوتا كورولا 2026', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://images.unsplash.com/photo-1550355291-bbee04a92027?auto=format&fit=crop&q=80&w=800', // صورة عربية
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow('رقم اللوحة', 'أ ب ج  1234'),
          const Divider(height: 24, color: Color(0xFFF0F0F0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('حالة التأمين', style: TextStyle(color: Colors.grey, fontSize: 13)),
              Row(
                children: const [
                  Text('ساري المفعول', style: TextStyle(fontWeight: FontWeight.bold, color: accentOrange, fontSize: 13)),
                  SizedBox(width: 4),
                  Icon(Icons.verified_rounded, color: accentOrange, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 5. الشهادات والاعتمادات
  // ==========================================
  Widget _buildCertificationsCard() {
    return _buildCardWrapper(
      title: 'الشهادات والاعتمادات',
      icon: Icons.badge_outlined,
      child: Column(
        children: [
          _buildCertItem('رخصة تدريب معتمدة', 'الإدارة العامة للمرور - 2026', Icons.shield_outlined),
          const SizedBox(height: 12),
          _buildCertItem('شهادة السلامة المرورية', 'المعهد المروري المصري - 2025', Icons.workspace_premium_outlined),
        ],
      ),
    );
  }

  Widget _buildCertItem(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: accentOrange, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: primaryNavy)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // ويدجتس مساعدة للتصميم
  // ==========================================
  Widget _buildCardWrapper({required String title, required IconData icon, required Widget child, Widget? trailing}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: primaryNavy, size: 20),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: primaryNavy)),
              if (trailing != null) const Spacer(),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: primaryNavy, fontSize: 13)),
      ],
    );
  }
}