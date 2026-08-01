import 'package:flutter/material.dart';

class SearchAppBarSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onFilterTap;

  const SearchAppBarSection({
    super.key,
    required this.controller,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar العلوي مع سهم الرجوع
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // زرار الرجوع للشاشة الرئيسية
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF0E216C)), // الكحلي الغامق الأساسي
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'مدرسة القيادة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لعنوان الشاشة البارز
                ),
              ),
              // القائمة / المنيو
              IconButton(
                icon: const Icon(Icons.menu_rounded, color: Color(0xFF000000)), // الأسود الصريح للأيقونة الرئيسية
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // TextField البحث مع زر الفلتر
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF838C91).withOpacity(0.1), // خلفية رمادية معتمدة ونظيفة لحقل البحث
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFF838C91).withOpacity(0.2), // حدود رمادية خفيفة ومتناسقة
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Color(0xFF838C91), // الرمادي المعتمد لأيقونة البحث
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'ابحث عن مدرب أو مدرسة',
                      hintStyle: TextStyle(
                        color: Color(0xFF838C91), // الرمادي المعتمد للنص التوجيهي
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000), // الأسود الصريح للنص المدخل لضمان أعلى وضوح
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // فصل أيقونة الفلتر في GestureDetector صريح
                InkWell(
                  onTap: onFilterTap,
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لأيقونة الفلتر التفاعلية
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}