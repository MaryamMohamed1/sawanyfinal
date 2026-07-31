import 'package:flutter/material.dart';

class RatingSection extends StatefulWidget {
  const RatingSection({super.key});

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  int _rating = 0;
  
  // 1. عرفنا الكنترولر هنا عشان نتحكم في النص
  final TextEditingController _commentController = TextEditingController();

  // بننظف الـ controller من الذاكرة لما الويدجت تتقفل عشان ميعملش تقل في الأبلكيشن
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
          const Text('كيف كانت جلستك؟', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('يا ريت تقيم أداء المدرب وجودة الجلسة.', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: index < _rating ? Colors.amber : Colors.grey.shade400,
                  size: 32,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),

          const Align(
            alignment: Alignment.centerRight,
            child: Text('إضافة تعليق (اختياري)', style: TextStyle(fontSize: 12)),
          ),
          const SizedBox(height: 8),
          
          // 2. ربطنا الـ TextField بالكنترولر هنا
          TextField(
            controller: _commentController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'اكتب ملاحظاتك هنا...',
              hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF8F9FB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0047BA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                // رسالة نجاح الإرسال
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إرسال التقييم، شكراً ليك!', textAlign: TextAlign.center),
                    backgroundColor: Colors.green,
                  ),
                );

                // 3. السطرين دول بيمسحوا الكلام ويرجعوا النجوم لصفر بعد الإرسال
                setState(() {
                  _commentController.clear(); // بيمسح الكلام اللي مكتوب
                  _rating = 0; // بيرجع النجوم كأنها متبدأتش (اختياري لو حابة)
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('إرسال التقييم', style: TextStyle(fontSize: 16, color: Colors.white)),
                  SizedBox(width: 8),
                  Icon(Icons.send, size: 18, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}