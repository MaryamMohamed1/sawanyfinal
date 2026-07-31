import 'dart:async';
import 'package:flutter/material.dart';

/// ============================================================================
/// تطبيق سوقني (Souqni) - شاشة محاكاة الامتحان النظري لرخصة القيادة في مصر
/// File: theory_exam_screen.dart
/// Author: Souqni Mobile Team
/// Design: Material 3 | RTL Arabic | Startup Style
/// ============================================================================

void main() {
  runApp(const SouqniExamApp());
}

class SouqniExamApp extends StatelessWidget {
  const SouqniExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سوقني - محاكاة الامتحان النظري',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0E216C),
          primary: const Color(0xFF0E216C),
          secondary: const Color(0xFFFE8511),
          surface: const Color(0xFFF8F9FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
      ),
      home: const TheoryExamScreen(),
    );
  }
}

class QuestionModel {
  final int id;
  final String questionText;
  final List<String> choices;

  const QuestionModel({
    required this.id,
    required this.questionText,
    required this.choices,
  });
}

class TheoryExamScreen extends StatefulWidget {
  const TheoryExamScreen({super.key});

  @override
  State<TheoryExamScreen> createState() => _TheoryExamScreenState();
}

class _TheoryExamScreenState extends State<TheoryExamScreen> {
  // Brand Color Palette Constants
  static const Color primaryBlue = Color(0xFF0E216C);
  static const Color accentOrange = Color(0xFFFE8511);
  static const Color neutralGray = Color(0xFF838C91);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color appBg = Color(0xFFF4F6F9);

  // Exam Configuration
  static const int totalQuestionsCount = 20;
  static const int totalExamMinutes = 20;

  // State Variables
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {}; // Map<QuestionIndex, ChoiceIndex>
  Timer? _timer;
  int _remainingSeconds = totalExamMinutes * 60;
  bool _isSubmitted = false;
  bool _isAwaitingCorrection = false;

  final List<QuestionModel> _questions = const [
    QuestionModel(
      id: 1,
      questionText: 'ماذا تعني العلامة المرورية المثلثة ذات الإطار الأحمر؟',
      choices: ['إشارة إلزامية', 'إشارة تحذيرية', 'إشارة إرشادية', 'إشارة منعية'],
    ),
    QuestionModel(
      id: 2,
      questionText: 'ماذا تعني العلامة المرورية الدائرية ذات الإطار الأحمر؟',
      choices: ['إشارة تحذيرية', 'إشارة منعية', 'إشارة إلزامية', 'إشارة إرشادية'],
    ),
    QuestionModel(
      id: 3,
      questionText: 'ماذا تعني العلامة المرورية الدائرية ذات الخلفية الزرقاء؟',
      choices: ['إشارة تحذيرية', 'إشارة منعية', 'إشارة إجبارية (إلزامية)', 'إشارة مؤقتة'],
    ),
    QuestionModel(
      id: 4,
      questionText: 'ماذا تعني لوحة "قف" (STOP) عند التقاطعات؟',
      choices: [
        'التهدئة فقط',
        'التوقف التام والتأكد من خلو الطريق',
        'إعطاء أولوية للمشاة فقط',
        'المرور فوراً'
      ],
    ),
    QuestionModel(
      id: 5,
      questionText: 'ما معنى الضوء الأصفر اليرمش (التنبيهي) في إشارة المرور؟',
      choices: [
        'التوقف التام',
        'زيادة السرعة',
        'التهدئة وتوخي الحذر والعبور بحذر',
        'الرجوع للخلف'
      ],
    ),
    QuestionModel(
      id: 6,
      questionText: 'ماذا تعني إشارة دائرية حمراء داخلها رقم 60؟',
      choices: [
        'السرعة المقترحة 60',
        'أدنى سرعة 60',
        'أقصى سرعة مسموح بها هي 60 كم/س',
        'مسافة الأمان 60 متر'
      ],
    ),
    QuestionModel(
      id: 7,
      questionText: 'ماذا يعني الخط الأبيض المتصل في منتصف الطريق؟',
      choices: [
        'يُسمح بالتجاوز',
        'يُمنع التجاوز أو تغيير الحارة تماماً',
        'ممر مشاة',
        'موقف سيارات'
      ],
    ),
    QuestionModel(
      id: 8,
      questionText: 'ماذا يعني الخط الأبيض المتقطع في منتصف الطريق؟',
      choices: [
        'يُسمح بالتجاوز وتغيير الحارة عند أمان الطريق',
        'يُمنع التجاوز',
        'طريق اتجاه واحد فقط',
        'ممنوع الدخول'
      ],
    ),
    QuestionModel(
      id: 9,
      questionText: 'ماذا يعني الرصيف المدهون باللونين الأصفر الأسود؟',
      choices: ['مسموح بالانتظار', 'ممنوع الوقوف والانتظار', 'موقف حافلات', 'مخصص للشحن'],
    ),
    QuestionModel(
      id: 10,
      questionText: 'ماذا تعني لوحة مثلث بها صور أطفال؟',
      choices: [
        'ممنوع مرور الأطفال',
        'تحذير: منطقة مدارس أو أطفال بالقرب من الطريق',
        'موقف حافلات مدارس',
        'منطقة ألعاب فقط'
      ],
    ),
    QuestionModel(
      id: 11,
      questionText: 'ماذا تعني علامة "ممنوع التجاوز"؟',
      choices: [
        'ممنوع السرعة',
        'حظر تخطي المركبات التي أمامك',
        'ممنوع الانعطاف',
        'حظر السير في اتجاهين'
      ],
    ),
    QuestionModel(
      id: 12,
      questionText: 'علامة مربع أزرق بها حرف (P) تعني:',
      choices: [
        'شرطة المرور',
        'موقف سيارات (Parking)',
        'محطة بنزين',
        'طريق سريع'
      ],
    ),
    QuestionModel(
      id: 13,
      questionText: 'علامة مثلث أحمر داخله رسمة سيارة تنزلق تعني:',
      choices: [
        'طريق مغلق',
        'تحذير من طريق زلق',
        'ممنوع غسيل السيارات',
        'منطقة إصلاح إطارات'
      ],
    ),
    QuestionModel(
      id: 14,
      questionText: 'علامة دائرية زرقاء بها سهم يتجه لليمين تعني:',
      choices: [
        'اتجاه إجباري لليمين',
        'ممنوع الانعطاف يميناً',
        'يوجد طريق فرعي',
        'انتبه للسيارات من اليمين'
      ],
    ),
    QuestionModel(
      id: 15,
      questionText: 'علامة دائرة حمراء بها صورة شاحنة تعني:',
      choices: [
        'مخصص للشاحنات',
        'ممنوع دخول الشاحنات',
        'أولوية للشاحنات',
        'منطقة تفتيش شاحنات'
      ],
    ),
    QuestionModel(
      id: 16,
      questionText: 'علامة مثلث أحمر داخله رسمة قطار تعني:',
      choices: [
        'محطة قطار قريبة',
        'تقاطع مع سكة حديد (معبر قطار)',
        'ممنوع وقوف القطارات',
        'طريق خاص بالبضائع'
      ],
    ),
    QuestionModel(
      id: 17,
      questionText: 'ماذا يعني الخط الأصفر المزدوج المتصل في منتصف الطريق؟',
      choices: [
        'مسموح بالتجاوز للطرفين',
        'يمنع التجاوز كلياً لكلا الاتجاهين',
        'حارة مخصصة للطوارئ',
        'حارة مخصصة للحافلات'
      ],
    ),
    QuestionModel(
      id: 18,
      questionText: 'الضوء الأحادي الأحمر اليرمش في التقاطع يعني:',
      choices: [
        'التوقف التام كما في لوحة STOP ثم المتابعة عند خلو الطريق',
        'التهدئة فقط',
        'الطريق مغلق بالكامل',
        'زيادة السرعة قبل إغلاق التقاطع'
      ],
    ),
    QuestionModel(
      id: 19,
      questionText: 'لوحة دائرية حمراء فارغة من الداخل تعني:',
      choices: [
        'طريق مفتوح',
        'ممنوع مرور جميع المركبات في الاتجاهين',
        'منطقة انتظار مفتوحة',
        'نهاية جميع أنواع الحظر'
      ],
    ),
    QuestionModel(
      id: 20,
      questionText: 'علامة دائرية بيضاء بها خطوط سوداء مائلة تعني:',
      choices: [
        'بداية منطقة الحظر',
        'نهاية جميع القيود والتنظيمات السابقة',
        'أعمال صيانة قادمة',
        'تحذير من ضباب'
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        _handleAutoSubmitOnTimeOut();
      }
    });
  }

  String _formatTimer(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    final minStr = mins.toString().padLeft(2, '0');
    final secStr = secs.toString().padLeft(2, '0');
    return '$minStr:$secStr';
  }

  void _handleAutoSubmitOnTimeOut() {
    if (!_isSubmitted) {
      _showSubmissionConfirmationDialog(autoTriggered: true);
    }
  }

  void _selectChoice(int choiceIndex) {
    if (_isSubmitted) return;
    setState(() {
      _selectedAnswers[_currentIndex] = choiceIndex;
    });
  }

  void _goToPreviousQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _goToNextQuestion() {
    if (_currentIndex < totalQuestionsCount - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _jumpToQuestion(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.help_outline, color: primaryBlue, size: 28),
            SizedBox(width: 8),
            Text(
              'تعليمات الامتحان',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryBlue,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('• يتكون الامتحان النظري من 20 سؤالاً اختيارياً.'),
            SizedBox(height: 6),
            Text('• مدة الإجابة المتاحة هي 20 دقيقة كاملة.'),
            SizedBox(height: 6),
            Text('• درجة النجاح المطلوبة هي 90% على الأقل.'),
            SizedBox(height: 6),
            Text('• يمكنك التنقل بين الأسئلة وتغيير الإجابات قبل الإرسال.'),
            SizedBox(height: 6),
            Text('• بعد الإرسال، سيتم استلام إجاباتك ومراجعة الامتحان.'),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('فهمت ذلك',
                style: TextStyle(color: Colors.white, fontFamily: 'Cairo')),
          )
        ],
      ),
    );
  }

  void _showSubmissionConfirmationDialog({bool autoTriggered = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: accentOrange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send_rounded, color: accentOrange, size: 24),
            ),
            const SizedBox(width: 10),
            const Text(
              'تأكيد إرسال الامتحان',
              style: TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryBlue,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              autoTriggered
                  ? 'انتهى وقت الامتحان! هل تريد إرسال الإجابات الحالية؟'
                  : 'هل أنت متأكد من إرسال الامتحان؟\nلن تتمكن من تعديل إجاباتك بعد الإرسال.',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.assignment_turned_in, color: primaryBlue, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'الأسئلة المُجاب عنها: ${_selectedAnswers.length} من $totalQuestionsCount',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (!autoTriggered)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: neutralGray),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: neutralGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBlue,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              _executeExamSubmission();
            },
            child: const Text(
              'إرسال',
              style: TextStyle(
                fontFamily: 'Cairo',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _executeExamSubmission() {
    _timer?.cancel();
    setState(() {
      _isSubmitted = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 52,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '✅ تم إرسال الامتحان بنجاح',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'تم إرسال إجاباتك بنجاح.\nجاري مراجعة الامتحان...\nستظهر النتيجة بعد استلامها من نظام التصحيح.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  color: neutralGray,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(accentOrange),
              ),
            ],
          ),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
        setState(() {
          _isAwaitingCorrection = true;
        });
      }
    });
  }

  void _showQuestionGridBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'مستكشف الأسئلة (1 - 20)',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryBlue,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem('الحالي', primaryBlue),
                    _buildLegendItem('مُجاب', accentOrange),
                    _buildLegendItem('غير مُجاب', neutralGray),
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: totalQuestionsCount,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      final isCurrent = index == _currentIndex;
                      final isAnswered = _selectedAnswers.containsKey(index);

                      Color bgColor = cardBg;
                      Color textColor = neutralGray;
                      Border border = Border.all(color: Colors.grey.shade300);

                      if (isCurrent) {
                        bgColor = primaryBlue;
                        textColor = Colors.white;
                        border = Border.all(color: primaryBlue, width: 2);
                      } else if (isAnswered) {
                        bgColor = accentOrange;
                        textColor = Colors.white;
                        border = Border.all(color: accentOrange);
                      }

                      return InkWell(
                        onTap: () {
                          _jumpToQuestion(index);
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                            border: border,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            color: neutralGray,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: appBg,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            if (!_isSubmitted && _selectedAnswers.isNotEmpty) {
              _showSubmissionConfirmationDialog();
            } else {
              Navigator.of(context).maybePop();
            }
          },
        ),
        title: const Text(
          'محاكاة الامتحان النظري',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded, color: Colors.white),
            onPressed: _showHelpDialog,
          ),
        ],
      ),
      body: _isAwaitingCorrection
          ? _buildAwaitingCorrectionScreen()
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExamInfoCard(),
                          const SizedBox(height: 16),
                          _buildProgressCard(),
                          const SizedBox(height: 16),
                          _buildHorizontalQuestionNavigator(),
                          const SizedBox(height: 16),
                          _buildQuestionCard(currentQuestion),
                          const SizedBox(height: 16),
                          _buildAnswerChoices(currentQuestion),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                  _buildBottomNavigationBar(),
                ],
              ),
            ),
    );
  }

  Widget _buildExamInfoCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(
            icon: Icons.assignment_outlined,
            label: 'عدد الأسئلة',
            value: '$totalQuestionsCount سؤال',
          ),
          Container(height: 30, width: 1, color: Colors.grey.shade200),
          _buildInfoItem(
            icon: Icons.timer_outlined,
            label: 'مدة الامتحان',
            value: '$totalExamMinutes دقيقة',
          ),
          Container(height: 30, width: 1, color: Colors.grey.shade200),
          _buildInfoItem(
            icon: Icons.verified_outlined,
            label: 'درجة النجاح',
            value: '90%',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: accentOrange),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 11,
                color: neutralGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: primaryBlue,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    final double progressValue = (_currentIndex + 1) / totalQuestionsCount;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'السؤال الحالي',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12,
                      color: neutralGray,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${_currentIndex + 1} / $totalQuestionsCount',
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: accentOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: accentOrange.withOpacity(0.3), width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled_rounded,
                      color: accentOrange,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formatTimer(_remainingSeconds),
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: accentOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(accentOrange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalQuestionNavigator() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: totalQuestionsCount,
              itemBuilder: (context, index) {
                final isCurrent = index == _currentIndex;
                final isAnswered = _selectedAnswers.containsKey(index);

                Color bgColor = cardBg;
                Color textColor = neutralGray;
                Border border = Border.all(color: Colors.grey.shade300);

                if (isCurrent) {
                  bgColor = primaryBlue;
                  textColor = Colors.white;
                  border = Border.all(color: primaryBlue, width: 1.5);
                } else if (isAnswered) {
                  bgColor = accentOrange;
                  textColor = Colors.white;
                  border = Border.all(color: accentOrange);
                }

                return GestureDetector(
                  onTap: () => _jumpToQuestion(index),
                  child: Container(
                    width: 42,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10),
                      border: border,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: _showQuestionGridBottomSheet,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: primaryBlue.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.grid_view_rounded, color: primaryBlue),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(QuestionModel question) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'سؤال ${question.id}',
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            question.questionText,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerChoices(QuestionModel question) {
    final labels = ['أ', 'ب', 'ج', 'د'];
    final selectedChoice = _selectedAnswers[_currentIndex];

    return Column(
      children: List.generate(question.choices.length, (choiceIndex) {
        final isSelected = selectedChoice == choiceIndex;
        final label = labels[choiceIndex];
        final text = question.choices[choiceIndex];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: InkWell(
            onTap: () => _selectChoice(choiceIndex),
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFFF8F0) : cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? accentOrange : Colors.grey.shade200,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? accentOrange.withOpacity(0.15)
                        : Colors.black.withOpacity(0.02),
                    blurRadius: isSelected ? 8 : 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? accentOrange
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: isSelected ? Colors.white : neutralGray,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? primaryBlue : const Color(0xFF334155),
                      ),
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? accentOrange
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: isSelected
                        ? Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: accentOrange,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildBottomNavigationBar() {
    final bool isLastQuestion = _currentIndex == totalQuestionsCount - 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryBlue),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _currentIndex > 0 ? _goToPreviousQuestion : null,
                icon: const Icon(Icons.arrow_back_rounded,
                    size: 18, color: primaryBlue),
                label: const Text(
                  'السؤال السابق',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: primaryBlue,
                  ),
                ),
              ),
              Text(
                'السؤال ${_currentIndex + 1} من $totalQuestionsCount',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: neutralGray,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLastQuestion ? accentOrange : primaryBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (isLastQuestion) {
                    _showSubmissionConfirmationDialog();
                  } else {
                    _goToNextQuestion();
                  }
                },
                child: Row(
                  children: [
                    Text(
                      isLastQuestion ? 'إنهاء الإجابة' : 'التالي',
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      isLastQuestion
                          ? Icons.check_circle_outline_rounded
                          : Icons.arrow_forward_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () => _showSubmissionConfirmationDialog(),
              icon: const Icon(Icons.send_rounded,
                  color: Colors.white, size: 20),
              label: const Text(
                'إرسال الامتحان',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwaitingCorrectionScreen() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Check Icon
            Center(
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Premium Information Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title: 📋 حالة الامتحان
                  const Text(
                    '📋 حالة الامتحان',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(height: 1, color: Colors.grey.shade200),
                  const SizedBox(height: 14),

                  // Description
                  const Text(
                    'تم استلام إجاباتك بنجاح.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'سيتم إرسال النتيجة إلى حسابك فور الانتهاء من مراجعة الامتحان.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 13,
                      color: neutralGray,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Loading Animation (UI only)
            const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(accentOrange),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Text under loading animation: "جارٍ مراجعة الامتحان..."
            const Text(
              'جارٍ مراجعة الامتحان...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: neutralGray,
              ),
            ),
            const SizedBox(height: 36),

            // Primary Button: العودة للرئيسية
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('العودة إلى الصفحة الرئيسية',
                          style: TextStyle(fontFamily: 'Cairo')),
                      backgroundColor: primaryBlue,
                    ),
                  );
                },
                icon: const Icon(Icons.home_rounded, color: Colors.white, size: 20),
                label: const Text(
                  'العودة للرئيسية',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Secondary Outlined Button: إعادة المحاكاة
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: primaryBlue, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isSubmitted = false;
                    _isAwaitingCorrection = false;
                    _currentIndex = 0;
                    _selectedAnswers.clear();
                    _remainingSeconds = totalExamMinutes * 60;
                    _startTimer();
                  });
                },
                icon: const Icon(Icons.refresh_rounded, color: primaryBlue, size: 20),
                label: const Text(
                  'إعادة المحاكاة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
