import 'package:flutter/material.dart';

class PerformanceNotesSection extends StatelessWidget {
  const PerformanceNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ملاحظات الأداء', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              Icon(Icons.verified_outlined, color: Color(0xFF0047BA)),
            ],
          ),
          const SizedBox(height: 16),
          _buildPerformanceItem(
            color: Colors.green,
            title: 'التحكم في المركبة',
            desc: 'تحكم ممتاز في الدريكسيون وسلاسة في استخدام الفرامل.',
            icon: Icons.check_circle_outline,
          ),
          const SizedBox(height: 12),
          _buildPerformanceItem(
            color: Colors.green,
            title: 'الانتباه المروري',
            desc: 'تفاعل جيد مع الإشارات المرورية والمشاة.',
            icon: Icons.check_circle_outline,
          ),
          const SizedBox(height: 12),
          _buildPerformanceItem(
            color: Colors.red,
            title: 'نقاط للتحسين',
            desc: 'محتاج تركيز أكتر وأنت بتنقل من حارة لحارة وتستخدم المرايات دايماً.',
            icon: Icons.info_outline,
            isWarning: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceItem({
    required Color color,
    required String title,
    required String desc,
    required IconData icon,
    bool isWarning = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isWarning ? Colors.red.shade50 : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: isWarning ? Border.all(color: Colors.red.shade100) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isWarning ? Colors.red.shade900 : Colors.black)),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(icon, color: color),
        ],
      ),
    );
  }
}