

import 'package:flutter/material.dart';
import 'partners_header_section.dart';
import 'partners_stats_section.dart';
import 'partner_card_item.dart';
import 'partners_banner_section.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFF0E216C),
            elevation: 0,
            iconTheme:  const IconThemeData(
    color: Colors.white,
  ),
            centerTitle: true,
            title: const Text(
              'شركائنا في التدريب',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PartnersHeaderSection(),
                  const SizedBox(height: 24),
                  const PartnersStatsSection(),
                  const SizedBox(height: 24),
                  const Text(
                    'مراكز وأكاديميات التدريب المعتمدة',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PartnerCardItem(
                    name: 'مدرسة الأهرام لتعليم القيادة',
                    brief: 'توفير مضامير تدريب مغلقة وسيارات مجهزة بدواسات أمان مزدوجة للتدريب العملي.',
                    badges: ['مضمار مجهز', 'سيارات مزدوجة التحكم'],
                    expiry: 'عقد دائم',
                    fullDetails: 'تتيح هذه الشراكة لمتدربي التطبيق استخدام مضامير التدريب المغلقة والمعتمدة الخاصة بمدرسة الأهرام في الجيزة و6 أكتوبر.',
                  ),
                  const SizedBox(height: 16),
                  const PartnerCardItem(
                    name: 'أكاديمية مصر للقيادة الآمنة',
                    brief: 'حصص تدريبية متطورة باستخدام أجهزة المحاكاة (Simulator) والقيادة الدفاعية.',
                    badges: ['أجهزة محاكاة 3D', 'شهادات معتمدة'],
                    expiry: 'حتى 2027',
                    fullDetails: 'اتفاقية حصرية يوفر بموجبها مركز المحاكاة بالأكاديمية حصصاً تدريبية باستخدام أجهزة Simulator ثلاثية الأبعاد.',
                  ),
                  const SizedBox(height: 16),
                  const PartnerCardItem(
                    name: 'مركز أكتوبر لاختبارات القيادة',
                    brief: 'إجراء اختبارات محاكاة لاختبار المرور الرسمي للتأكد من جاهزية المتدرب للرخصة.',
                    badges: ['تأهيل لرخصة القيادة', 'تقييم شامل'],
                    expiry: 'حتى 2026',
                    fullDetails: 'شراكة تتيح للمتدربين خوض تجربة اختبار قيادة مماثلة تماماً لاختبار إدارة المرور الرسمية.',
                  ),
                  const SizedBox(height: 16),
                  const PartnerCardItem(
                    name: 'المؤسسة المصرية للسلامة المرورية',
                    brief: 'إعداد وتحديث المنهج النظري وشرح إشارات وقوانين المرور المصرية.',
                    badges: ['منهج نظري معتمد', 'قوانين المرور'],
                    expiry: 'حتى 2028',
                    fullDetails: 'شراكة تعليمية لإعداد كافة المواد العلمية والفيديوهات المتاحة داخل قسم التعلم بالتطبيق.',
                  ),
                  const SizedBox(height: 24),
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



