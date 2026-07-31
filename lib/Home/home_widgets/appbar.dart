import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSettingsTap;
  final VoidCallback? onProfileTap;

  const HomeAppBar({
    super.key, 
    this.onSettingsTap,
    this.onProfileTap,
  });

  // Brand Colors
  static const Color primaryBlue = Color(0xFF0F2C59);
  static const Color secondaryBlue = Color(0xFF337CCF);
  static const Color accentOrange = Color(0xFFFF7F3E);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryBlue,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // صورة البروفايل
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5), 
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: secondaryBlue,
                child: Icon(Icons.person, color: Colors.white), 
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Row(
                  children: [
                    Text(
                      'مرحباً، أحمد',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text('👋', style: TextStyle(fontSize: 13)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 13, color: accentOrange), 
                    SizedBox(width: 2),
                    Text(
                      'القاهرة، مدينة نصر',
                      style: TextStyle(
                        color: Colors.white70, 
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 22,
              ),
              onPressed: onSettingsTap,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}