import 'package:flutter/material.dart';

class DetailsAndUploadSection extends StatefulWidget {
  const DetailsAndUploadSection({super.key});

  @override
  State<DetailsAndUploadSection> createState() => _DetailsAndUploadSectionState();
}

class _DetailsAndUploadSectionState extends State<DetailsAndUploadSection> {
  final TextEditingController _detailsController = TextEditingController();

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'صف المشكلة بالتفصيل',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _detailsController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'الرجاء تقديم أكبر قدر ممكن من التفاصيل لمساعدتنا في فهم المشكلة...',
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey, height: 1.5),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF0047BA)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'إرفاق صور (اختياري)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        
        // بوكس رفع الصور داشد (Dotted/Dashed border محاكي)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FBFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue.shade100, style: BorderStyle.solid), // يمكنك استخدام حزم للـ dashed إن لزم
          ),
          child: Column(
            children: [
              Icon(Icons.add_photo_alternate_outlined, size: 40, color: Colors.grey.shade600),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('اضغط لرفع صورة ', style: TextStyle(color: Color(0xFF0047BA), fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('أو اسحب وأفلت هنا', style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 4),
              Text('حتى 10MB من نوع PNG, JPG, GIF', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // زرار إرسال التقرير
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0047BA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم إرسال بلاغك بنجاح وجاري المراجعة!', textAlign: TextAlign.center),
                  backgroundColor: Colors.green,
                ),
              );
              setState(() {
                _detailsController.clear();
              });
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('إرسال التقرير', style: TextStyle(fontSize: 16, color: Colors.white)),
                SizedBox(width: 8),
                Icon(Icons.send, size: 18, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}