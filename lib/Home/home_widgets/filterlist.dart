import 'package:flutter/material.dart';

class FilterChipsList extends StatefulWidget {
  final Function(List<String> selectedFilters)? onFilterChanged;
  final VoidCallback? onFilterTap;

  const FilterChipsList({
    super.key,
    this.onFilterChanged,
    this.onFilterTap,
  });

  @override
  State<FilterChipsList> createState() => _FilterChipsListState();
}

class _FilterChipsListState extends State<FilterChipsList> {
  final Set<int> _selectedIndices = {};

  final List<Map<String, dynamic>> _filters = const [
    {'label': 'تصفية', 'icon': Icons.tune, 'isPrimary': true},
    {'label': 'الأقرب إليّ', 'icon': Icons.location_on_outlined, 'isPrimary': false},
    {'label': 'الأعلى تقييماً', 'icon': Icons.star_outline_rounded, 'isPrimary': false},
    {'label': 'الأقل سعراً', 'icon': Icons.attach_money_rounded, 'isPrimary': false},
    {'label': 'أوتوماتيك', 'icon': Icons.directions_car_outlined, 'isPrimary': false},
    {'label': 'مانيوال', 'icon': Icons.time_to_leave_outlined, 'isPrimary': false},
    {'label': 'مدربات فقط', 'icon': Icons.female_outlined, 'isPrimary': false},
    {'label': 'متاح اليوم', 'icon': Icons.event_available_outlined, 'isPrimary': false},
  ];

  void _handleTap(int index, bool isPrimary) {
    if (isPrimary) {
      widget.onFilterTap?.call();
      return;
    }

    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });

    if (widget.onFilterChanged != null) {
      final selectedLabels = _selectedIndices
          .map((i) => _filters[i]['label'] as String)
          .toList();
      widget.onFilterChanged!(selectedLabels);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: _filters.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isPrimary = filter['isPrimary'] as bool;
          final isSelected = _selectedIndices.contains(index);

          return GestureDetector(
            onTap: () => _handleTap(index, isPrimary),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isPrimary
                    ? const Color(0xFF0E216C) // الكحلي الغامق الأساسي
                    : (isSelected ? const Color(0xFF0E216C).withOpacity(0.1) : const Color(0xFFFFFFFF)), // الأبيض للخلفيات
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isPrimary
                      ? Colors.transparent
                      : (isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91).withOpacity(0.4)), // الرمادي المعتمد للحدود
                  width: isSelected ? 1.5 : 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    filter['icon'] as IconData,
                    size: 16,
                    color: isPrimary
                        ? const Color(0xFFFFFFFF)
                        : (isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91)), // الرمادي المعتمد للأيقونات غير النشطة
                  ),
                  const SizedBox(width: 6),
                  Text(
                    filter['label'] as String,
                    style: TextStyle(
                      color: isPrimary
                          ? const Color(0xFFFFFFFF)
                          : (isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91)), // الرمادي المعتمد للنصوص غير النشطة والتفاصيل
                      fontSize: 12,
                      fontWeight: isSelected || isPrimary ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}