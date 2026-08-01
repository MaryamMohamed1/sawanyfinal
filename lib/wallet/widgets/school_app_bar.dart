import 'package:flutter/material.dart';
import 'package:sawany/profile/School_Profile_Screen.dart'; // تأكدي إن المسار ده صح
import '../../../core/theme/app_colors.dart';

class SchoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationPressed;
  // مسار اختياري لصورة المدرسة (عشان لو حبيتي تمرريها من بره بعدين)
  final String? schoolLogoUrl; 

  const SchoolAppBar({
    super.key,
    required this.title,
    this.onNotificationPressed,
    this.schoolLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      
      // زرار الرجوع
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      // العنوان
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      
      // الأيقونات اللي على الشمال (الإشعارات وصورة المدرسة)
      actions: [
        IconButton(
          onPressed: onNotificationPressed,
          icon: const Icon(Icons.notifications_none),
        ),
        
        // 🌟 التعديل هنا: إضافة صورة المدرسة
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              // 👈 التنقل لصفحة بروفايل المدرسة
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SchoolProfileScreen(), 
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 4.0), // مسافة صغيرة من الحافة
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white.withOpacity(0.5), width: 1.5), 
              ),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.white.withOpacity(0.2),
                // لو بعتّي رابط للصورة هيعرضها، غير كده هيعرض أيقونة مدرسة كبديل
                backgroundImage: schoolLogoUrl != null ? NetworkImage(schoolLogoUrl!) : null,
                child: schoolLogoUrl == null 
                    ? const Icon(Icons.apartment_rounded, color: AppColors.white, size: 18) 
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}