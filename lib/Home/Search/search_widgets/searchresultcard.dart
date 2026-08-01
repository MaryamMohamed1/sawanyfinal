import 'package:flutter/material.dart';

class SearchResultCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback? onDetailsTap;

  const SearchResultCard({
    super.key,
    required this.data,
    this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // الأبيض كخلفية أساسية للكارت
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF838C91).withOpacity(0.3), // الرمادي المعتمد للحدود
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المدرب/المدرسة
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 65,
                  height: 65,
                  color: const Color(0xFF838C91).withOpacity(0.1), // خلفية رمادية خفيفة ومصقولة
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF838C91), // الرمادي المعتمد للأيقونة
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // التفاصيل
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge متاح اليوم + الاسم
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data['name'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // الأسود الصريح لاسم المدرب أو المدرسة لضمان أعلى وضوح
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'متاح اليوم',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF15803D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // اسم المدرسة
                    Row(
                      children: [
                        const Icon(
                          Icons.school_outlined,
                          size: 14,
                          color: Color(0xFF838C91), // الرمادي المعتمد للأيقونات الفرعية
                        ),
                        const SizedBox(width: 4),
                        Text(
                          data['school'] ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF838C91), // الرمادي المعتمد للنصوص التفصيلية
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // المسافة
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: Color(0xFF838C91), // الرمادي المعتمد للأيقونات الفرعية
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${data['distance'] ?? '2.5'} كم',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF838C91), // الرمادي المعتمد للنصوص التفصيلية
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // زر التفاصيل
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDetailsTap ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي لزر التفاصيل
                foregroundColor: const Color(0xFFFFFFFF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Text(
                'التفاصيل',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}