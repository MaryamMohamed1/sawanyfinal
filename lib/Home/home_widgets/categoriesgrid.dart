import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  final Function(int index)? onCategorySelected;

  const CategoriesSection({
    super.key,
    this.onCategorySelected,
  });

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int _selectedIndex = 1; // جعل "المدربون" هو المحدد افتراضياً

  final List<Map<String, dynamic>> _categories = const [
    {
      'title': 'مدارس القيادة',
      'icon': Icons.school_outlined,
    },
    {
      'title': 'المدربون',
      'icon': Icons.directions_car_outlined,
    },
    {
      'title': 'مدربات سيدات',
      'icon': Icons.female_outlined,
    },
    {
      'title': 'أوتوماتيك',
      'icon': Icons.accessibility_new_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_categories.length, (index) {
        final category = _categories[index];
        final isSelected = _selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            if (widget.onCategorySelected != null) {
              widget.onCategorySelected!(index);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. حاوية الأيقونة (مربعة زواياها ناعمة جداً أقرب للدائرة)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF0E216C).withOpacity(0.12) // كحلي غامق فاتح جداً للعنصر المحدد (متناسق مع الهوية)
                      : const Color(0xFF838C91).withOpacity(0.1), // رمادي فاتح للباقي مأخوذ من الدليل
                  borderRadius: BorderRadius.circular(24), 
                ),
                child: Icon(
                  category['icon'] as IconData,
                  size: 28,
                  color: isSelected 
                      ? const Color(0xFF0E216C) // الكحلي الأساسي للعنصر المحدد
                      : const Color(0xFF838C91), // الرمادي المعتمد للأيقونات غير النشطة
                ),
              ),
              const SizedBox(height: 8),

              // 2. اسم القسم
              Text(
                category['title'] as String,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected 
                      ? const Color(0xFF000000) // الأسود الصريح للنصوص الرئيسية الواضحة
                      : const Color(0xFF838C91), // الرمادي المعتمد للنصوص غير النشطة والتفاصيل
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}