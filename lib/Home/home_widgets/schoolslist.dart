import 'package:flutter/material.dart';

class SchoolsList extends StatelessWidget {
  const SchoolsList({super.key});

  // تم استبدال الأيقونات بروابط لصور حقيقية 📸
  final List<Map<String, dynamic>> _schools = const [
    {
      'title': 'مدرسة النجوم',
      'rating': '4.9',
      'reviews': '(+200)',
      'image': 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'أكاديمية الطريق الأفضل',
      'rating': '4.7',
      'reviews': '(+150)',
      'image': 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'ثقة لتعليم القيادة',
      'rating': '4.5',
      'reviews': '(+90)',
      'image': 'https://images.unsplash.com/photo-1463171515643-952cee54d42a?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'مدرسة التميز المعتمدة',
      'rating': '4.8',
      'reviews': '(+180)',
      'image': 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'أكاديمية القيادة الآمنة',
      'rating': '4.6',
      'reviews': '(+110)',
      'image': 'https://images.unsplash.com/photo-1600320254374-ce2d293c324e?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'مدرسة السرعة المثالية',
      'rating': '4.4',
      'reviews': '(+75)',
      'image': 'https://images.unsplash.com/photo-1502877338535-766e1452684a?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'الأكاديمية الحديثة للمرور',
      'rating': '4.7',
      'reviews': '(+130)',
      'image': 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?auto=format&fit=crop&q=80&w=300',
    },
    {
      'title': 'مدرسة التوجيه الذكي',
      'rating': '4.3',
      'reviews': '(+60)',
      'image': 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?auto=format&fit=crop&q=80&w=300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: _schools.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final school = _schools[index];

          return Container(
            width: 135,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3)), 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // مربع الصورة (تم استخدام ClipRRect عشان يقص الصورة بشكل دائري)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    school['image'] as String,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover, // بيخلي الصورة تملأ المساحة بدون ما تتبطط
                    // لو الصورة محملتش لسبب ما، هيعرض الأيقونة دي كبديل
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        color: const Color(0xFF0E216C).withOpacity(0.08),
                        child: const Icon(
                          Icons.school_rounded,
                          size: 40,
                          color: Color(0xFF0E216C),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),

                // الاسم
                Text(
                  school['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000), 
                  ),
                ),
                const SizedBox(height: 4),

                // التقييم
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      school['reviews'] as String,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF838C91), 
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      school['rating'] as String,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000), 
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: Color(0xFFFE8511), 
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}