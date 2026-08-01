import 'package:flutter/material.dart';

class TrainerReviewsScreen extends StatelessWidget {
  const TrainerReviewsScreen({super.key});

  // الألوان الأساسية
  static const Color primaryNavy = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. إجمالي التقييم
          _buildOverallRating(),
          const SizedBox(height: 24),

          // 2. تحليل التقييمات (شرايط التقدم)
          _buildRatingBreakdown(),
          const SizedBox(height: 32),

          // 3. النزاعات والشكاوي النشطة
          _buildActiveDisputes(),
          const SizedBox(height: 32),

          // 4. تقييمات الطلاب والردود
          _buildStudentReviews(),
        ],
      ),
    );
  }

  // ==========================================
  // 1. إجمالي التقييم
  // ==========================================
  Widget _buildOverallRating() {
    return Column(
      children: [
        const Text('إجمالي التقييم', style: TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('4.8', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: primaryNavy, height: 1.0)),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 4.0),
              child: Text('/ 5', style: TextStyle(fontSize: 18, color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) => const Icon(Icons.star_rounded, color: accentOrange, size: 22)),
        ),
        const SizedBox(height: 8),
        Text('بناءً على 124 تقييم من الطلاب', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }

  // ==========================================
  // 2. تحليل التقييمات
  // ==========================================
  Widget _buildRatingBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('تحليل التقييمات', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryNavy)),
        const SizedBox(height: 16),
        _buildRatingBar('5 نجوم', 0.85, '85%'),
        _buildRatingBar('4 نجوم', 0.10, '10%'),
        _buildRatingBar('3 نجوم', 0.03, '3%'),
        _buildRatingBar('نجمتان', 0.01, '1%'),
        _buildRatingBar('نجمة', 0.01, '1%'),
      ],
    );
  }

  Widget _buildRatingBar(String label, double percent, String percentText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(accentOrange),
                minHeight: 8,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(percentText, textAlign: TextAlign.left, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 3. النزاعات / الشكاوي النشطة
  // ==========================================
  Widget _buildActiveDisputes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.gavel_rounded, color: accentOrange, size: 20),
            const SizedBox(width: 8),
            const Text('الشكاوي والنزاعات', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12)),
              child: Text('2 بحاجة لإجراء', style: TextStyle(color: Colors.red.shade700, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDisputeCard(
          studentName: 'أحمد محمود',
          sessionName: 'حصة "القيادة في الزحام"',
          date: '12 أكتوبر 2026',
          complaint: '"الكابتن اتأخر ربع ساعة عن ميعاد الحصة ومفيش تعويض للوقت."',
          status: 'قيد المراجعة',
          actionText: 'حل النزاع',
          icon: Icons.info_outline_rounded,
        ),
        const SizedBox(height: 12),
        _buildDisputeCard(
          studentName: 'سارة علي',
          sessionName: 'استرداد مبلغ',
          date: '15 أكتوبر 2026',
          complaint: '"تم إلغاء حصة الركنات من طرف المدرب وأطلب استرداد الرصيد للمحفظة."',
          status: 'في انتظار الرد',
          actionText: 'عرض التفاصيل',
          icon: Icons.mail_outline_rounded,
        ),
      ],
    );
  }

  Widget _buildDisputeCard({
    required String studentName,
    required String sessionName,
    required String date,
    required String complaint,
    required String status,
    required String actionText,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundColor: Colors.grey.shade100, child: const Icon(Icons.person_outline, color: primaryNavy)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primaryNavy)),
                    const SizedBox(height: 4),
                    Text('$sessionName - $date', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),
                child: Text(status, style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(complaint, style: const TextStyle(fontSize: 13, color: Colors.black87, fontStyle: FontStyle.italic)),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: primaryNavy, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryNavy,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(actionText, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================
  // 4. تقييمات الطلاب
  // ==========================================
  Widget _buildStudentReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('تقييمات الطلاب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryNavy)),
        const SizedBox(height: 16),
        _buildReviewCard(
          studentName: 'ياسين طارق',
          date: 'منذ يومين',
          image: 'https://i.pravatar.cc/150?img=11',
          review: '"المدرب ممتاز جداً في شرح المانيوال بطريقة مبسطة. استفدت كتير من حصة الشارع وهحجز تاني قريباً."',
          showReplyInput: true,
        ),
        const SizedBox(height: 16),
        _buildReviewCard(
          studentName: 'ليلى حسن',
          date: 'منذ 5 أيام',
          image: 'https://i.pravatar.cc/150?img=5',
          review: '"الشرح رائع ولكن كان هناك بعض التأخير في البدء، الجلسة كانت مكثفة ومليئة بالمعلومات."',
          replyText: '"شكراً لكِ ليلى على ملاحظتك، أعتذر عن التأخير الخارج عن إرادتي وسنحرص على الدقة في المواعيد القادمة."',
          showReplyInput: false,
        ),
      ],
    );
  }

  Widget _buildReviewCard({
    required String studentName,
    required String date,
    required String image,
    required String review,
    bool showReplyInput = false,
    String? replyText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(image)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(studentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: primaryNavy)),
                    Row(
                      children: List.generate(5, (index) => const Icon(Icons.star_rounded, color: accentOrange, size: 14)),
                    ),
                  ],
                ),
              ),
              Text(date, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Text(review, style: const TextStyle(fontSize: 13, color: Colors.black87)),
          const SizedBox(height: 16),
          
          if (showReplyInput)
            Row(
              children: [
                const Icon(Icons.reply_rounded, color: Colors.grey, size: 18),
                const SizedBox(width: 4),
                Text('رد على التقييم', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                const Spacer(),
                const Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, color: Colors.grey, size: 14),
                    SizedBox(width: 4),
                    Text('مفيد (12)', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            
          if (replyText != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ردك:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryNavy)),
                  const SizedBox(height: 4),
                  Text(replyText, style: const TextStyle(fontSize: 12, color: Colors.black87)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}