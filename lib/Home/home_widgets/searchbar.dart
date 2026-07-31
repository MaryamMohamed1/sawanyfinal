import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // الأبيض (الخلفية الرئيسية للبحث)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF838C91).withOpacity(0.3), // الرمادي المعتمد للحدود
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF000000), // الأسود الصريح للنص المكتوب لضمان أعلى قراءة واضحة
        ),
        decoration: InputDecoration(
          hintText: 'ابحث عن مدرب أو مدرسة قيادة...',
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Color(0xFF838C91), // الرمادي المعتمد لنص التلميح (Hint)
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xFF0E216C), // الكحلي الغامق الأساسي (60%) لأيقونة البحث
            size: 22,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}