import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'package:sawany/Home/home_widgets/appbar.dart';
import '../driving/license_steps_card.dart';
import '../driving/required_documents_card.dart';
import '../driving/places_card.dart';
import '../driving/tips_card.dart';
import '../driving/faq_card.dart';
import '../driving/notice_card.dart';

class DrivingLicenseGuideScreen extends StatelessWidget {
  const DrivingLicenseGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.lightBackground,

        appBar: HomeAppBar(
          onSettingsTap: () => Navigator.pop(context),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LicenseStepsCard(),

              SizedBox(height: 18),

              RequiredDocumentsCard(),

              SizedBox(height: 18),

              PlacesCard(),

              SizedBox(height: 18),

              TipsCard(),

              SizedBox(height: 18),

              FaqCard(),

              SizedBox(height: 20),

              NoticeCard(),
            ],
          ),
        ),
      ),
    );
  }
}
