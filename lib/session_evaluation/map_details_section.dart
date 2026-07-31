import 'package:flutter/material.dart';

class MapDetailsSection extends StatelessWidget {
  const MapDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(Icons.map, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نقطة الانطلاق', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('ميدان الحصري', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.swap_calls, color: Colors.blue.shade700),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('الوجهة', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text('مول العرب', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}