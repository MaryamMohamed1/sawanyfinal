import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../widgets/report_stat_card.dart';

import '../widgets/total_revenue_card.dart';

import '../widgets/report_small_stat_card.dart';

import '../widgets/revenue_overview_card.dart';

import '../widgets/booking_status_card.dart';

import '../widgets/revenue_by_service_card.dart';

import '../widgets/business_insights_widget.dart';

import '../widgets/customer_growth_widget.dart';

import '../../widgets/school_app_bar.dart';

import '../../widgets/school_bottom_nav_bar.dart';

import '../../widgets/school_navigation.dart';

class SchoolReportsScreen extends StatelessWidget {
  const SchoolReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: AppColors.lightBackground,

        appBar: SchoolAppBar(
          title: 'تقارير المدرسة',

          onNotificationPressed: () {},
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Row(
                children: [
                  Expanded(
                    child: ReportStatCard(
                      title: 'إجمالي الحجوزات',

                      value: '1,240',

                      icon: Icons.calendar_month_outlined,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: ReportStatCard(
                      title: 'الحصص المكتملة',

                      value: '980',

                      icon: Icons.school_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const TotalRevenueCard(
                revenue: '156,000 ج.م',

                percentage: '+12.5%',
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  const Expanded(
                    child: ReportSmallStatCard(
                      title: 'متوسط التقييم',

                      value: '4.8 ⭐',
                    ),
                  ),

                  const SizedBox(width: 8),

                  const Expanded(
                    child: ReportSmallStatCard(
                      title: 'استخدام المدربين',

                      value: '88%',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const Text(
                'نظرة عامة على الإيرادات',

                textAlign: TextAlign.right,

                style: TextStyle(
                  fontSize: 14,

                  color: AppColors.primary,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const RevenueOverviewCard(),

              const SizedBox(height: 16),

              const Text(
                'حالة الحجوزات',

                textAlign: TextAlign.right,

                style: TextStyle(
                  fontSize: 14,

                  color: AppColors.primary,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const BookingStatusCard(),

              const SizedBox(height: 16),

              const Text(
                'الإيرادات حسب نوع الخدمة',

                textAlign: TextAlign.right,

                style: TextStyle(
                  fontSize: 14,

                  color: AppColors.primary,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const RevenueByServiceCard(),

              const SizedBox(height: 20),

              // رؤى الأعمال
              const BusinessInsightsWidget(),

              const SizedBox(height: 20),

              // نمو العملاء
              const CustomerGrowthWidget(),

              const SizedBox(height: 20),
            ],
          ),
        ),

        bottomNavigationBar: SchoolBottomNavBar(
          currentIndex: 4,

          onItemTapped: (index) {
            SchoolNavigation.navigate(context, index);
          },
        ),
      ),
    );
  }
}
