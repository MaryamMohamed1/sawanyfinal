import 'package:flutter/material.dart';

class TrainerSchedule extends StatelessWidget {
  const TrainerSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المواعيد المتاحة',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح لعنوان القسم لضمان أعلى وضوح
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            _buildDateCard('الأحد', '14', 'مايو', isSelected: true),
            const SizedBox(width: 8),
            _buildDateCard('الإثنين', '15', 'مايو'),
            const SizedBox(width: 8),
            _buildDateCard('الثلاثاء', '16', 'مايو'),
            const SizedBox(width: 8),
            _buildDateCard('الأربعاء', '17', 'مايو'),
          ],
        ),
      ],
    );
  }

  Widget _buildDateCard(String day, String date, String month, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91).withOpacity(0.08), // الكحلي الغامق الأساسي عند التحديد، وخلفية رمادية خفيفة ومصقولة للحالات العادية
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFF0E216C) : const Color(0xFF838C91).withOpacity(0.2), // حدود رمادية متناسقة للحالات غير المحددة
          ),
        ),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? const Color(0xFFFFFFFF).withOpacity(0.8) : const Color(0xFF838C91), // الرمادي المعتمد ليوم الأسبوع غير المحدد
              ),
            ),
            const SizedBox(height: 2),
            Text(
              date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? const Color(0xFFFFFFFF) : const Color(0xFF000000), // الأسود الصريح لرقم التاريخ غير المحدد لضمان أعلى وضوح
              ),
            ),
            Text(
              month,
              style: TextStyle(
                fontSize: 9,
                color: isSelected ? const Color(0xFFFFFFFF).withOpacity(0.8) : const Color(0xFF838C91), // الرمادي المعتمد لشهر غير المحدد
              ),
            ),
          ],
        ),
      ),
    );
  }
}