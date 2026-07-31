import 'package:flutter/material.dart';

class SuggestedInstructorsSection extends StatefulWidget {
  const SuggestedInstructorsSection({super.key});

  @override
  State<SuggestedInstructorsSection> createState() => _SuggestedInstructorsSectionState();
}

class _SuggestedInstructorsSectionState extends State<SuggestedInstructorsSection> {
  // ثوابت ألوان هوية منصة "سوقني"
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  // متغير عشان نعرف مين المدرب اللي تم اختياره
  int? _selectedInstructor; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'مدربون مقترحون',
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: primaryNavy,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 12, color: primaryNavy),
                  SizedBox(width: 4),
                  Text(
                    'عرض الكل', 
                    style: TextStyle(
                      color: primaryNavy, 
                      fontSize: 12, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // الكابتن سارة كمال
        _buildInstructorCard(
          id: 1,
          name: 'سارة كمال',
          rating: '4.9',
          carType: 'أوتوماتيك',
        ),
        const SizedBox(height: 12),
        
        // الكابتن خالد عمر
        _buildInstructorCard(
          id: 2,
          name: 'خالد عمر',
          rating: '4.7',
          carType: 'عادي',
        ),
      ],
    );
  }

  Widget _buildInstructorCard({required int id, required String name, required String rating, required String carType}) {
    bool isSelected = _selectedInstructor == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedInstructor = id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? accentOrange.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? accentOrange : Colors.grey.shade200,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), 
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name, 
                    style: const TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: accentOrange, size: 14),
                      const SizedBox(width: 4),
                      Text(rating, style: const TextStyle(fontSize: 12, color: Colors.black87)),
                      const SizedBox(width: 8),
                      const Text('•', style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 8),
                      const Icon(Icons.directions_car_outlined, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(carType, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? accentOrange : Colors.grey.shade300,
                ),
                color: isSelected ? accentOrange : Colors.white,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.add,
                size: 16,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}