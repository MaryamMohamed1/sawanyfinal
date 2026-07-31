import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class NoticeCard extends StatelessWidget {
  const NoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E8),

        borderRadius: BorderRadius.circular(14),

        border: Border.all(color: const Color(0xFFFFD166)),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        textDirection: TextDirection.rtl,

        children: [
          const Icon(Icons.info_outline, color: AppColors.accent, size: 26),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  "تنبيه",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "قد تختلف بعض المستندات أو الرسوم أو الإجراءات حسب نوع الرخصة ووحدة المرور التابعة لمحل إقامتك، لذا يُنصح بالتأكد من أقرب وحدة مرور قبل التوجه إليها.",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.7,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
