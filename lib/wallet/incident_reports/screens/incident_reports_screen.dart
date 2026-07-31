import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/incident_model.dart';
import '../widgets/incident_card.dart';
import '../../widgets/school_app_bar.dart';
import 'NewAccident_Report_Form.dart';

class IncidentReportsScreen extends StatefulWidget {
  const IncidentReportsScreen({super.key});

  @override
  State<IncidentReportsScreen> createState() => _IncidentReportsScreenState();
}

class _IncidentReportsScreenState extends State<IncidentReportsScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedFilter = 'الكل';

  final List<IncidentModel> incidents = [
    IncidentModel(id: 'INC-8821', title: 'تصادم أثناء التمرين', date: '2026/07/22', time: '10:30 صباحًا', trainerName: 'أحمد محمود', location: 'مدينة نصر - القاهرة', status: 'مفتوح', priority: 'مرتفع'),
    IncidentModel(id: 'INC-8819', title: 'عطل بالسيارة أثناء التدريب', date: '2026/07/21', time: '02:15 مساءً', trainerName: 'سارة حسن', location: 'المعادي - القاهرة', status: 'قيد المراجعة', priority: 'مرتفع'),
    IncidentModel(id: 'INC-8815', title: 'احتكاك بسيط أثناء التدريب', date: '2026/07/20', time: '11:00 صباحًا', trainerName: 'ياسر فوزي', location: 'مصر الجديدة - القاهرة', status: 'مغلق', priority: 'متوسط'),
  ];

  List<IncidentModel> get filteredIncidents {
    final searchText = searchController.text.trim().toLowerCase();
    return incidents.where((incident) {
      final matchesSearch = incident.id.toLowerCase().contains(searchText) || incident.title.toLowerCase().contains(searchText) || incident.trainerName.toLowerCase().contains(searchText);
      final matchesFilter = selectedFilter == 'الكل' || incident.status == selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: AppColors.lightBackground,
        child: Column(
          children: [
            SchoolAppBar(title: 'بلاغات الحوادث', onNotificationPressed: () {}),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildStatistics(),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      onPressed: () {
                        // الانتقال لصفحة إنشاء بلاغ جديد
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewAccidentReportScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('إنشاء بلاغ جديد', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFE8511), // لون البرتقالي المميز المطلوب
                        foregroundColor: AppColors.white,
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: searchController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'بحث برقم البلاغ أو اسم المدرب...',
                        hintStyle: const TextStyle(fontSize: 11, color: AppColors.gray),
                        prefixIcon: const Icon(Icons.search, size: 20),
                        suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.tune, size: 18)),
                        filled: true, fillColor: AppColors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.primary)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildFilters(),
                    const SizedBox(height: 16),
                    const Text('قائمة بلاغات الحوادث', style: TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    if (filteredIncidents.isEmpty)
                      const Padding(padding: EdgeInsets.all(30), child: Center(child: Text('لا توجد بلاغات مطابقة', style: TextStyle(fontSize: 12, color: AppColors.gray)))),
                    ...filteredIncidents.map((incident) => IncidentCard(incident: incident)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistics() {
    return Column(
      children: [
        Row(children: [
          Expanded(child: _buildStatCard(title: 'إجمالي البلاغات', value: '${incidents.length}', valueColor: AppColors.primary)),
          const SizedBox(width: 8),
          Expanded(child: _buildStatCard(title: 'مفتوحة', value: '${incidents.where((e) => e.status == 'مفتوح').length}', valueColor: AppColors.accent)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _buildStatCard(title: 'قيد المراجعة', value: '${incidents.where((e) => e.status == 'قيد المراجعة').length}', valueColor: AppColors.accent)),
          const SizedBox(width: 8),
          Expanded(child: _buildStatCard(title: 'مغلقة', value: '${incidents.where((e) => e.status == 'مغلق').length}', valueColor: AppColors.success)),
        ]),
      ],
    );
  }

  Widget _buildStatCard({required String title, required String value, required Color valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.border)),
      child: Column(children: [
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: AppColors.gray, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 24, color: valueColor, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _buildFilters() {
    final filters = ['الكل', 'مفتوح', 'قيد المراجعة', 'مغلق'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return GestureDetector(
            onTap: () => setState(() => selectedFilter = filter),
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
              ),
              child: Text(filter, style: TextStyle(fontSize: 10, color: isSelected ? AppColors.white : AppColors.primary, fontWeight: FontWeight.bold)),
            ),
          );
        }).toList(),
      ),
    );
  }
}