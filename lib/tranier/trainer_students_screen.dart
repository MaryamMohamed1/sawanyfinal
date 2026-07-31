import 'package:flutter/material.dart';

class TrainerStudentsScreen extends StatefulWidget {
  const TrainerStudentsScreen({super.key});

  @override
  State<TrainerStudentsScreen> createState() => _TrainerStudentsScreenState();
}

class _TrainerStudentsScreenState extends State<TrainerStudentsScreen> {
  // الألوان الأساسية
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  // المتدرب المحدد حالياً (بيبدأ بأول واحد)
  int _selectedStudentIndex = 0;

  // بيانات وهمية للمتدربين
  final List<Map<String, dynamic>> students = [
    {
      'name': 'عمر محمد',
      'progress': 60,
      'image': 'https://i.pravatar.cc/150?img=11',
      'level': 'رخصة القيادة الخاصة - المرحلة المتوسطة',
    },
    {
      'name': 'لينا أحمد',
      'progress': 30,
      'image': 'https://i.pravatar.cc/150?img=5',
      'level': 'رخصة القيادة الخاصة - مرحلة المبتدئين',
    },
    {
      'name': 'سامي حسن',
      'progress': 15,
      'image': 'https://i.pravatar.cc/150?img=15',
      'level': 'رخصة القيادة الخاصة - أولى جلسات',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الهيدر
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('متابعة المتدربين', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryNavy)),
                SizedBox(height: 4),
                Text('لديك 3 متدربين نشطين اليوم', style: TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),

          // 2. قائمة المتدربين الحاليين (أفقي)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('المتدربين الحاليين', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy)),
                GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text('عرض الكل', style: TextStyle(fontSize: 12, color: primaryNavy, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios_rounded, size: 12, color: primaryNavy),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: students.length,
              itemBuilder: (context, index) {
                return _buildStudentCard(index);
              },
            ),
          ),

          const SizedBox(height: 20),

          // 3. تفاصيل المتدرب المحدد (خارطة الطريق والملاحظات)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSelectedStudentHeader(),
                const SizedBox(height: 24),
                const Text('خارطة الطريق التدريبية', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(height: 16),
                _buildRoadmap(),
                const SizedBox(height: 24),
                _buildTrainerNotes(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // كارت المتدرب في القائمة الأفقية
  Widget _buildStudentCard(int index) {
    final student = students[index];
    final isSelected = _selectedStudentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStudentIndex = index;
        });
      },
      child: Container(
        width: 240,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryNavy : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: primaryNavy.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFE6E9F4), borderRadius: BorderRadius.circular(20)),
                    child: const Text('نشط الآن', style: TextStyle(color: primaryNavy, fontSize: 10, fontWeight: FontWeight.bold)),
                  )
                else
                  const SizedBox(),
                CircleAvatar(radius: 20, backgroundImage: NetworkImage(student['image'])),
              ],
            ),
            const SizedBox(height: 8),
            Text(student['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: primaryNavy)),
            const SizedBox(height: 4),
            Text('خارطة الطريق: ${student['progress']}%', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 12),
            // شريط التقدم
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: student['progress'] / 100,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(isSelected ? primaryNavy : Colors.grey),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // هيدر تفاصيل المتدرب المختار
  Widget _buildSelectedStudentHeader() {
    final student = students[_selectedStudentIndex];
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(student['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryNavy)),
              const SizedBox(height: 4),
              Text(student['level'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryNavy,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          icon: const Icon(Icons.add, size: 16),
          label: const Text('حجز حصة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ),
      ],
    );
  }

  // خارطة الطريق (Roadmap)
  Widget _buildRoadmap() {
    return Column(
      children: [
        _buildRoadmapStep(
          title: 'الدروس النظرية واستخراج التصريح',
          description: 'تم إكمال جميع الدروس والاختبار النظري بنجاح.',
          status: 'completed',
          isLast: false,
        ),
        _buildRoadmapStep(
          title: 'التدريب على الركنات (الباركينج)',
          description: 'جاري العمل على مهارات الوقوف الموازي والعمودي.',
          status: 'in_progress',
          progressText: 'الجلسة 4 من 6',
          progressValue: 0.6,
          isLast: false,
        ),
        _buildRoadmapStep(
          title: 'القيادة في شوارع المدينة',
          description: 'لم يتم البدء بعد. يتطلب إكمال مرحلة المواقف أولاً.',
          status: 'pending',
          isLast: true,
        ),
      ],
    );
  }

  // خطوة واحدة في خارطة الطريق
  Widget _buildRoadmapStep({
    required String title,
    required String description,
    required String status,
    required bool isLast,
    String? progressText,
    double? progressValue,
  }) {
    Color dotColor;
    Color lineColor;
    Widget dotIcon;

    if (status == 'completed') {
      dotColor = Colors.green;
      lineColor = Colors.green;
      dotIcon = const Icon(Icons.check_circle, color: Colors.green, size: 24);
    } else if (status == 'in_progress') {
      dotColor = accentOrange;
      lineColor = Colors.grey.shade300;
      dotIcon = const CircleAvatar(radius: 12, backgroundColor: accentOrange, child: CircleAvatar(radius: 6, backgroundColor: Colors.white));
    } else {
      dotColor = Colors.grey.shade400;
      lineColor = Colors.transparent;
      dotIcon = CircleAvatar(radius: 12, backgroundColor: Colors.grey.shade300);
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الخط العمودي والنقطة
          Column(
            children: [
              dotIcon,
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: lineColor,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // محتوى الخطوة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: status == 'pending' ? Colors.grey : primaryNavy)),
                  const SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5)),
                  
                  if (status == 'completed')
  Container(
    margin: const EdgeInsets.only(top: 8), // تعديل هنا
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.green.shade50, 
      borderRadius: BorderRadius.circular(6),
    ),
    child: const Text(
      'مكتمل', 
      style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
    ),
  ),

if (status == 'in_progress')
  Container(
    margin: const EdgeInsets.only(top: 12), // تعديل هنا
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFFFFF7ED),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: accentOrange.withOpacity(0.3)),
    ),
    // ... باقي الـ child الخاص بالـ Container هنا
  
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('المستوى الحالي: جيد', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: primaryNavy)),
                              Text(progressText ?? '', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: const AlwaysStoppedAnimation<Color>(accentOrange),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ملاحظات المدرب
  Widget _buildTrainerNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('ملاحظات المدرب', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'أضف ملاحظاتك حول أداء المتدرب هنا...',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft, // الزرار على الشمال زي الصورة
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9E5400), // لون بني/برتقالي غامق زي الصورة
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: const Text('حفظ', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}