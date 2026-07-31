import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class WalletBalanceCard extends StatelessWidget {
  final VoidCallback onWithdraw;

  const WalletBalanceCard({super.key, required this.onWithdraw});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.primary,

        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Icon(
                Icons.account_balance_wallet_outlined,

                color: AppColors.white,

                size: 22,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  const Text(
                    'الرصيد المتاح',

                    style: TextStyle(fontSize: 11, color: AppColors.white),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'ج.م 42,750',

                    style: TextStyle(
                      fontSize: 22,

                      fontWeight: FontWeight.bold,

                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.12),

              borderRadius: BorderRadius.circular(8),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  'الرصيد القابل للسحب',

                  style: TextStyle(fontSize: 9, color: AppColors.white),
                ),

                const Text(
                  'ج.م 42,750',

                  style: TextStyle(
                    fontSize: 11,

                    fontWeight: FontWeight.bold,

                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 42,

            child: ElevatedButton(
              onPressed: onWithdraw,

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,

                foregroundColor: AppColors.primary,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              child: const Text(
                'سحب الأموال',

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
