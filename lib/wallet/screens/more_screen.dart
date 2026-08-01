import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

import '../incident_reports/screens/incident_reports_screen.dart';

import '../school_reports/screens/school_reports_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: AppColors.lightBackground,

        appBar: AppBar(
          centerTitle: true,

          title: const Text(
            'المزيد',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),

          backgroundColor: AppColors.white,

          elevation: 0,

          iconTheme: const IconThemeData(color: AppColors.black),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              _buildMenuItem(
                icon: Icons.warning_amber_outlined,
                title: 'بلاغات الحوادث',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IncidentReportsScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              _buildMenuItem(
                icon: Icons.bar_chart_outlined,
                title: 'تقارير المدرسة',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SchoolReportsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),
      ),

      child: ListTile(
        onTap: onTap,

        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 15,
          color: AppColors.gray,
        ),

        trailing: Icon(icon, color: AppColors.primary, size: 24),

        title: Text(
          title,

          style: const TextStyle(
            fontSize: 13,

            fontWeight: FontWeight.bold,

            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
