import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class FinancialDetailsCard
    extends StatelessWidget {
  const FinancialDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius:
            BorderRadius.circular(12),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        children: [
          _buildRow(
            title: 'إجمالي الحصص التدريبية',

            value: 'ج.م 225,000',
          ),

          _buildRow(
            title: 'عمولة المنصة',

            value: '- ج.م 12,500',

            valueColor:
                AppColors.error,
          ),

          _buildRow(
            title: 'رسوم أخرى',

            value: '- ج.م 4,000',

            valueColor:
                AppColors.error,
          ),

          const Divider(
            color: AppColors.border,
          ),

          _buildRow(
            title: 'المستحقات النهائية',

            value: 'ج.م 187,450',

            valueColor:
                AppColors.primary,

            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String title,

    required String value,

    Color? valueColor,

    bool isBold = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,

        children: [
          Text(
            value,

            style: TextStyle(
              fontSize: 11,

              fontWeight: isBold
                  ? FontWeight.bold
                  : FontWeight.normal,

              color: valueColor ??
                  AppColors.black,
            ),
          ),

          Text(
            title,

            style: TextStyle(
              fontSize: 10,

              fontWeight: isBold
                  ? FontWeight.bold
                  : FontWeight.normal,

              color: isBold
                  ? AppColors.primary
                  : AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}