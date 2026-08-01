import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للبانر الترويجي (60%)
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge, // لضمان قص أطراف الصورة المماسية لحافة البانر
        children: [
          // 1. النص على اليمين
          Positioned(
            right: 16,
            top: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // توسيط النص عمودياً
              children: const [
                Text(
                  'ابدأ رحلتك لتعلّم\nالقيادة بأمان',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF), // أبيض
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                  ),
                ),
                
              ],
            ),
          ),

          // 2. كارت الصورة كبير ولازق تماماً في القاع واليسار
          Positioned(
            left: 0,   // لازق في الشمال تماماً
            bottom: 0, // لازق في القاع تماماً
            child: Container(
              width: 155, // حجم كبير ومناسب
              height: 140, // ارتفاع كبير بيملا معظم البانر
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF), // أبيض
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), // انحناء خفيف من الأعلى للداخل
                  bottomLeft: Radius.circular(20), // يتبع انحناء البانر الخارجي
                ),
              ),
              padding: const EdgeInsets.only(top: 6, right: 6), // إطار أبيض من فوق واليمين بس
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                // --- التعديل هنا 👇: تم استخدام Image.network مع رابط صورة حقيقي ---
                child: Image.network(
                  'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?q=80&w=300&auto=format&fit=crop',
                  fit: BoxFit.cover, // بيخلي الصورة تملأ المساحة بدون ما تتبطط
                  // لو الصورة محملتش (مثلاً النت مقطوع)، هيعرض الأيقونة الرمادية كاحتياطي
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF838C91).withOpacity(0.15), // خلفية رمادية معتمدة كبديلة للصورة
                      child: const Icon(
                        Icons.image,
                        color: Color(0xFF0E216C), // الكحلي الغامق الأساسي للأيقونة
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}