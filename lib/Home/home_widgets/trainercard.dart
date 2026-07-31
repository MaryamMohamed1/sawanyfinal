import 'package:flutter/material.dart';

class TrainerCard extends StatelessWidget {
  final VoidCallback? onBookTap;

  const TrainerCard({super.key, this.onBookTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // الأبيض كخلفية رئيسية للكارت
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), // الرمادي المعتمد للحدود
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الصورة الشخصية للمدرب
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 75,
              height: 75,
              color: const Color(0xFF838C91).withOpacity(0.15), // خلفية رمادية معتمدة كبديلة للصورة
              child: Image.asset(
                'assets/images/trainer.png', // استبدليها بمسار صورة المدرب
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.person,
                  size: 40,
                  color: Color(0xFF838C91), // الرمادي المعتمد للأيقونة
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 2. تفاصيل المدرب (اسم، سيارة، مسافة، وسعر)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الاسم + التقييم
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'كابتن محمد علي',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000), // الأسود الصريح للعناوين الرئيسية
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          '(120)',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF838C91), // الرمادي المعتمد للمراجعات
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // الأسود الصريح لرقم التقييم
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Color(0xFFFE8511), // البرتقالي التفاعلي المعتمد للنجوم
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // نوع السيارة
                Row(
                  children: [
                    const Icon(Icons.directions_car_outlined, size: 14, color: Color(0xFF838C91)), // الرمادي المعتمد
                    const SizedBox(width: 4),
                    const Text(
                      'هيونداي إلنترا - مانيوال',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF838C91), // الرمادي المعتمد للنصوص التفصيلية الثانوية
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),

                // المسافة
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF838C91)), // الرمادي المعتمد
                    const SizedBox(width: 4),
                    const Text(
                      'تبعد 2.5 كم عنك',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF838C91), // الرمادي المعتمد للمسافة
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // السعر + زر احجز الآن
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onBookTap ?? () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي لزر الحجز (60%)
                        foregroundColor: const Color(0xFFFFFFFF), // الأبيض للنص داخل الزر
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'احجز الآن',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '300 ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0E216C), // الكحلي الغامق الأساسي لرقم السعر البارز
                            ),
                          ),
                          TextSpan(
                            text: 'ج.م/ساعة',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF838C91), // الرمادي المعتمد لوحدة السعر
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}