import 'package:flutter/material.dart';

class ProblemTypeSection extends StatefulWidget {
  const ProblemTypeSection({super.key});

  @override
  State<ProblemTypeSection> createState() => _ProblemTypeSectionState();
}

class _ProblemTypeSectionState extends State<ProblemTypeSection> {
  // 1: مشكلة في الجلسة، 2: مشكلة تقنية، 3: خلاف مالي، 4: أخرى
  int _selectedType = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'نوع المشكلة',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildTypeItem(1, 'مشكلة في الجلسة', Icons.calendar_today_outlined),
        const SizedBox(height: 10),
        _buildTypeItem(2, 'مشكلة تقنية', Icons.bug_report_outlined),
        const SizedBox(height: 10),
        _buildTypeItem(3, 'خلاف مالي', Icons.account_balance_wallet_outlined),
        const SizedBox(height: 10),
        _buildTypeItem(4, 'أخرى', Icons.more_horiz_outlined),
      ],
    );
  }

  Widget _buildTypeItem(int value, String title, IconData icon) {
    bool isSelected = _selectedType == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedType = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8FBFF) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF0047BA) : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD3E3F8) : Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFF0047BA), size: 20),
            ),
          ],
        ),
      ),
    );
  }
}