import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  const PriceSection({
    super.key,
    required this.minPriceController,
    required this.maxPriceController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'السعر (ج.م/ساعة)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildPriceInput('الحد الأدنى', minPriceController),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildPriceInput('الحد الأعلى', maxPriceController),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceInput(String label, TextEditingController controller) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), // الأبيض كخلفية لحقل الإدخال
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000), // الأسود الصريح للنص المدخل لضمان أعلى وضوح
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 12,
          child: Container(
            color: const Color(0xFFFFFFFF), // الأبيض لخلفية التسمية المتداخلة مع الإطار
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF838C91), // الرمادي المعتمد لتسميات الحقول والتفاصيل الثانوية
              ),
            ),
          ),
        ),
      ],
    );
  }
}