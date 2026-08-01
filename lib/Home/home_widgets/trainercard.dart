import 'package:flutter/material.dart';

class TrainerCard extends StatelessWidget {
  final VoidCallback? onBookTap;

  const TrainerCard({super.key, this.onBookTap});

  // 📝 لستة البيانات الـ 7 كباتن (صور حقيقية للأولاد والبنات) بالظبط زي لستة المدارس 👇
  final List<Map<String, dynamic>> _trainers = const [
    {
      'name': 'كابتن محمد علي',
      'avatar': 'https://images.unsplash.com/photo-1590086782957-93c06ef21604?auto=format&fit=crop&q=80&w=200',
      'car': 'هيونداي إلنترا - مانيوال',
      'rating': '4.8',
      'reviews': '(120)',
      'distance': 'تبعد 2.5 كم عنك',
      'price': '300',
    },
    {
      'name': 'كابتن رنا يوسف',
      'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=200',
      'car': 'تويوتا كورولا - أوتوماتيك',
      'rating': '4.9',
      'reviews': '(150)',
      'distance': 'تبعد 1.8 كم عنك',
      'price': '350',
    },
    {
      'name': 'كابتن أحمد حسن',
      'avatar': 'https://images.unsplash.com/photo-1582233479366-6d38bc390a08?auto=format&fit=crop&q=80&w=200',
      'car': 'كيا سيراتو - أوتوماتيك',
      'rating': '4.7',
      'reviews': '(95)',
      'distance': 'تبعد 3.1 كم عنك',
      'price': '320',
    },
    {
      'name': 'كابتن مها السعيد',
      'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=200',
      'car': 'نيسان صني - مانيوال',
      'rating': '4.6',
      'reviews': '(110)',
      'distance': 'تبعد 2.0 كم عنك',
      'price': '280',
    },
    {
      'name': 'كابتن خالد عمر',
      'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=200',
      'car': 'رينو لوجان - أوتوماتيك',
      'rating': '4.5',
      'reviews': '(80)',
      'distance': 'تبعد 4.2 كم عنك',
      'price': '290',
    },
    {
      'name': 'كابتن هبة محمود',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=200',
      'car': 'ميتسوبيشي لانسر - أوتوماتيك',
      'rating': '4.8',
      'reviews': '(135)',
      'distance': 'تبعد 1.5 كم عنك',
      'price': '330',
    },
    {
      'name': 'كابتن يوسف أحمد',
      'avatar': 'https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=200',
      'car': 'تويوتا يارس - مانيوال',
      'rating': '4.7',
      'reviews': '(90)',
      'distance': 'تبعد 2.8 كم عنك',
      'price': '310',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // استخدمنا ListView.separated مكرر بناءً على الـ 7 كباتن اللي فوق ليعرض اليو آي بالكامل
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // عشان التمرير ميتعارضش مع الشاشة الرئيسية
      itemCount: _trainers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final trainer = _trainers[index];

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)),
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
              // 1. الصورة الشخصية للمدرب (بنات وأولاد حقيقية)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 75,
                  height: 75,
                  color: const Color(0xFF838C91).withOpacity(0.15),
                  child: Image.network(
                    trainer['avatar'] as String,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter, // عشان الوش يظهر مظبوط في الأفتار
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF838C91),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // 2. تفاصيل المدرب
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الاسم + التقييم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trainer['name'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              trainer['reviews'] as String,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF838C91),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              trainer['rating'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: Color(0xFFFE8511),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // نوع السيارة
                    Row(
                      children: [
                        const Icon(Icons.directions_car_outlined, size: 14, color: Color(0xFF838C91)),
                        const SizedBox(width: 4),
                        Text(
                          trainer['car'] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF838C91),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),

                    // المسافة
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF838C91)),
                        const SizedBox(width: 4),
                        Text(
                          trainer['distance'] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF838C91),
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
                            backgroundColor: const Color(0xFF0E216C),
                            foregroundColor: const Color(0xFFFFFFFF),
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
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${trainer['price']} ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0E216C),
                            ),
                          ),
                          const TextSpan(
                            text: 'ج.م/ساعة',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF838C91),
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
  },
);
  }
}