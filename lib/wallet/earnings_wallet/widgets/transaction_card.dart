import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

import '../models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = transaction.status == 'مكتملة'
        ? AppColors.success
        : transaction.status == 'معلقة'
        ? AppColors.accent
        : AppColors.error;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: AppColors.border),
      ),

      child: Row(
        children: [
          Container(
            width: 34,

            height: 34,

            decoration: BoxDecoration(
              color: transaction.isIncome
                  ? AppColors.success.withOpacity(0.12)
                  : AppColors.accent.withOpacity(0.12),

              shape: BoxShape.circle,
            ),

            child: Icon(
              transaction.isIncome ? Icons.arrow_downward : Icons.arrow_upward,

              size: 18,

              color: transaction.isIncome
                  ? AppColors.success
                  : AppColors.accent,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  transaction.title,

                  textAlign: TextAlign.right,

                  style: const TextStyle(
                    fontSize: 11,

                    fontWeight: FontWeight.bold,

                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  transaction.date,

                  style: const TextStyle(fontSize: 9, color: AppColors.gray),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Text(
                transaction.amount,

                style: TextStyle(
                  fontSize: 11,

                  fontWeight: FontWeight.bold,

                  color: transaction.isIncome
                      ? AppColors.success
                      : AppColors.error,
                ),
              ),

              const SizedBox(height: 5),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),

                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: Text(
                  transaction.status,

                  style: TextStyle(
                    fontSize: 8,

                    color: statusColor,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
