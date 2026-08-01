import 'package:flutter/material.dart';

class AboutTermsScreen extends StatefulWidget {
  const AboutTermsScreen({Key? key}) : super(key: key);

  @override
  State<AboutTermsScreen> createState() => _AboutTermsScreenState();
}

class _AboutTermsScreenState extends State<AboutTermsScreen> {
  // Brand Color Palette (Harmonized & Unified)
  static const Color primaryBlue = Color(0xFF0F2C59);
  static const Color secondaryBlue = Color(0xFF337CCF);
  static const Color accentOrange = Color(0xFFFF7F3E);
  static const Color darkText = Color(0xFF1B263B);
  static const Color grayText = Color(0xFF6B7280);
  static const Color lightBg = Color(0xFFF8FAFC);
  static const Color cardBg = Colors.white;

  // State for terms acceptance checkbox
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg,
        appBar: AppBar(
          backgroundColor: primaryBlue,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              tooltip: 'الرجوع',
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
          title: const Text(
            'من نحن',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SECTION 1: ABOUT US (من نحن)
              _buildSouqniLogoCard(),
              const SizedBox(height: 20),

              _buildDescriptionCard(),
              const SizedBox(height: 16),

              _buildVisionMissionCards(),
              const SizedBox(height: 24),

              _buildWhySouqniSection(),
              const SizedBox(height: 32),

              // SECTION 2: TERMS & POLICY (سياسة الاستخدام والإرشادات)
              _buildTermsHeader(),
              const SizedBox(height: 16),

              _buildCancellationByTraineeTile(),
              const SizedBox(height: 12),

              _buildCancellationByTrainerTile(),
              const SizedBox(height: 12),

              _buildGeneralRulesTile(),
              const SizedBox(height: 28),

              // BOTTOM SECTION: AGREEMENT & CONFIRMATION
              _buildAgreementSection(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// 1. Souqni Logo Display
  Widget _buildSouqniLogoCard() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryBlue.withOpacity(0.06)),
          boxShadow: [
            BoxShadow(
              color: primaryBlue.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [primaryBlue, secondaryBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentOrange.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logosawaqny.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'سوقني |sawqany',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: primaryBlue,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: accentOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'المنصة المصرية لتعليم القيادة',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: accentOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 2. About Us Description
  Widget _buildDescriptionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryBlue.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'سوقني هي منصة مصرية متخصصة في تعليم القيادة، تهدف إلى ربط المتدربين بمدارس ومدربي القيادة المعتمدين بطريقة سهلة وآمنة.',
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
              color: darkText,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'توفر المنصة إمكانية البحث عن مدارس القيادة، حجز جلسات التدريب، متابعة التقدم، أداء المحاكاة النظرية، وإدارة رحلة التعلم حتى الحصول على رخصة القيادة.',
            style: TextStyle(
              fontSize: 14,
              height: 1.7,
              color: grayText,
            ),
          ),
        ],
      ),
    );
  }

  /// 3. Vision & Mission Cards
  Widget _buildVisionMissionCards() {
    return Column(
      children: [
        _buildSectionDetailCard(
          title: 'رؤيتنا',
          icon: Icons.remove_red_eye_rounded,
          content:
              'أن تصبح سوقني المنصة الرقمية الأولى في مصر لتعليم القيادة من خلال تقديم تجربة تعليمية حديثة وآمنة وموثوقة.',
        ),
        const SizedBox(height: 12),
        _buildSectionDetailCard(
          title: 'رسالتنا',
          icon: Icons.rocket_launch_rounded,
          content:
              'توفير تجربة تعليم قيادة احترافية تربط المتدرب بالمدرسة والمدرب المناسب مع تقديم خدمات رقمية سهلة وآمنة.',
        ),
      ],
    );
  }

  Widget _buildSectionDetailCard({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryBlue.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accentOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: accentOrange, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: grayText,
            ),
          ),
        ],
      ),
    );
  }

  /// 4. Why Souqni? Grid Features
  Widget _buildWhySouqniSection() {
    final features = [
      {'title': 'مدارس قيادة معتمدة', 'icon': Icons.verified_user_rounded},
      {'title': 'مدربون محترفون', 'icon': Icons.person_outline_rounded},
      {'title': 'حجز إلكتروني', 'icon': Icons.calendar_month_rounded},
      {'title': 'اختيار أقرب مدرسة', 'icon': Icons.location_on_rounded},
      {'title': 'محاكاة الامتحان النظري', 'icon': Icons.menu_book_rounded},
      {'title': 'تقييمات حقيقية', 'icon': Icons.star_rate_rounded},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 22,
              decoration: BoxDecoration(
                color: accentOrange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'لماذا سوقني؟',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: features.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final item = features[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: primaryBlue.withOpacity(0.06)),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withOpacity(0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'] as IconData, color: secondaryBlue, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    item['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: darkText,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  /// Section 2 Header
  Widget _buildTermsHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.gavel_rounded, color: accentOrange, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'سياسة الاستخدام والإرشادات',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Expansion Tile 1: Cancel & Reschedule by Trainee
  Widget _buildCancellationByTraineeTile() {
    return _buildCustomExpansionTile(
      title: 'أولاً: سياسة الإلغاء والتأجيل من طرف المتدرب',
      icon: Icons.person_rounded,
      children: [
        _buildSubPolicyItem(
          subtitle: 'الإلغاء المبكر (قبل الموعد بـ 24 ساعة على الأقل)',
          points: [
            'يمكن للمتدرب إلغاء أو تغيير موعد الحصة دون أي رسوم أو خصومات.',
            'يتم إعادة رصيد الحصة بالكامل إلى محفظة المتدرب داخل التطبيق لاستخدامه لاحقًا.',
          ],
        ),
        const Divider(height: 24, color: Color(0xFFE5E7EB)),
        _buildSubPolicyItem(
          subtitle: 'الإلغاء المتأخر (بين 24 ساعة و6 ساعات قبل الموعد)',
          points: [
            'يتم خصم 50٪ من قيمة الحصة كرسوم إلغاء متأخر.',
            'يتم إعادة الـ 50٪ المتبقية إلى محفظة المتدرب.',
          ],
        ),
        const Divider(height: 24, color: Color(0xFFE5E7EB)),
        _buildSubPolicyItem(
          subtitle:
              'الإلغاء الحرج أو عدم الحضور (أقل من 6 ساعات أو عدم الحضور خلال أول 15 دقيقة)',
          points: [
            'تعتبر الحصة منفذة بالكامل.',
            'لا يتم استرداد قيمة الحصة.',
            'يتم تعويض المدرب عن وقت الانتظار.',
          ],
        ),
      ],
    );
  }

  /// Expansion Tile 2: Cancel & Delay by Trainer / School
  Widget _buildCancellationByTrainerTile() {
    return _buildCustomExpansionTile(
      title: 'ثانياً: سياسة الإلغاء والتأخير من طرف المدرب أو المدرسة',
      icon: Icons.school_rounded,
      children: [
        _buildSubPolicyItem(
          subtitle: 'الإلغاء المبكر',
          points: [
            'إعادة جدولة الحصة تلقائياً أو توفير مدرب آخر.',
            'لا تؤثر على تقييم المدرب.',
          ],
        ),
        const Divider(height: 24, color: Color(0xFFE5E7EB)),
        _buildSubPolicyItem(
          subtitle: 'الإلغاء المتأخر',
          points: [
            'إعادة قيمة الحصة كاملة للمتدرب.',
            'تعويض المتدرب بخصم أو حصة إضافية أو أولوية حجز.',
            'خصم غرامة من المدرب.',
            'خفض تقييم المدرب بمقدار 0.2 أو 0.5 نجمة.',
          ],
        ),
        const Divider(height: 24, color: Color(0xFFE5E7EB)),
        _buildSubPolicyItem(
          subtitle: 'تكرار الإلغاء المتأخر (3 مرات خلال شهر)',
          points: [
            'إيقاف حساب المدرب لمدة أسبوع.',
            'إرسال إشعار لإدارة المدرسة.',
          ],
        ),
      ],
    );
  }

  /// Expansion Tile 3: General Safety & Enrollment Rules
  Widget _buildGeneralRulesTile() {
    return _buildCustomExpansionTile(
      title: 'ثالثاً: القواعد العامة للسلامة والالتحاق',
      icon: Icons.shield_rounded,
      children: [
        _buildBulletPoint(
          'يلتزم المتدرب بتقديم بطاقة رقم قومي سارية عند أول حصة.',
        ),
        const SizedBox(height: 10),
        _buildBulletPoint(
          'جميع الحصص مشمولة بالتأمين أثناء التدريب بشرط الالتزام بتعليمات المدرب.',
        ),
        const SizedBox(height: 10),
        _buildBulletPoint(
          'يحق للمدرب إنهاء الحصة واحتساب قيمتها بالكامل في حالة السلوك غير اللائق أو مخالفة تعليمات السلامة.',
        ),
      ],
    );
  }

  /// Custom Reusable Expansion Tile Container
  Widget _buildCustomExpansionTile({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryBlue.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: accentOrange,
          collapsedIconColor: grayText,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          leading: Icon(icon, color: secondaryBlue, size: 24),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 18.0,
                top: 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Sub-policy helper block
  Widget _buildSubPolicyItem({
    required String subtitle,
    required List<String> points,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: secondaryBlue,
          ),
        ),
        const SizedBox(height: 8),
        ...points.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: _buildBulletPoint(p),
            )),
      ],
    );
  }

  /// Bullet Point helper widget
  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Icon(Icons.circle, size: 6, color: accentOrange),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.6,
              color: darkText,
            ),
          ),
        ),
      ],
    );
  }

  /// Bottom Checkbox & Confirmation Button
  Widget _buildAgreementSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryBlue.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isAgreed = !_isAgreed;
              });
            },
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  activeColor: accentOrange,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'لقد قرأت وأوافق على سياسة الاستخدام والإرشادات.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: accentOrange,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              onPressed: _isAgreed
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'تمت الموافقة بنجاح، مرحباً بك في سوقني!',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: primaryBlue,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  : null,
              child: const Text(
                'تم',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}