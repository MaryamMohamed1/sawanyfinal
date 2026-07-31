import 'package:flutter/material.dart';

// استيراد الـ Widgets المنفصلة من مجلد home_widgets
import 'home_widgets/appbar.dart';
import 'home_widgets/categoriesgrid.dart';
import 'home_widgets/filterlist.dart';
import 'home_widgets/promobanner.dart';
import 'home_widgets/searchbar.dart';
import 'home_widgets/sectionheader.dart';
import 'home_widgets/trainercard.dart';
import 'home_widgets/schoolslist.dart';
import 'home_widgets/ai_chatbot_fab.dart'; 

import 'package:sawany/profile/student_profile_screen.dart'; 
import 'Search/searchscreen.dart'; 
import '../checkout/checkout_screen.dart'; 
import 'package:sawany/profile/settings_screen.dart'; 
import '../more/knowledge_center_screen.dart'; 

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        
        appBar: HomeAppBar(
          onSettingsTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ),
            );
          },
          onProfileTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentProfileScreen(),
              ),
            );
          },
        ),

        // زرار الشات بوت المنفصل والمضبوط بدون أخطاء
        floatingActionButton: const AiChatbotFab(),

        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeSearchBar(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    const FilterChipsList(),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KnowledgeCenterScreen(),
                            ),
                          );
                        },
                        child: const PromoBanner(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CategoriesSection(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SectionHeader(
                        title: 'مدربون بالقرب منك',
                        onSeeAll: () {},
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TrainerCard(
                        onBookTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(), 
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SectionHeader(
                        title: 'أفضل مدارس القيادة',
                        onSeeAll: () {},
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SchoolsList(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}