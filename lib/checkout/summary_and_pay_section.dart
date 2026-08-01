import 'package:flutter/material.dart';

class SummaryAndPaySection extends StatelessWidget {
  const SummaryAndPaySection({super.key});

  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }

  // ويدجت لصفوف الأسعار
  Widget _buildPriceRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
