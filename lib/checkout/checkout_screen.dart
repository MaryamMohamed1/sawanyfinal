import 'package:flutter/material.dart';
import 'package:sawany/checkout/Booking/bookingsscreen.dart';
import 'package:sawany/session_evaluation/session_evaluation_screen.dart';
import 'payment_method_section.dart';
import 'summary_and_pay_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color lightBg = Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    String dynamicPrice = "184.00 ج.م"; 

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightBg, 
        appBar: AppBar(
          backgroundColor: primaryNavy,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'إتمام الحجز',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 1. قسم طرق الدفع
              const PaymentMethodSection(),
              const SizedBox(height: 16),
              
              // 2. زرار تأكيد الدفع 
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم تأكيد الدفع بنجاح!', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const BookingsScreen()),
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('تأكيد الدفع', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                     
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 3. قسم تفاصيل الجلسة

              // 4. قسم ملخص الدفع
              const SummaryAndPaySection(),
              const SizedBox(height: 20),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}