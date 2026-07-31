import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/trainer_model.dart';

import '../../reliability_ratings/models/trainer_rating_model.dart';

import '../../reliability_ratings/screens/reliability_ratings_screen.dart';

import '../widgets/trainer_card.dart';

import '../../widgets/school_app_bar.dart';

class TrainerManagementScreen extends StatefulWidget {
  const TrainerManagementScreen({super.key});

  @override
  State<TrainerManagementScreen> createState() =>
      _TrainerManagementScreenState();
}

class _TrainerManagementScreenState extends State<TrainerManagementScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedFilter = 'الكل';

  List<TrainerModel> filteredTrainers = [];

  final List<TrainerModel> trainers = [
    TrainerModel(
      name: 'أحمد محمود',
      image: 'https://i.pravatar.cc/150?img=12',
      verificationStatus: 'موثق',
      reliabilityScore: 96,
      rating: 4.9,
      completedSessions: 124,
      availability: 'متاح الآن',
      isAvailable: true,
    ),
    TrainerModel(
      name: 'سارة حسن',
      image: 'https://i.pravatar.cc/150?img=47',
      verificationStatus: 'قيد المراجعة',
      reliabilityScore: 85,
      rating: 4.2,
      completedSessions: 45,
      availability: 'غير متاحة الآن',
      isAvailable: false,
    ),
    TrainerModel(
      name: 'ياسر فوزي',
      image: 'https://i.pravatar.cc/150?img=11',
      verificationStatus: 'موثق',
      reliabilityScore: 90,
      rating: 5.0,
      completedSessions: 80,
      availability: 'متاح الآن',
      isAvailable: true,
    ),
  ];

  @override
  void initState() {
    super.initState();

    filteredTrainers = trainers;
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void filterTrainers() {
    final searchText = searchController.text.trim().toLowerCase();

    setState(() {
      filteredTrainers = trainers.where((trainer) {
        final matchesSearch = trainer.name.toLowerCase().contains(searchText);

        bool matchesFilter = true;

        if (selectedFilter == 'موثق') {
          matchesFilter = trainer.verificationStatus == 'موثق';
        } else if (selectedFilter == 'متاح') {
          matchesFilter = trainer.isAvailable;
        } else if (selectedFilter == 'غير متاح') {
          matchesFilter = !trainer.isAvailable;
        }

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: AppColors.lightBackground,
        child: Column(
          children: [
            SchoolAppBar(title: 'إدارة المدربين', onNotificationPressed: () {}),
            Expanded(child: _buildTrainerManagementContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainerManagementContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTabs(),

          const SizedBox(height: 18),

          TextField(
            controller: searchController,
            onChanged: (_) {
              filterTrainers();
            },
            decoration: const InputDecoration(
              hintText: 'ابحث عن مدرب بالاسم أو الرقم...',
              prefixIcon: Icon(Icons.search),
            ),
          ),

          const SizedBox(height: 12),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip(title: 'الكل'),
                _buildFilterChip(title: 'موثق'),
                _buildFilterChip(title: 'متاح'),
                _buildFilterChip(title: 'غير متاح'),
              ],
            ),
          ),

          const SizedBox(height: 18),

          if (filteredTrainers.isEmpty)
            const Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Text(
                  'لا يوجد مدربين مطابقين للبحث',
                  style: TextStyle(color: AppColors.gray),
                ),
              ),
            ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredTrainers.length,
            itemBuilder: (context, index) {
              return TrainerCard(trainer: filteredTrainers[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTab(title: 'إدارة المدربين', isSelected: true, onTap: () {}),
        _buildTab(
          title: 'الاعتمادية والتقييمات',
          isSelected: false,
          onTap: () {
            final List<TrainerRatingModel> trainerRatings = trainers.map((
              trainer,
            ) {
              return TrainerRatingModel(
                name: trainer.name,
                image: trainer.image,
                rating: trainer.rating,
                reliabilityScore: trainer.reliabilityScore.toInt(),
                completedSessions: trainer.completedSessions,
                totalRatings: 86,
                status: trainer.reliabilityScore >= 90 ? 'ممتاز' : 'جيد',
                attendanceRate: trainer.reliabilityScore >= 90 ? 94.0 : 85.0,
                punctualityRate: trainer.reliabilityScore >= 90 ? 96.0 : 82.0,
              );
            }).toList();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ReliabilityScoreScreen(trainers: trainerRatings);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? AppColors.primary : AppColors.gray,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              color: isSelected ? AppColors.accent : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip({required String title}) {
    final isSelected = selectedFilter == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });

        filterTrainers();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? AppColors.white : AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}