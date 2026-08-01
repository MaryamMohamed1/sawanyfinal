import 'package:flutter/material.dart';

import 'filter.dart';
import 'search_widgets/recentsearches.dart';
import 'search_widgets/searchappbar.dart';
import 'search_widgets/searchresultcard.dart';
import 'search_widgets/searchsuggestions.dart';
import 'package:sawany/profile/trainer/trainerscreen.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedSuggestionIndex = 0;

  // متغيّر لحفظ الفلاتر النشطة (اختياري لاستخدامه لاحقاً)
  Map<String, dynamic>? _activeFilters;

  List<String> _recentSearches = ['مدرب مانيوال', 'مدرسة السلام'];

  final List<Map<String, dynamic>> _searchResults = const [
    {
      'name': 'أحمد محمد',
      'school': 'مدرسة القيادة الممتازة',
      'distance': '2.5',
    },
    {
      'name': 'محمود علي',
      'school': 'النخبة لتعليم القيادة',
      'distance': '3.8',
    },
  ];

  // دالة فتح الـ BottomSheet واستقبال الفلاتر المطبقة
  Future<void> _openFilterBottomSheet() async {
    final Map<String, dynamic>? selectedFilters =
        await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );

    if (selectedFilters != null) {
      setState(() {
        _activeFilters = selectedFilters;
      });

      // هنا يمكنك استخدام الفلاتر لتصفية قائمة النتائج Real-time
      print('الفلاتر المختارة: $_activeFilters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC), // خلفية نظيفة ومتناسقة مع الهوية
        body: SafeArea(
          child: Column(
            children: [
              // 1. شريط البحث والأب بار العلوي مع تفعيل الفلتر
              SearchAppBarSection(
                controller: _searchController,
                onFilterTap: _openFilterBottomSheet,
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // 2. البحث الأخير
                    RecentSearchesSection(
                      recentSearches: _recentSearches,
                      onClearAll: () {
                        setState(() {
                          _recentSearches.clear();
                        });
                      },
                      onSelectSearch: (query) {
                        _searchController.text = query;
                      },
                    ),
                    const SizedBox(height: 16),

                    // 3. المقترحات
                    SearchSuggestionsSection(
                      selectedIndex: _selectedSuggestionIndex,
                      onSelect: (index) {
                        setState(() {
                          _selectedSuggestionIndex = index;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // 4. عنوان نتائج البحث
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'نتائج البحث (${_searchResults.length})',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000), // الأسود الصريح لعنوان النتائج لضمان أعلى وضوح
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 5. قائمة النتائج (تم إضافة الربط بشاشة الملف الشخصي هنا)
..._searchResults.map(
  (result) => SearchResultCard(
    data: result,
    onDetailsTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          // التعديل هنا: غيرناها لـ TrainerScreen
          builder: (context) => const TrainerScreen(), 
        ),
      );
    },
  ),
),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}