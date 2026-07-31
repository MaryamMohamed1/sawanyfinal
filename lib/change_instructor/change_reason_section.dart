import 'package:flutter/material.dart';

class ChangeReasonSection extends StatefulWidget {
  const ChangeReasonSection({super.key});

  @override
  State<ChangeReasonSection> createState() => _ChangeReasonSectionState();
}

class _ChangeReasonSectionState extends State<ChangeReasonSection> {
  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  // 1: توافق الوقت, 2: أسلوب التدريب, 3: تغيير المركبة, 4: أخرى
  int _selectedReason = 1; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'سبب التبديل',
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: primaryNavy,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'يرجى اختيار السبب الرئيسي لرغبتك في تغيير المدرب لمساعدتنا في تحسين تجربتك.',
          style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
        ),
        const SizedBox(height: 16),
        
        // شبكة الأسباب 2x2
        Row(
          children: [
            Expanded(child: _buildReasonBox(1, 'توافق الوقت', Icons.access_time)),
            const SizedBox(width: 12),
            Expanded(child: _buildReasonBox(2, 'أسلوب التدريب', Icons.school_outlined)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildReasonBox(3, 'تغيير المركبة', Icons.directions_car_outlined)),
            const SizedBox(width: 12),
            Expanded(child: _buildReasonBox(4, 'أخرى', Icons.more_horiz)),
          ],
        ),
      ],
    );
  }

  Widget _buildReasonBox(int value, String title, IconData icon) {
    bool isSelected = _selectedReason == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedReason = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? accentOrange.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? accentOrange : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon, 
              color: isSelected ? accentOrange : Colors.grey.shade700, 
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? primaryNavy : Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}