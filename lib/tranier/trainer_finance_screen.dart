import 'package:flutter/material.dart';

class TrainerFinanceScreen extends StatelessWidget {
  const TrainerFinanceScreen({super.key});

  // الألوان الأساسية
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color lightBlueBg = Color(0xFFE6E9F4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. كارت الرصيد المتاح
          _buildBalanceCard(),
          const SizedBox(height: 24),

          // 2. ملخص الأرباح الشهرية (الرسم البياني)
          _buildMonthlySummary(),
          const SizedBox(height: 32),

          // 3. العمليات الأخيرة
          _buildRecentTransactions(),
        ],
      ),
    );
  }

  // ==========================================
  // 1. كارت الرصيد المتاح (الأزرق)
  // ==========================================
  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: primaryNavy,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryNavy.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'الرصيد المتاح',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '12,450.00',
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Text(
                  'ج.م',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                // أكشن سحب الأموال
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: accentOrange,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.account_balance_wallet_outlined, size: 20),
              label: const Text(
                'سحب الأموال',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 2. ملخص الأرباح الشهرية (شكل الرسم البياني)
  // ==========================================
  Widget _buildMonthlySummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('ملخص الأرباح الشهرية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy)),
              Row(
                children: [
                  Text('يوليو 2026', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey, size: 18),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          // الأعمدة البيانية (شكل محاكي للصورة)
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildChartBar(height: 60, isActive: false),
                _buildChartBar(height: 80, isActive: false),
                _buildChartBar(height: 40, isActive: false),
                _buildChartBar(height: 100, isActive: true, tooltipLabel: '3.2k'), // العمود النشط
                _buildChartBar(height: 70, isActive: false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 16),
          
          // إجمالي الدخل والمدفوعات
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryStat('إجمالي الدخل', '+8,400 ج.م', Colors.grey.shade600),
              _buildSummaryStat('المدفوعات', '2,000 ج.م', const Color(0xFF8D6A4E)), // لون بني فاتح زي الصورة
            ],
          ),
        ],
      ),
    );
  }

  // رسم عمود بياني واحد
  Widget _buildChartBar({required double height, required bool isActive, String? tooltipLabel}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isActive && tooltipLabel != null)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF232323),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(tooltipLabel, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        Container(
          width: 40,
          height: height,
          decoration: BoxDecoration(
            color: isActive ? primaryNavy : lightBlueBg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
      ],
    );
  }

  // نص الأرقام تحت الرسم البياني
  Widget _buildSummaryStat(String title, String amount, Color amountColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(amount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: amountColor)),
      ],
    );
  }

  // ==========================================
  // 3. العمليات الأخيرة
  // ==========================================
  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('العمليات الأخيرة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryNavy)),
            Text('عرض الكل', style: TextStyle(fontSize: 13, color: primaryNavy.withOpacity(0.7))),
          ],
        ),
        const SizedBox(height: 16),
        _buildTransactionItem(
          title: 'أرباح الجلسة - أحمد ع.',
          date: '24 يوليو، 2026',
          amount: '+600 ج.م',
          isIncome: true,
          icon: Icons.payments_outlined,
        ),
        _buildTransactionItem(
          title: 'طلب سحب نقدي',
          date: '20 يوليو، 2026',
          amount: '-2,000 ج.م',
          isIncome: false,
          icon: Icons.outbox_rounded,
        ),
        _buildTransactionItem(
          title: 'أرباح الجلسة - نورة س.',
          date: '18 يوليو، 2026',
          amount: '+450 ج.م',
          isIncome: true,
          icon: Icons.payments_outlined,
        ),
        _buildTransactionItem(
          title: 'أرباح الجلسة - خالد م.',
          date: '15 يوليو، 2026',
          amount: '+600 ج.م',
          isIncome: true,
          icon: Icons.payments_outlined,
        ),
      ],
    );
  }

  // كارت لعملية مالية واحدة
  Widget _buildTransactionItem({
    required String title,
    required String date,
    required String amount,
    required bool isIncome,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // الأيقونة
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isIncome ? lightBlueBg : const Color(0xFFFDF0E6), // أزرق فاتح للدخل، برتقالي فاتح للسحب
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isIncome ? primaryNavy : const Color(0xFF9E5400),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          // تفاصيل العملية
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          // المبلغ والحالة
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isIncome ? primaryNavy : Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 4),
              const Text('مكتمل', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}