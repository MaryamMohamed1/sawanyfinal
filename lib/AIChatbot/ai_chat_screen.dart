import 'package:flutter/material.dart';
import 'ai_api_service.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final AiApiService _apiService = AiApiService();
  
  final List<Map<String, String>> _history = [];
  final List<Map<String, String>> _messages = [];
  
  bool _isLoading = false;
  bool _isServerAvailable = true;
  bool _isCheckingServer = true;

  // قائمة الأسئلة السريعة المقترحة بناءً على الصورة
  final List<String> _quickQuestions = [
    'إيه شروط استخراج رخصة قيادة أول مرة؟',
    'إيه هي خطوات الاختبار العملي؟',
    'فيه مدرب سواقة في الهرم؟',
    'سعر تغيير زيت المحرك لسيارة 1600 في القاهرة؟',
    'لو رسبت في الاختبار أعيده امتى؟',
  ];

  @override
  void initState() {
    super.initState();
    _checkServer();
    _messages.add({
      'sender': 'bot',
      'text': 'مرحباً بك! أنا مساعدك الذكي في منصة "سوقني". كيف يمكنني مساعدتك في حجز باقتك، تغيير المواعيد أو إجابة استفساراتك اليوم؟'
    });
  }

  Future<void> _checkServer() async {
    bool isAvailable = await _apiService.checkHealth();
    setState(() {
      _isServerAvailable = isAvailable;
      _isCheckingServer = false;
    });
  }

  Future<void> _sendSpecificMessage(String text) async {
    if (text.isEmpty || _isLoading) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _isLoading = true;
    });

    try {
      final responseModel = await _apiService.sendMessage(text, _history);

      setState(() {
        _messages.add({'sender': 'bot', 'text': responseModel.answer});
        _history.add({'role': 'user', 'content': text});
        _history.add({'role': 'assistant', 'content': responseModel.answer});
      });
    } catch (e) {
      setState(() {
        _messages.add({'sender': 'bot', 'text': e.toString().replaceAll('Exception: ', '')});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    await _sendSpecificMessage(text);
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
      _history.clear();
      _messages.add({
        'sender': 'bot',
        'text': 'مرحباً بك! أنا مساعدك الذكي في منصة "سوقني". كيف يمكنني مساعدتك؟'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.82,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // الهيدر الكحلي
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF0E216C),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.smart_toy_rounded, color: Color(0xFFFE8511), size: 26),
                    const Column(
                      children: [
                        Text(
                          'المساعد الذكي منصة سوقني',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'متصل ومستعد للإجابة على جميع استفساراتك',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),

              // منطقة الرسائل
              Expanded(
                child: _isCheckingServer
                    ? const Center(child: CircularProgressIndicator(color: Color(0xFFFE8511)))
                    : !_isServerAvailable
                        ? const Center(child: Text('الخدمة غير متاحة حالياً.'))
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: _messages.length,
                            itemBuilder: (context, index) {
                              final message = _messages[index];
                              final isUser = message['sender'] == 'user';

                              if (isUser) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 6),
                                    padding: const EdgeInsets.all(12),
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0E216C),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      message['text'] ?? '',
                                      style: const TextStyle(color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF0E216C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.smart_toy_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF8F9FA),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.grey.shade200),
                                          ),
                                          child: Text(
                                            message['text'] ?? '',
                                            style: const TextStyle(color: Colors.black87, fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
              ),

              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: LinearProgressIndicator(color: Color(0xFFFE8511)),
                ),

              // قسم الأسئلة السريعة المقترحة
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                color: const Color(0xFF0E216C).withOpacity(0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'أسئلة سريعة:',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0E216C)),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 38,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _quickQuestions.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final question = _quickQuestions[index];
                          return InkWell(
                            onTap: _isLoading ? null : () => _sendSpecificMessage(question),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: const Color(0xFFFE8511).withOpacity(0.6)),
                              ),
                              child: Text(
                                question,
                                style: const TextStyle(fontSize: 12, color: Color(0xFF0E216C), fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // شريط الكتابة السفلي
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, -2))
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        enabled: !_isLoading,
                        decoration: InputDecoration(
                          hintText: 'اكتب سؤالك هنا...',
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        onSubmitted: (_) => _isLoading ? null : _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.grey, size: 22),
                      onPressed: _clearChat,
                      tooltip: 'محادثة جديدة',
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: _isLoading ? null : _sendMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFE8511),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.send, size: 16),
                      label: const Text(
                        'إرسال',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}