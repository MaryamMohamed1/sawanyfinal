import 'package:flutter/material.dart';

class RecentSearchesSection extends StatelessWidget {
  final List<String> recentSearches;
  final VoidCallback onClearAll;
  final Function(String) onSelectSearch;

  const RecentSearchesSection({
    super.key,
    required this.recentSearches,
    required this.onClearAll,
    required this.onSelectSearch,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearches.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'البحث الأخير',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              GestureDetector(
                onTap: onClearAll,
                child: const Text(
                  'مسح الكل',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لزر مسح الكل
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: recentSearches.map((search) {
              return GestureDetector(
                onTap: () => onSelectSearch(search),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF838C91).withOpacity(0.1), // خلفية رمادية معتمدة ونظيفة لكروت البحث الأخير
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF838C91).withOpacity(0.2), // حدود رمادية خفيفة ومتناسقة
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.history,
                        size: 16,
                        color: Color(0xFF0E216C), // الكحلي الغامق للأيقونة لتعزيز الترابط البصري
                      ),
                      const SizedBox(width: 6),
                      Text(
                        search,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF000000), // الأسود الصريح للنصوص لضمان أعلى وضوح وقراءة
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}