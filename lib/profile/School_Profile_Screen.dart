import 'package:flutter/material.dart';

class SchoolProfileScreen extends StatefulWidget {
  const SchoolProfileScreen({super.key});

  @override
  State<SchoolProfileScreen> createState() => _SchoolProfileScreenState();
}

class _SchoolProfileScreenState extends State<SchoolProfileScreen> {
  bool _isFavorite = false;
  int _selectedPackageIndex = 0;

  // Colors definition as per user constraints
  static const Color primaryBlue = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color customGray = Color(0xFF838C91);
  static const Color lightBg = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg,
        body: Stack(
          children: [
            // Scrollable Content
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 1. Header with Cover Image & App Bar
                _buildSliverHeader(context),

                // Main Body Content
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),

                        // School Info Card (Name, Rating, City)
                        _buildSchoolHeaderInfoCard(),

                        const SizedBox(height: 20),

                        // 2. Statistics Grid (4 Cards)
                        _buildStatisticsSection(),

                        const SizedBox(height: 24),

                        // 3. About School Section
                        _buildAboutSchoolSection(),

                        const SizedBox(height: 24),

                        // 4. Features & Facilities Section (Orange Title)
                        _buildFeaturesAndFacilitiesSection(),

                        const SizedBox(height: 24),

                        // 5. Achievement Cards (4 Orange Cards)
                        _buildAchievementCardsSection(),

                        const SizedBox(height: 24),

                        // 6. Best Trainers Section (Horizontal Scroll)
                        _buildBestTrainersSection(context),

                        const SizedBox(height: 24),

                        // 7. Training Packages Section
                        _buildTrainingPackagesSection(),

                        const SizedBox(height: 24),

                        // 8. Location Section (Map Preview)
                        _buildLocationSection(),

                        const SizedBox(height: 24),

                        // 9. Student Reviews Section (Orange Title & Icon)
                        _buildStudentReviewsSection(),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 1. SLIVER HEADER (Cover Image, Back/Share/Favorite Actions, Logo)
  // ---------------------------------------------------------------------------
  Widget _buildSliverHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220.0,
      pinned: true,
      backgroundColor: primaryBlue,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.85),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: primaryBlue, size: 18),
            // تعديل زرار الرجوع عشان يرجعك للشاشة اللي قبلها صح
            onPressed: () => Navigator.pop(context), 
          ),
        ),
      ),
      actions: [
        // Share Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.85),
            child: IconButton(
              icon: const Icon(Icons.share_outlined, color: primaryBlue, size: 20),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم نسخ رابط ملف المدرسة بنجاح', textDirection: TextDirection.rtl),
                    backgroundColor: primaryBlue,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ),
        // Favorite Button
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.85),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : primaryBlue,
                size: 20,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Cover Image
            Image.network(
              'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&q=80&w=1000',
              fit: BoxFit.cover,
            ),
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
            // School Logo inside CircleAvatar
            Positioned(
              bottom: 12,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: primaryBlue,
                    child: Icon(
                      Icons.school_rounded,
                      color: accentOrange,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // SCHOOL HEADER INFO CARD
  // ---------------------------------------------------------------------------
  Widget _buildSchoolHeaderInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'أكاديمية سوقني لتعليم القيادة',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF3FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified_rounded,
                  color: accentOrange,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: accentOrange.withOpacity(0.3)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star_rounded, color: accentOrange, size: 18),
                    SizedBox(width: 4),
                    Text('4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: accentOrange)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text('(1,480 تقييم)', style: TextStyle(fontSize: 13, color: customGray)),
              const Spacer(),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined, color: customGray, size: 16),
                  SizedBox(width: 4),
                  Text('مدينة نصر، القاهرة', style: TextStyle(fontSize: 13, color: customGray)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 2. STATISTICS SECTION
  // ---------------------------------------------------------------------------
  Widget _buildStatisticsSection() {
    final stats = [
      {'icon': Icons.supervisor_account_rounded, 'number': '35', 'label': 'عدد المدربين'},
      {'icon': Icons.school_rounded, 'number': '+15,000', 'label': 'عدد المتدربين'},
      {'icon': Icons.directions_car_rounded, 'number': '28', 'label': 'سيارات التدريب'},
      {'icon': Icons.emoji_events_rounded, 'number': '12 سنة', 'label': 'سنوات الخبرة'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final item = stats[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: accentOrange, size: 24),
                  const SizedBox(width: 6),
                  Text(
                    item['number'] as String,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: accentOrange),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                item['label'] as String,
                style: const TextStyle(fontSize: 13, color: customGray, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // 3. ABOUT SCHOOL SECTION
  // ---------------------------------------------------------------------------
  Widget _buildAboutSchoolSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4, height: 18, decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.circular(2))),
              const SizedBox(width: 8),
              const Text('نبذة عن المدرسة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryBlue)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'تعد أكاديمية سوقني لتعليم القيادة من المراكز المتخصصة في تعليم القيادة داخل مصر، حيث توفر برامج تدريب عملية ونظرية بإشراف مدربين معتمدين، مع سيارات حديثة وتجهيز كامل لاجتياز اختبار رخصة القيادة بأمان وثقة.',
            style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 4. FEATURES & FACILITIES
  // ---------------------------------------------------------------------------
  Widget _buildFeaturesAndFacilitiesSection() {
    final features = [
      {'label': 'سيارات أوتوماتيك', 'icon': Icons.no_crash_rounded},
      {'label': 'سيارات مانيوال', 'icon': Icons.settings_rounded},
      {'label': 'مدربات سيدات', 'icon': Icons.face_3_rounded},
      {'label': 'تدريب للرخصة', 'icon': Icons.card_membership_rounded},
      {'label': 'اختبار تجريبي', 'icon': Icons.fact_check_rounded},
      {'label': 'حجز أونلاين', 'icon': Icons.add_to_home_screen_rounded},
      {'label': 'قاعات محاكاة VR', 'icon': Icons.vrpano_rounded},
      {'label': 'مضمار قيادة مغلق', 'icon': Icons.alt_route_rounded},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.stars_rounded, color: accentOrange, size: 22),
              SizedBox(width: 8),
              Text(
                'المزايا والتسهيلات',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: accentOrange),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: features.map((f) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: primaryBlue.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(f['icon'] as IconData, size: 18, color: primaryBlue),
                    const SizedBox(width: 8),
                    Text(f['label'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryBlue)),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 5. ACHIEVEMENT CARDS
  // ---------------------------------------------------------------------------
  Widget _buildAchievementCardsSection() {
    final achievements = [
      {'icon': Icons.workspace_premium_rounded, 'title': 'خريج معتمد', 'desc': '+14,500 متدرب ناجح'},
      {'icon': Icons.badge_rounded, 'title': 'مدرب محترف', 'desc': '35 مدرب معتمد'},
      {'icon': Icons.calendar_month_rounded, 'title': 'سنوات الخبرة', 'desc': '12 سنة عطاء'},
      {'icon': Icons.trending_up_rounded, 'title': 'نسبة النجاح', 'desc': '98.5% من أول مرة'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('إنجازات واعتمادات المدرسة', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryBlue)),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: achievements.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final item = achievements[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8F1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accentOrange.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: accentOrange, size: 26),
                  const SizedBox(height: 6),
                  Text(item['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: accentOrange)),
                  const SizedBox(height: 2),
                  Text(item['desc'] as String, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: accentOrange.withOpacity(0.85))),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 6. BEST TRAINERS SECTION
  // ---------------------------------------------------------------------------
  Widget _buildBestTrainersSection(BuildContext context) {
    final trainers = [
      {'name': 'الكابتن أحمد محمد', 'rating': '4.98', 'exp': 'خبرة 8 سنوات', 'image': 'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=200'},
      {'name': 'الكابتن نورهان علي', 'rating': '4.95', 'exp': 'خبرة 6 سنوات', 'image': 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=200'},
      {'name': 'الكابتن كريم عبد الرحمن', 'rating': '4.92', 'exp': 'خبرة 10 سنوات', 'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=200'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('أفضل المدربين', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryBlue)),
            Text('عرض الكل', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: accentOrange)),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: trainers.length,
            itemBuilder: (context, index) {
              final t = trainers[index];
              return Container(
                width: 160,
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
                ),
                child: Column(
                  children: [
                    CircleAvatar(radius: 32, backgroundImage: NetworkImage(t['image']!)),
                    const SizedBox(height: 8),
                    Text(t['name']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: primaryBlue), maxLines: 1),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_rounded, color: accentOrange, size: 14),
                        const SizedBox(width: 2),
                        Text(t['rating']!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: accentOrange)),
                        const SizedBox(width: 6),
                        Text(t['exp']!, style: const TextStyle(fontSize: 11, color: customGray)),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue.withOpacity(0.08),
                          foregroundColor: primaryBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: const Text('عرض الملف', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 7. TRAINING PACKAGES SECTION
  // ---------------------------------------------------------------------------
  Widget _buildTrainingPackagesSection() {
    final packages = [
      {
        'title': 'الباقة الأساسية',
        'price': '4,500 ج.م',
        'sessions': '10 حصص تدريبية',
        'duration': '45 دقيقة لكل حصة',
        'features': ['6 حصص تدريب عملي بمضمار مغلق', '4 حصص قيادة بالشارع العام', 'حجز موعد الاختبار مجاناً'],
        'popular': false,
      },
      {
        'title': 'الباقة الاحترافية',
        'price': '7,500 ج.م',
        'sessions': '20 حصة تدريبية',
        'duration': '60 دقيقة لكل حصة',
        'features': ['12 حصة تدريب عملي مباشر', '8 حصص مراجعة واختبار تجريبي', 'مدرب خاص مع اختيار السيارة'],
        'popular': true,
      },
      {
        'title': 'الباقة الشاملة',
        'price': '10,500 ج.م',
        'sessions': '30 حصة تدريبية',
        'duration': '60 دقيقة لكل حصة',
        'features': ['20 حصة تدريب عملي', '10 حصص نظري ومحاكاة', 'متابعة خاصة لاستخراج الرخصة'],
        'popular': false,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('باقات التدريب', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryBlue)),
        const SizedBox(height: 12),
        Column(
          children: List.generate(packages.length, (index) {
            final p = packages[index];
            final isSelected = _selectedPackageIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() => _selectedPackageIndex = index);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isSelected ? accentOrange : Colors.transparent, width: 2),
                  boxShadow: [BoxShadow(color: isSelected ? accentOrange.withOpacity(0.12) : Colors.black.withOpacity(0.04), blurRadius: 14)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (p['popular'] == true)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(color: const Color(0xFFFFF2E5), borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.local_fire_department_rounded, color: accentOrange, size: 14),
                            SizedBox(width: 4),
                            Text('الأكثر طلباً', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: accentOrange)),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(p['title'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryBlue))),
                        Text(p['price'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: accentOrange)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('${p['sessions']} • ${p['duration']}', style: const TextStyle(fontSize: 13, color: customGray)),
                    const Divider(height: 20, color: Color(0xFFF1F5F9)),
                    Column(
                      children: ((p['features'] as List<String>)).map((feat) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_rounded, color: accentOrange, size: 16),
                              const SizedBox(width: 8),
                              Expanded(child: Text(feat, style: const TextStyle(fontSize: 13, color: Colors.black87))),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? accentOrange : primaryBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text('احجز الآن', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 8. LOCATION SECTION
  // ---------------------------------------------------------------------------
  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('الموقع', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: primaryBlue)),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15)],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network('https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: primaryBlue, size: 22),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('شارع الطيران، مدينة نصر', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                          Text('القاهرة، جمهورية مصر العربية', style: TextStyle(fontSize: 12, color: customGray)),
                        ],
                      ),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(foregroundColor: accentOrange, side: const BorderSide(color: accentOrange)),
                      onPressed: () {},
                      icon: const Icon(Icons.navigation_rounded, size: 16),
                      label: const Text('الاتجاهات', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 9. STUDENT REVIEWS SECTION
  // ---------------------------------------------------------------------------
  Widget _buildStudentReviewsSection() {
    final reviews = [
      {'name': 'محمد أحمد', 'rating': 5, 'date': 'قبل يومين', 'text': 'المدربين محترمين جدًا والشرح بسيط، والسيارات حديثة ونظيفة والتجربة كانت ممتازة.', 'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=150'},
      {'name': 'مريم خالد', 'rating': 5, 'date': 'قبل أسبوع', 'text': 'اتبسطت جدًا في التدريب وقدرت أسوق بثقة من أول أسبوع بفضل الكابتن نورهان.', 'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=150'},
      {'name': 'أحمد خالد', 'rating': 5, 'date': 'قبل أسبوعين', 'text': 'المواعيد كانت منتظمة والتعامل ممتاز، أنصح أي حد لسه بيتعلم يسجل هنا.', 'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=150'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.rate_review_rounded, color: accentOrange, size: 22),
            SizedBox(width: 8),
            Text('تجارب المتدربين', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: accentOrange)),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: reviews.map((r) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 20, backgroundImage: NetworkImage(r['image'] as String)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(r['name'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                            Text(r['date'] as String, style: const TextStyle(fontSize: 11, color: customGray)),
                          ],
                        ),
                      ),
                      Row(children: List.generate(r['rating'] as int, (i) => const Icon(Icons.star_rounded, color: accentOrange, size: 16))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(r['text'] as String, style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.5)),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}