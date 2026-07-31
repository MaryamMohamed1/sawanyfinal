import 'package:flutter/material.dart';
// تأكدي من تعديل مسار الاستيراد أدناه بناءً على مكان ملف checkout_screen.dart لديكِ
import '../checkout/checkout_screen.dart';

class BookingSummaryScreen extends StatefulWidget {
  const BookingSummaryScreen({super.key});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E216C),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFFFFFF),
            ),
          ),
          title: const Text(
            "ملخص الحجز",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "تفاصيل الحجز",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  minHeight: 240,
                ),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF838C91).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "🚗 درس قيادة - ناقل حركة يدوي",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),

                    SizedBox(height: 18),

                    Text(
                      "👤 المدرب: الكابتن أحمد علي",
                      style: TextStyle(fontSize: 16, color: Color(0xFF838C91)),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "📅 التاريخ: الإثنين 14 أكتوبر",
                      style: TextStyle(fontSize: 16, color: Color(0xFF838C91)),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "⏰ الوقت: ٤:٠٠ مساءً - ٥:٠٠ مساءً",
                      style: TextStyle(fontSize: 16, color: Color(0xFF838C91)),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "📍 الفرع: مدينة نصر",
                      style: TextStyle(fontSize: 16, color: Color(0xFF838C91)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

            

             

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى شاشة الدفع CheckoutScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFE8511),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "الانتقال للدفع",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget priceRow(
    String title,
    String value, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xFF000000),
              fontWeight:
                  bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: const Color(0xFF0E216C),
              fontSize: 16,
              fontWeight:
                  bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}