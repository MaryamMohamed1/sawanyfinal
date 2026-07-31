import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/rating_summary_card.dart';

import '../models/trainer_rating_model.dart';

import '../widgets/reliability_summary_cards.dart';
import '../widgets/reliability_score_card.dart';
import '../widgets/sessions_chart_card.dart';
import '../widgets/top_trainers_card.dart';
import '../widgets/trainers_improvement_card.dart';

import '../../widgets/school_app_bar.dart';
import '../../widgets/school_bottom_nav_bar.dart';
import '../../widgets/school_navigation.dart';

class ReliabilityScoreScreen extends StatelessWidget {
  final List<TrainerRatingModel> trainers;

  const ReliabilityScoreScreen({
    super.key,
    required this.trainers,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: AppColors.lightBackground,

        appBar: SchoolAppBar(
          title: 'الاعتمادية والتقييمات',
          onNotificationPressed: () {},
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              ReliabilitySummaryCards(
                trainers: trainers,
              ),

              const SizedBox(height: 18),

              ReliabilityScoreSection(
                trainers: trainers,
              ),

              const SizedBox(height: 18),

              SessionsChartCard(
                trainers: trainers,
              ),

              const SizedBox(height: 18),

              RatingsDistributionCard(
                trainers: trainers,
              ),

              const SizedBox(height: 18),

              TopTrainersCard(
                trainers: trainers,
              ),

              const SizedBox(height: 18),

              TrainersImprovementCard(
                trainers: trainers,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),

        bottomNavigationBar: SchoolBottomNavBar(
          currentIndex: 3,

          onItemTapped: (index) {
            SchoolNavigation.navigate(
              context,
              index,
            );
          },
        ),
      ),
    );
  }
}