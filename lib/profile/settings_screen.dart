import 'package:flutter/material.dart';
import 'package:sawany/auth/identity_selection_screen.dart';
import 'package:sawany/auth/student_signup_screens.dart';
import 'package:sawany/core/theme/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        // إضافة سهم الرجوع
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF6F8FA), // متناسق مع لون العنوان
          ),
          onPressed: () => Navigator.pop(context), // بيرجع لسكرين 7
        ),
        title: const Text(
          'الإعدادات ⚙️',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF6F8FA),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // User Header Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300&q=80',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'احمد محمد ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'متدرب قيادة مفعل • طالب جامعي',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF1D4ED8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Settings Group
            _buildSettingsGroup('الحساب والخصوصية', [
              _buildSettingTile(
                Icons.person_outline,
                'تعديل البيانات الشخصية',
                () {},
              ),
              _buildSettingTile(
                Icons.lock_outline,
                'الأمان وكلمة المرور',
                () {},
              ),
              _buildSettingTile(
                Icons.shield_outlined,
                'الخصوصية والشروط',
                () {},
              ),
            ]),
            const SizedBox(height: 16),

            _buildSettingsGroup('التفضيلات', [
              SwitchListTile(
                value: _notifications,
                onChanged: (val) => setState(() => _notifications = val),
                title: const Text(
                  'الإشعارات والتنبيهات',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                secondary: const Icon(
                  Icons.notifications_active_outlined,
                  color: Color(0xFF1D4ED8),
                ),
                activeColor: const Color(0xFF1D4ED8),
              ),
              _buildSettingTile(
                Icons.language,
                'لغة التطبيق',
                () {},
                subtitle: 'العربية (RTL)',
              ),
            ]),
            const SizedBox(height: 16),

            _buildSettingsGroup('المساعدة والمشروع', [
              _buildSettingTile(
                Icons.help_outline,
                'المساعدة والدعم الفني',
                () {},
              ),
              _buildSettingTile(
                Icons.info_outline,
                'حول تطبيق سوقني (المؤتمر الجامعي)',
                () {},
              ),
              _buildSettingTile(Icons.mail_outline, 'تواصل معنا', () {}),
            ]),
            const SizedBox(height: 24),

            // Logout Button
            TextButton.icon(
             onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const IdentitySelectionScreen(),
    ),
  );
},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'تطبيق سوقني © 2026 - الإصدار 1.0.0 (المؤتمر الجامعي)',
              style: TextStyle(color: Colors.grey[400], fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title,
    VoidCallback onTap, {
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1D4ED8)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
