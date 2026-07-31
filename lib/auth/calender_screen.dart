import 'package:flutter/material.dart';
// تأكدي من تعديل مسار الاستيراد أدناه بناءً على مكان الملف الفعلي لديكِ
import 'booking_summary_screen.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  int selectedDay = 15;
  String selectedTime = "";

  final List<String> timeSlots = [
    "09:00 صباحًا",
    "10:00 صباحًا",
    "11:00 صباحًا",
    "12:00 مساءً",
    "02:00 مساءً",
    "03:00 مساءً",
    "04:00 مساءً",
    "05:00 مساءً",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E216C),
          elevation: 0,
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
            "حجز درس",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "المدرب",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF838C91).withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF838C91).withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E216C).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: Color(0xFF0E216C),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "أحمد منصوري",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 5),

                        const Text(
                          "مدرب قيادة",
                          style: TextStyle(
                            color: Color(0xFF838C91),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Color(0xFFFE8511),
                            ),
                            Text(
                              " 4.8",
                              style: TextStyle(color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                "اختر التاريخ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C),
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF838C91).withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF838C91).withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.chevron_right, color: Color(0xFF0E216C)),
                        Text(
                          "يوليو 2026",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0E216C),
                          ),
                        ),
                        Icon(Icons.chevron_left, color: Color(0xFF0E216C)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 31,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        int day = index + 1;
                        bool active = selectedDay == day;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = day;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: active
                                  ? const Color(0xFFFE8511)
                                  : const Color(0xFFF6F8FC),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: active
                                    ? const Color(0xFFFE8511)
                                    : const Color(0xFF838C91).withOpacity(0.2),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "$day",
                                style: TextStyle(
                                  color: active
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Text(
                "الأوقات المتاحة",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E216C),
                ),
              ),

              const SizedBox(height: 15),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: timeSlots.map((time) {
                  bool active = selectedTime == time;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                    child: Container(
                      width: 105,
                      height: 45,
                      decoration: BoxDecoration(
                        color: active
                            ? const Color(0xFFFE8511)
                            : const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: active
                              ? const Color(0xFFFE8511)
                              : const Color(0xFF838C91).withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          time,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: active
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى شاشة ملخص الحجز
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingSummaryScreen(),
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
                    "متابعة",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
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
}