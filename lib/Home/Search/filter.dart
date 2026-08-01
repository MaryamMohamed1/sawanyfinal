import 'package:flutter/material.dart';
import 'filter_widgets/distancesection.dart';
import 'filter_widgets/pricesection.dart';
import 'filter_widgets/ratingsection.dart';
import 'filter_widgets/filteroptionssection.dart';
import 'filter_widgets/filteractions.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double _distance = 25;
  final TextEditingController _minPriceController = TextEditingController(text: '50');
  final TextEditingController _maxPriceController = TextEditingController(text: '500');
  String _selectedRating = '4+';
  String _carType = 'automatic';
  bool _isMaleTrainer = true;
  bool _isFemaleTrainer = true;

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _resetFilters() {
    setState(() {
      _distance = 25;
      _minPriceController.text = '50';
      _maxPriceController.text = '500';
      _selectedRating = '4+';
      _carType = 'automatic';
      _isMaleTrainer = true;
      _isFemaleTrainer = true;
    });
  }

  // إرجاع القيم المحددة لشاشة البحث
  void _applyFilters() {
    Navigator.pop(context, {
      'distance': _distance,
      'minPrice': double.tryParse(_minPriceController.text) ?? 0,
      'maxPrice': double.tryParse(_maxPriceController.text) ?? 0,
      'rating': _selectedRating,
      'carType': _carType,
      'isMaleTrainer': _isMaleTrainer,
      'isFemaleTrainer': _isFemaleTrainer,
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sheetHeight = MediaQuery.of(context).size.height * 0.85;

    return Container(
      height: sheetHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF), // الأبيض الصافي كخلفية رئيسية للـ BottomSheet
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // السحاب العلوي (Handle)
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF838C91).withOpacity(0.4), // الرمادي المعتمد للمؤشر العلوي
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // الهيدر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF838C91), // الرمادي المعتمد لأيقونة الإغلاق
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'تصفية النتائج',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), // الأسود الصريح لعنوان النافذة لضمان أعلى وضوح
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
            const Divider(
              height: 20,
              color: Color(0xFF838C91), // الرمادي المعتمد للفاصل
              thickness: 0.2,
            ),

            // الأقسام الفرعية داخل ListView لتسهيل التمرير
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  DistanceSection(
                    distance: _distance,
                    onChanged: (val) => setState(() => _distance = val),
                  ),
                  const SizedBox(height: 20),

                  PriceSection(
                    minPriceController: _minPriceController,
                    maxPriceController: _maxPriceController,
                  ),
                  const SizedBox(height: 20),

                  RatingSection(
                    selectedRating: _selectedRating,
                    onRatingSelected: (val) => setState(() => _selectedRating = val),
                  ),
                  const SizedBox(height: 20),

                  FilterOptionsSection(
                    carType: _carType,
                    isMaleTrainer: _isMaleTrainer,
                    isFemaleTrainer: _isFemaleTrainer,
                    onCarTypeChanged: (val) => setState(() => _carType = val!),
                    onMaleTrainerChanged: (val) => setState(() => _isMaleTrainer = val!),
                    onFemaleTrainerChanged: (val) => setState(() => _isFemaleTrainer = val!),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // أزرار التحكم
            FilterActions(
              onApply: _applyFilters,
              onReset: _resetFilters,
            ),
          ],
        ),
      ),
    );
  }
}