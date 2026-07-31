import 'package:flutter/material.dart';
import 'package:sawany/profile/settings_screen.dart';
import 'package:sawany/driving/driving_license_guide_screen.dart';
import 'package:sawany/more/theory_exam_screen.dart';
import 'package:sawany/more/knowledge_center_screen.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  // Brand Color Constants
  static const Color primaryBlue = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color customGray = Color(0xFF838C91);
  static const Color backgroundColor = Color(0xFFF6F8FA);
  static const Color cardBorderColor = Color(0xFFE2E8F0);

  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme:  const IconThemeData(
    color: Colors.white,
  ),
          backgroundColor: primaryBlue, 
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
    
          title: const Text(
            'سوقني',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Cairo',
              letterSpacing: -0.5,
            ),
          ),
          actions: [
            // إضافة زرار الترس للإعدادات (يفتح سكرين 17)
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color:Colors.white,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(), // يفتح سكرين 17
                  ),
                );
              },
            ),
            // زرار الإشعارات الحالي
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () {
                    _showSnackBar(context, 'لا توجد إشعارات جديدة حالياً');
                  },
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: accentOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Header Section
              _buildProfileHeader(),
              const SizedBox(height: 24),

              // 2. Quick Actions
              _buildQuickActions(context),
              const SizedBox(height: 24),

              // 3. License Guide & Exam Banners
              _buildLicenseBanners(context),
              const SizedBox(height: 24),

              // 4. License Progress Card
              _buildLicenseProgressCard(),
              const SizedBox(height: 24),

              // 4. Statistics Cards
              _buildStatisticsGrid(),
              const SizedBox(height: 24),

              // 5. Roadmap Section
              _buildRoadmapSection(),
              const SizedBox(height: 24),

              // 6. Upcoming Session Card
              _buildUpcomingSessionCard(context),
              const SizedBox(height: 24),

              // 7. Achievements Section
              _buildAchievementsSection(),
              const SizedBox(height: 24),

              // 8. Recent Payments Section
              _buildRecentPaymentsSection(),
              const SizedBox(height: 24),

              // 9. Documents Section
              _buildDocumentsSection(),
              const SizedBox(height: 24),

              // 10. Settings Section
              _buildSettingsSection(context),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Header: Profile Picture, Name, Verified Badge, Member Since
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accentOrange, width: 2.5),
                ),
                child: const CircleAvatar(
                  radius: 38,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300',
                  ),
                  backgroundColor: backgroundColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: primaryBlue,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'أحمد محمد  ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: primaryBlue.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'موثق',
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: customGray,
                    ),
                    Spacer(),
                    Text(
                      'عضو منذ يناير 2025',
                      style: TextStyle(
                        fontSize: 13,
                        color: customGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quick Actions
  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildQuickActionCard(
            context: context,
            icon: Icons.description_outlined,
            title: 'الوثائق',
            onTap: () => _showSnackBar(context, 'تم فتح قسم الوثائق'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildQuickActionCard(
            context: context,
            icon: Icons.account_balance_wallet_outlined,
            title: 'الدفع',
            onTap: () => _showSnackBar(context, 'تم فتح قسم الدفع'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildQuickActionCard(
            context: context,
            icon: Icons.edit_outlined,
            title: 'تعديل البيانات',
            onTap: () => _showSnackBar(context, 'فتح صفحة تعديل البيانات'),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: cardBorderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accentOrange.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: accentOrange,
                  size: 24,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLicenseBanners(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildBannerCard(
          context: context,
          icon: Icons.menu_book_rounded,
          title: 'قواعد الرخصة',
          subtitle: 'خطوات ومتطلبات الاستخراج',
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => const DrivingLicenseGuideScreen(),
          )),
        )),
        const SizedBox(width: 12),
        Expanded(child: _buildBannerCard(
          context: context,
          icon: Icons.quiz_rounded,
          title: 'امتحان السواقة',
          subtitle: 'محاكاة الامتحان النظري',
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => const KnowledgeCenterScreen(),
          )),
        )),
      ],
    );
  }

  Widget _buildBannerCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: cardBorderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryBlue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: primaryBlue, size: 24),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 11, color: customGray)),
          ],
        ),
      ),
    );
  }

  // License Progress Card
  Widget _buildLicenseProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 84,
            height: 84,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 0.65,
                  strokeWidth: 9,
                  backgroundColor: accentOrange.withOpacity(0.15),
                  color: accentOrange,
                  strokeCap: StrokeCap.round,
                ),
                Center(
                  child: Text(
                    '65%',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: accentOrange,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'التقدم نحو الرخصة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'أنجزت 65% من متطلبات استخراج رخصة القيادة الخاصة بمصر.',
                  style: TextStyle(
                    fontSize: 13,
                    color: customGray,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: accentOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'باقي 3 حصص على اختبار المرور',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: accentOrange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Statistics Grid
  Widget _buildStatisticsGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'ساعات التدريب المكتملة',
            value: '24 ساعة',
            icon: Icons.timer_outlined,
            badgeColor: primaryBlue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'الجلسات القادمة',
            value: '3 حصص',
            icon: Icons.event_available_outlined,
            badgeColor: accentOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: badgeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: badgeColor, size: 20),
              ),
              const Icon(Icons.trending_up, color: Colors.green, size: 18),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: customGray,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
        ],
      ),
    );
  }

  // Roadmap Section
  Widget _buildRoadmapSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'خريطة الطريق',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildRoadmapStep(
                title: 'النظري',
                icon: Icons.check_circle_rounded,
                isCompleted: true,
                isActive: false,
              ),
              Expanded(
                child: Container(
                  height: 4,
                  color: accentOrange,
                ),
              ),
              _buildRoadmapStep(
                title: 'العملي',
                icon: Icons.directions_car_filled,
                isCompleted: false,
                isActive: true,
              ),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: accentOrange.withOpacity(0.3),
                  ),
                ),
              ),
              _buildRoadmapStep(
                title: 'اختبار المرور',
                icon: Icons.flag_rounded,
                isCompleted: false,
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoadmapStep({
    required String title,
    required IconData icon,
    required bool isCompleted,
    required bool isActive,
  }) {
    Color nodeColor;
    Color iconColor;

    if (isCompleted) {
      nodeColor = primaryBlue;
      iconColor = Colors.white;
    } else if (isActive) {
      nodeColor = accentOrange;
      iconColor = Colors.white;
    } else {
      nodeColor = customGray.withOpacity(0.2);
      iconColor = customGray;
    }

    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: nodeColor,
            shape: BoxShape.circle,
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: accentOrange.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isActive || isCompleted ? FontWeight.bold : FontWeight.normal,
            color: isActive ? accentOrange : (isCompleted ? primaryBlue : customGray),
          ),
        ),
      ],
    );
  }

  // Upcoming Session Card
  Widget _buildUpcomingSessionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryBlue, Color(0xFF1B3696)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_car_rounded,
                      color: accentOrange,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'التدريب الميداني',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: accentOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'غدًا',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.access_time, color: Colors.white70, size: 18),
              Spacer(),
              Text('10:00 صباحًا', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              Spacer(),
              Icon(Icons.timelapse, color: Colors.white70, size: 18),
              Spacer(),
              Text('المدة: ساعتان', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.person_outline, color: Colors.white70, size: 18),
              Spacer(),
              Text('المدرب: الكابتن أحمد محمود', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.time_to_leave, color: Colors.white70, size: 18),
              Spacer(),
              Text('السيارة: هيونداي إلنترا 2024', style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.white70, size: 18),
              Spacer(),
              Text('مدينة نصر - القاهرة', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: primaryBlue,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () => _showSessionDetailsModal(context),
              child: const Text('عرض التفاصيل', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
            ),
          ),
        ],
      ),
    );
  }

  // Achievements Section
  Widget _buildAchievementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإنجازات',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryBlue),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _buildAchievementChip('🛡️ سائق آمن'),
              const SizedBox(width: 10),
              _buildAchievementChip('⏱️ أول 10 ساعات'),
              const SizedBox(width: 10),
              _buildAchievementChip('🎯 ملتزم بالمواعيد'),
              const SizedBox(width: 10),
              _buildAchievementChip('⭐ اجتاز التدريب النظري'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementChip(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cardBorderColor),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: primaryBlue),
      ),
    );
  }

  // Recent Payments Section
  Widget _buildRecentPaymentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'سجل المدفوعات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryBlue),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('عرض الكل', style: TextStyle(color: accentOrange, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildPaymentCard(packageName: 'الباقة الأساسية للقيادة', date: '15 يوليو 2026', amount: '4,500 ج.م', status: 'مكتمل'),
        const SizedBox(height: 10),
        _buildPaymentCard(packageName: 'رسوم حجز حلبة المرور', date: '02 يوليو 2026', amount: '850 ج.م', status: 'مكتمل'),
      ],
    );
  }

  Widget _buildPaymentCard({
    required String packageName,
    required String date,
    required String amount,
    required String status,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: cardBorderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: primaryBlue.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.receipt_long, color: primaryBlue, size: 22),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(packageName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(fontSize: 12, color: customGray)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: primaryBlue)),
              const SizedBox(height: 4),
              Text(status, style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  // Documents Section
  Widget _buildDocumentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الوثائق والمستندات',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryBlue),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: cardBorderColor)),
          child: Column(
            children: [
              _buildDocumentRow('بطاقة الرقم القومي', 'مقبول', Icons.check_circle, Colors.green),
              const Divider(height: 20),
              _buildDocumentRow('إيصال الدفع', 'مقبول', Icons.check_circle, Colors.green),
              const Divider(height: 20),
              _buildDocumentRow('كشف طبي', 'قيد المراجعة', Icons.hourglass_top, accentOrange),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentRow(String name, String status, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primaryBlue)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
          child: Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  // Settings Section
  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الإعدادات',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryBlue),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: cardBorderColor)),
          child: Column(
            children: [
              SwitchListTile(
                value: _notificationsEnabled,
                activeColor: accentOrange,
                title: const Text('الإشعارات', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                secondary: const Icon(Icons.notifications_active_outlined, color: primaryBlue),
                onChanged: (val) {
                  setState(() {
                    _notificationsEnabled = val;
                  });
                },
              ),
              const Divider(height: 1),
              _buildSettingsTile(context, icon: Icons.lock_outline, title: 'تغيير كلمة المرور', onTap: () => _showSnackBar(context, 'فتح شاشة تغيير كلمة المرور')),
              const Divider(height: 1),
              _buildSettingsTile(context, icon: Icons.language, title: 'اللغة (العربية)', onTap: () => _showSnackBar(context, 'اللغة الحالية: العربية (مصر)')),
              const Divider(height: 1),
              _buildSettingsTile(context, icon: Icons.logout, title: 'تسجيل الخروج', titleColor: Colors.red, iconColor: Colors.red, onTap: () => _showLogoutDialog(context)),
            ],
          ),
        ),
      ],
    );
  }

 Widget _buildSettingsTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap, Color titleColor = primaryBlue, Color iconColor = primaryBlue}) {
  return ListTile(
    leading: Icon(icon, color: iconColor),
    title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: titleColor)),
    trailing: Icon(Icons.arrow_back_ios, size: 14, color: primaryBlue),
    onTap: onTap,
  );
}
  // Modals & Helpers
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Cairo')),
        backgroundColor: primaryBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showSessionDetailsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
                ),
                const SizedBox(height: 20),
                const Text('تفاصيل الجلسة القادمة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 16),
                _buildModalDetailRow('نوع التدريب', 'التدريب الميداني بالمدينة'),
                _buildModalDetailRow('الموعد', 'غدًا - 10:00 صباحًا'),
                _buildModalDetailRow('المدرب', 'الكابتن أحمد محمود'),
                _buildModalDetailRow('السيارة', 'هيونداي إلنترا 2024 - أوتوماتيك'),
                _buildModalDetailRow('الموقع', 'شارع الطيران - مدينة نصر - القاهرة'),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: accentOrange, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إغلاق', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildModalDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: customGray, fontSize: 13)),
          Text(value, style: const TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('تسجيل الخروج'),
          content: const Text('هل أنت متأكد من تسجيل الخروج من تطبيق سوقني؟'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
                _showSnackBar(context, 'تم تسجيل الخروج بنجاح');
              },
              child: const Text('تسجيل الخروج'),
            ),
          ],
        ),
      ),
    );
  }
}