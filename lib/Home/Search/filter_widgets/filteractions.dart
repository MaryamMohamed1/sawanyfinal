import 'package:flutter/material.dart';

class FilterActions extends StatelessWidget {
  final VoidCallback onApply;
  final VoidCallback onReset;

  const FilterActions({
    super.key,
    required this.onApply,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // زر تطبيق (الكحلي الغامق - عريض)
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed: onApply,
            icon: const Icon(Icons.check, color: Colors.white, size: 18),
            label: const Text(
              'تطبيق',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي لزر التطبيق
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // زر إعادة ضبط (المُفرّغ)
        Expanded(
          flex: 1,
          child: OutlinedButton.icon(
            onPressed: onReset,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color(0xFF0E216C), // الكحلي الغامق للأيقونة
              size: 18,
            ),
            label: const Text(
              'إعادة ضبط',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0E216C), // الكحلي الغامق للنص
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF0E216C)), // الكحلي الغامق للحدود
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}