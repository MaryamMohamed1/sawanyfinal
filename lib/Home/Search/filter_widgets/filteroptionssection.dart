import 'package:flutter/material.dart';

class FilterOptionsSection extends StatelessWidget {
  final String carType;
  final bool isMaleTrainer;
  final bool isFemaleTrainer;
  final ValueChanged<String?> onCarTypeChanged;
  final ValueChanged<bool?> onMaleTrainerChanged;
  final ValueChanged<bool?> onFemaleTrainerChanged;

  const FilterOptionsSection({
    super.key,
    required this.carType,
    required this.isMaleTrainer,
    required this.isFemaleTrainer,
    required this.onCarTypeChanged,
    required this.onMaleTrainerChanged,
    required this.onFemaleTrainerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // نوع السيارة (يمين)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'نوع السيارة',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Radio<String>(
                    value: 'automatic',
                    groupValue: carType,
                    activeColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للعنصر النشط
                    onChanged: onCarTypeChanged,
                  ),
                  const Text(
                    'أوتوماتيك',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF000000), // الأسود الصريح للنصوص
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'manual',
                    groupValue: carType,
                    activeColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للعنصر النشط
                    onChanged: onCarTypeChanged,
                  ),
                  const Text(
                    'مانيوال',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF000000), // الأسود الصريح للنصوص
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // نوع المدرب (يسار)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'نوع المدرب',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: isMaleTrainer,
                    activeColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للعنصر النشط
                    onChanged: onMaleTrainerChanged,
                  ),
                  const Text(
                    'مدرب',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF000000), // الأسود الصريح للنصوص
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isFemaleTrainer,
                    activeColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للعنصر النشط
                    onChanged: onFemaleTrainerChanged,
                  ),
                  const Text(
                    'مدربة',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF000000), // الأسود الصريح للنصوص
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}