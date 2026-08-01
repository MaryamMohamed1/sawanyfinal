import 'package:flutter/material.dart';
// استيراد شاشة الأرباح والمحفظة الخاصة بالشريك


class PartnerCardItem extends StatelessWidget {
  final String name;
  final String brief;
  final List<String> badges;
  final String expiry;
  final String fullDetails;

  const PartnerCardItem({
    super.key,
    required this.name,
    required this.brief,
    required this.badges,
    required this.expiry,
    required this.fullDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // خلفية بيضاء للكروت
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF838C91)), // حدود رمادية واضحة
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF0E216C).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.time_to_leave, color: Color(0xFF0E216C)), // كحلي أساسي
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF000000), // أسود لعنوان الكرت الرئيسي
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            brief,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF838C91), // رمادي للنصوص الثانوية
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: badges.map((badge) => Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E216C).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Color(0xFF0E216C), // كحلي أساسي للشارات
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFF838C91)), // فاصل رمادي
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'حالة الشراكة',
                    style: TextStyle(fontSize: 11, color: Color(0xFF838C91)), // رمادي
                  ),
                  Text(
                    expiry,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0E216C), // كحلي أساسي
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // زر المحفظة والأرباح الخاص بالشريك
                  GestureDetector(
                    onTap: () {
                      // يمكنك إلغاء التعليق عند ربطه بالشاشة الفعلية
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EarningsAndWalletScreen(partnerName: name),
                        ),
                      );
                      */
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFE8511).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.account_balance_wallet, size: 14, color: Color(0xFFFE8511)), // برتقالي تفاعلي
                          SizedBox(width: 4),
                          Text(
                            'المحفظة والأرباح',
                            style: TextStyle(
                              color: Color(0xFFFE8511), // برتقالي تفاعلي
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // زر التفاصيل الأصلي
                  GestureDetector(
                    onTap: () {
                      _showDetailsBottomSheet(context, name, fullDetails);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'التفاصيل',
                          style: TextStyle(
                            color: Color(0xFF0E216C),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_left, color: Color(0xFF0E216C), size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDetailsBottomSheet(BuildContext context, String partnerName, String details) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFFFFFFF),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF838C91),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'تفاصيل الشراكة مع $partnerName',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                details,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF838C91),
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFE8511),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'إغلاق',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}