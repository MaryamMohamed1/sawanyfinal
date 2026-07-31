import 'package:flutter/material.dart';

class SearchSuggestionsSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const SearchSuggestionsSection({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<Map<String, dynamic>> _suggestions = const [
    {'title': 'أقرب مدرب', 'icon': Icons.near_me_outlined},
    {'title': 'تقييم عالٍ', 'icon': Icons.star_border_rounded},
    {'title': 'أوتوماتيك', 'icon': Icons.directions_car_outlined},
    {'title': 'مانيوال', 'icon': Icons.settings_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'مقترحات',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: _suggestions.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              final item = _suggestions[index];

              return GestureDetector(
                onTap: () => onSelect(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF0E216C) : const Color(0xFFFFFFFF), // الكحلي الغامق الأساسي عند التحديد، والأبيض كخلفية افتراضية
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91).withOpacity(0.3), // الرمادي المعتمد للحدود غير المحددة
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        size: 16,
                        color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF838C91), // الأبيض عند التحديد والرمادي المعتمد للأيقونة غير المحددة
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item['title'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF000000), // الأبيض للنص المحدد والأسود الصريح للنص العادي لضمان أعلى وضوح
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}