import 'package:flutter/material.dart';

class BookingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar( 
      // تم التحديث إلى الكحلي الغامق الخاص بمنصة "سوقني" (#0E216C)
      backgroundColor: const Color(0xFF0E216C),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // أيقونة التنبيهات
            Icon(Icons.notifications_none_rounded, color: Colors.white, size: 26),
            
            // عنوان الصفحة في المنتصف (أبيض وواضح فوق الخلفية الكحلي)
            Text(
              'حجوزاتي',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // أيقونة البروفايل
            Icon(Icons.person_outline_rounded, color: Colors.white, size: 26),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}