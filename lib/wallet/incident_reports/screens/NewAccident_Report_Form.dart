import 'package:flutter/material.dart';

class NewAccidentReportScreen extends StatefulWidget {
  const NewAccidentReportScreen({super.key});

  @override
  State<NewAccidentReportScreen> createState() => _NewAccidentReportScreenState();
}

class _NewAccidentReportScreenState extends State<NewAccidentReportScreen> {
  // الثوابت اللونية للمنصة
  static const Color primaryBlue = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color customGray = Color(0xFF838C91);
  static const Color cardBorderColor = Color(0xFFE5E7EB);

  final _formKey = GlobalKey<FormState>();
  
  // حقول البيانات
  String? _selectedIncidentType;
  String? _selectedInstructor;
  String? _selectedSeverity = 'متوسط';
  final TextEditingController _dateController = TextEditingController(text: '2026/07/29');
  final TextEditingController _locationController = TextEditingController(text: 'شارع الطيران - مدينة نصر - القاهرة');
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _incidentTypes = [
    'تصادم خفيف (حتة فنية بسيطة)',
    'عطل فني مفاجئ بالسيارة',
    'حادث مروري يستدعي المرور',
    'ظرف طارئ آخر'
  ];

  final List<String> _instructors = [
    'الكابتن أحمد محمود',
    'الكابتن محمد إبراهيم',
    'الكابتن محمود سعيد'
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        // الأب بار باللون الأزرق الكحلي الأساسي
        appBar: AppBar(
          backgroundColor: primaryBlue,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'إنشاء بلاغ حادث جديد',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تنبيه توضيحي
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: accentOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: accentOrange.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline, color: accentOrange, size: 22),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'يرجى إدخال تفاصيل الحادث بدقة لسرعة استجابة الدعم الفني وطاقم المتابعة.',
                          style: TextStyle(fontSize: 12, color: primaryBlue, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 1. نوع الحادث
                const Text('نوع الحادث / المشكلة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedIncidentType,
                  hint: const Text('اختر نوع الحادث', style: TextStyle(color: customGray, fontSize: 13)),
                  decoration: _inputDecoration(Icons.report_problem_outlined),
                  items: _incidentTypes.map((type) {
                    return DropdownMenuItem(value: type, child: Text(type, style: const TextStyle(fontSize: 13, color: primaryBlue)));
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedIncidentType = val),
                ),
                const SizedBox(height: 16),

                // 2. المدرب المرتبط
                const Text('المدرب المسؤول', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedInstructor,
                  hint: const Text('اختر اسم المدرب', style: TextStyle(color: customGray, fontSize: 13)),
                  decoration: _inputDecoration(Icons.person_outline),
                  items: _instructors.map((instructor) {
                    return DropdownMenuItem(value: instructor, child: Text(instructor, style: const TextStyle(fontSize: 13, color: primaryBlue)));
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedInstructor = val),
                ),
                const SizedBox(height: 16),

                // 3. التاريخ والوقت
                const Text('تاريخ ووقت الواقعة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _dateController,
                  decoration: _inputDecoration(Icons.calendar_today_outlined),
                  style: const TextStyle(fontSize: 13, color: primaryBlue),
                ),
                const SizedBox(height: 16),

                // 4. الموقع
                const Text('موقع الحادث', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _locationController,
                  decoration: _inputDecoration(Icons.location_on_outlined),
                  style: const TextStyle(fontSize: 13, color: primaryBlue),
                ),
                const SizedBox(height: 16),

                // 5. مستوى الخطورة (اختيار عبر شارات)
                const Text('مستوى الخطورة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                Row(
                  children: ['منخفض', 'متوسط', 'مرتفع'].map((level) {
                    bool isSelected = _selectedSeverity == level;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: InkWell(
                          onTap: () => setState(() => _selectedSeverity = level),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? accentOrange : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: isSelected ? accentOrange : cardBorderColor),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              level,
                              style: TextStyle(
                                color: isSelected ? Colors.white : customGray,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // 6. وصف تفصيلي
                const Text('تفاصيل إضافية عن الحادث', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryBlue)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: _inputDecoration(Icons.description_outlined).copyWith(
                    hintText: 'اكتب باختصار ما حدث وأضرار السيارة إن وجدت...',
                  ),
                  style: const TextStyle(fontSize: 13, color: primaryBlue),
                ),
                const SizedBox(height: 24),

                // زر الإرسال الرئيسي (برتقالي مميز - CTA)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentOrange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم إرسال البلاغ بنجاح', style: TextStyle(fontFamily: 'Cairo'))),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'إرسال البلاغ',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon, color: primaryBlue, size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: cardBorderColor)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: cardBorderColor)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: primaryBlue, width: 1.5)),
    );
  }
}