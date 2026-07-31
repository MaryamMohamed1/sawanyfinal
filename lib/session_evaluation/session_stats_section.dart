import 'package:flutter/material.dart';

class SessionStatsSection extends StatelessWidget {
  const SessionStatsSection({super.key});

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
          _buildStatRow(Icons.access_time, 'المدة', '45 دقيقة'),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildStatRow(Icons.speed, 'المسافة', '12.5 كم'),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildStatRow(Icons.calendar_today, 'التاريخ', '23 يوليو 2026'),
        ],
      ),
    );
  }

  Widget _buildStatRow(IconData icon, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue.shade700),
        ),
      ],
    );
  }
}