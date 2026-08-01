import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/transaction_model.dart';

import '../widgets/earnings_summary_card.dart';

import '../widgets/wallet_balance_card.dart';

import '../widgets/transaction_card.dart';

// import '../widgets/financial_details_card.dart';

import '../../widgets/school_app_bar.dart';
import '../../school_reports/screens/school_reports_screen.dart';

class EarningsWalletScreen extends StatefulWidget {
  const EarningsWalletScreen({super.key});

  @override
  State<EarningsWalletScreen> createState() => _EarningsWalletScreenState();
}

class _EarningsWalletScreenState extends State<EarningsWalletScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedFilter = 'الكل';

  final List<TransactionModel> transactions = [
    TransactionModel(
      title: 'حصة تدريب قيادة',
      date: '23 يوليو 2026',
      amount: '+ ج.م 450',
      type: 'جلسة',
      status: 'مكتملة',
      isIncome: true,
    ),

    TransactionModel(
      title: 'ترقية باقة التدريب',
      date: '22 يوليو 2026',
      amount: '+ ج.م 1,200',
      type: 'باقة',
      status: 'معلقة',
      isIncome: true,
    ),

    TransactionModel(
      title: 'سحب الأموال',
      date: '20 يوليو 2026',
      amount: '- ج.م 5,000',
      type: 'سحب',
      status: 'مكتملة',
      isIncome: false,
    ),
  ];

  List<TransactionModel> filteredTransactions = [];

  @override
  void initState() {
    super.initState();

    filteredTransactions = transactions;
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  void filterTransactions() {
    final searchText = searchController.text.trim().toLowerCase();

    setState(() {
      filteredTransactions = transactions.where((transaction) {
        final matchesSearch = transaction.title.toLowerCase().contains(
          searchText,
        );

        final matchesFilter =
            selectedFilter == 'الكل' || transaction.type == selectedFilter;

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: AppColors.lightBackground,
        child: Column(
          children: [
            SchoolAppBar(title: 'الأرباح والمحفظة', onNotificationPressed: () {}),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(children: [
                      Expanded(child: EarningsSummaryCard(title: 'إجمالي الأرباح', amount: 'ج.م 248,500', subtitle: '+12.5% هذا الشهر', icon: Icons.trending_up, iconColor: AppColors.success)),
                      const SizedBox(width: 8),
                      Expanded(child: EarningsSummaryCard(title: 'الرصيد المتاح', amount: 'ج.م 42,750', subtitle: 'قابل للسحب', icon: Icons.account_balance_wallet_outlined, iconColor: AppColors.primary)),
                    ]),
                    const SizedBox(height: 8),
                    Row(children: [
                      Expanded(child: EarningsSummaryCard(title: 'الأرباح المعلقة', amount: 'ج.م 18,300', subtitle: 'قيد التسوية', icon: Icons.access_time, iconColor: AppColors.accent)),
                      const SizedBox(width: 8),
                      Expanded(child: EarningsSummaryCard(title: 'إجمالي الأرباح', amount: 'ج.م 187,450', subtitle: 'إجمالي مدى الحياة', icon: Icons.account_balance, iconColor: AppColors.gray)),
                    ]),
                    const SizedBox(height: 16),
                    WalletBalanceCard(onWithdraw: () => _showWithdrawDialog(context)),
                    const SizedBox(height: 20),
                    _buildSectionTitle(title: 'نظرة عامة على الأرباح', trailing: 'هذا الشهر'),
                    const SizedBox(height: 10),
                    _buildEarningsChart(),
                    const SizedBox(height: 20),
                    _buildSectionTitle(title: 'المعاملات الأخيرة', trailing: 'الكل'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: searchController,
                      onChanged: (value) => filterTransactions(),
                      decoration: const InputDecoration(hintText: 'ابحث في المعاملات...', prefixIcon: Icon(Icons.search)),
                    ),
                    const SizedBox(height: 10),
                    _buildTransactionFilters(),
                    const SizedBox(height: 12),
                    if (filteredTransactions.isEmpty)
                      const Center(child: Padding(padding: EdgeInsets.all(20), child: Text('لا توجد معاملات', style: TextStyle(color: AppColors.gray)))),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredTransactions.length,
                      itemBuilder: (context, index) => TransactionCard(transaction: filteredTransactions[index]),
                    ),
                    // const SizedBox(height: 10),
                    // _buildSectionTitle(title: 'التفاصيل المالية', trailing: ''),
                    const SizedBox(height: 10),
                    // const FinancialDetailsCard(),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SchoolReportsScreen())),
                      icon: const Icon(Icons.bar_chart_rounded, size: 18),
                      label: const Text('عرض تقارير المدرسة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle({required String title, required String trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,

          style: const TextStyle(
            fontSize: 14,

            fontWeight: FontWeight.bold,

            color: AppColors.primary,
          ),
        ),

        if (trailing.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

            decoration: BoxDecoration(
              color: AppColors.white,

              borderRadius: BorderRadius.circular(6),

              border: Border.all(color: AppColors.border),
            ),

            child: Text(
              trailing,

              style: const TextStyle(fontSize: 9, color: AppColors.gray),
            ),
          ),
      ],
    );
  }

  Widget _buildEarningsChart() {
    final values = [0.35, 0.75, 0.55, 0.85, 0.65, 0.45];

    final labels = ['يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو'];

    return Container(
      height: 190,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,

        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: List.generate(values.length, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Container(
                width: 26,

                height: 100 * values[index],

                decoration: BoxDecoration(
                  color: AppColors.primary,

                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                labels[index],

                style: const TextStyle(fontSize: 8, color: AppColors.gray),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTransactionFilters() {
    final filters = ['الكل', 'جلسة', 'باقة', 'سحب'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });

              filterTransactions();
            },

            child: Container(
              margin: const EdgeInsets.only(left: 8),

              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              ),

              child: Text(
                filter,

                style: TextStyle(
                  fontSize: 9,

                  color: isSelected ? AppColors.white : AppColors.primary,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showWithdrawDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('سحب الأموال'),

          content: const Text(
            'سيتم إضافة خطوات السحب وربط الحساب البنكي لاحقًا.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }
}
