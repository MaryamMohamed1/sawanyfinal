import 'package:flutter/material.dart';
import 'partners_header_section.dart';
import 'partners_stats_section.dart';
import 'partner_card_item.dart';
import 'partners_banner_section.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  // 1. لستة الأكاديميات والمدارس التعليمية
  final List<Map<String, dynamic>> _trainingPartners = const [
    {
      'name': 'مدرسة الأهرام لتعليم القيادة',
      'brief': 'توفير مضامير تدريب مغلقة وسيارات مجهزة بدواسات أمان مزدوجة للتدريب العملي.',
      'badges': ['مضمار مجهز', 'سيارات مزدوجة التحكم'],
      'expiry': 'عقد دائم',
      'fullDetails': 'تتيح هذه الشراكة لمتدربي التطبيق استخدام مضامير التدريب المغلقة والمعتمدة الخاصة بمدرسة الأهرام في الجيزة و6 أكتوبر.',
    },
    {
      'name': 'أكاديمية مصر للقيادة الآمنة',
      'brief': 'حصص تدريبية متطورة باستخدام أجهزة المحاكاة (Simulator) والقيادة الدفاعية.',
      'badges': ['أجهزة محاكاة 3D', 'شهادات معتمدة'],
      'expiry': 'حتى 2027',
      'fullDetails': 'اتفاقية حصرية يوفر بموجبها مركز المحاكاة بالأكاديمية حصصاً تدريبية باستخدام أجهزة Simulator ثلاثية الأبعاد.',
    },
    {
      'name': 'مركز أكتوبر لاختبارات القيادة',
      'brief': 'إجراء اختبارات محاكاة لاختبار المرور الرسمي للتأكد من جاهزية المتدرب للرخصة.',
      'badges': ['تأهل لرخصة القيادة', 'تقييم شامل'],
      'expiry': 'حتى 2026',
      'fullDetails': 'شراكة تتيح للمتدربين خوض تجربة اختبار قيادة مماثلة تماماً لاختبار إدارة المرور الرسمية.',
    },
    {
      'name': 'المؤسسة المصرية للسلامة المرورية',
      'brief': 'إعداد وتحديث المنهج النظري وشرح إشارات وقوانين المرور المصرية.',
      'badges': ['منهج نظري معتمد', 'قوانين المرور'],
      'expiry': 'حتى 2028',
      'fullDetails': 'شراكة تعليمية لإعداد كافة المواد العلمية والفيديوهات المتاحة داخل قسم التعلم بالتطبيق.',
    },
  ];

  // 2. ✨ لستة مراكز الصيانة المعتمدة الجديدة 👇
  final List<Map<String, dynamic>> _maintenancePartners = const [
    {
      'name': 'مركز نايل موتورز للصيانة السريعة',
      'brief': 'فحص دوري شامل، تغيير الزيوت، وتجهيز السيارات لرحلات التدريب الطويلة بكفاءة وأمان.',
      'badges': ['صيانة سريعة', 'خصم للمدربين'],
      'expiry': 'حتى 2027',
      'fullDetails': 'يقدم المركز خدمات الصيانة الدورية وقطع الغيار الأصلية بخصومات حصرية لسيارات المدربين المسجلين في سوقني.',
    },
    {
      'name': 'المركز الألماني المتكامل لصيانة السيارات',
      'brief': 'فحص كمبيوتر متقدم، ضبط زوايا، وإصلاح العفشة والتكييف بأحدث الأجهزة المعتمدة.',
      'badges': ['فحص كمبيوتر 5G', 'ضمان معتمد'],
      'expiry': 'عقد دائم',
      'fullDetails': 'شراكة تضمن فحصاً شاملاً لسلامة الهيكل الخارجي والداخلي للسيارات لضمان أعلى معايير الأمان للمتدربين.',
    },
    {
      'name': 'مجموعة مراكز فيت آند فيكس (Fit & Fix)',
      'brief': 'متخصصون في خدمات الإطارات، الاتزان، فحص الفرامل، وتغيير البطاريات بأعلى جودة.',
      'badges': ['خدمات الإطارات', 'فحص فرامل مجاني'],
      'expiry': 'حتى 2028',
      'fullDetails': 'توفر الشراكة فحصاً مجانياً لمنظومة الفرامل والإطارات شهرياً لجميع سيارات كباتن منصة سوقني.',
    },
    {
      'name': 'مركز الأمل لصيانة ناقل الحركة (الفتيس)',
      'brief': 'صيانة وإصلاح صناديق التروس الأوتوماتيك والمانيوال لسيارات التدريب تحت إشراف مهندسين متخصصين.',
      'badges': ['متخصص فتيس', 'قطع غيار أصلية'],
      'expiry': 'حتى 2026',
      'fullDetails': 'يقدم المركز صيانة متخصصة لناقل الحركة مع توفير قطع غيار استيراد وجديدة بأسعار مخفضة لمواجهة ضغط حصص القيادة.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF0E216C),
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            title: const Text(
              'شركائنا في التدريب والصيانة',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PartnersHeaderSection(),
                  const SizedBox(height: 24),
                  const PartnersStatsSection(),
                  const SizedBox(height: 24),
                  
                  // --- قسم الأكاديميات ---
                  const Text(
                    'مراكز وأكاديميات التدريب المعتمدة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // بناء كروت الأكاديميات من اللستة
                  ..._trainingPartners.map((partner) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: PartnerCardItem(
                      name: partner['name'],
                      brief: partner['brief'],
                      badges: List<String>.from(partner['badges']),
                      expiry: partner['expiry'],
                      fullDetails: partner['fullDetails'],
                    ),
                  )),

                  const SizedBox(height: 16),

                  // --- ✨ قسم مراكز الصيانة الجديد 👇 ---
                  const Text(
                    'مراكز الصيانة والدعم الفني المعتمدة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // بناء كروت الصيانة من اللستة الجديدة
                  ..._maintenancePartners.map((partner) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: PartnerCardItem(
                      name: partner['name'],
                      brief: partner['brief'],
                      badges: List<String>.from(partner['badges']),
                      expiry: partner['expiry'],
                      fullDetails: partner['fullDetails'],
                    ),
                  )),

                  const SizedBox(height: 16),
                  const PartnersBannerSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}