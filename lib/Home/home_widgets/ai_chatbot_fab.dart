import 'package:flutter/material.dart';
import '../../AIChatbot/ai_chat_screen.dart';

class AiChatbotFab extends StatelessWidget {
  const AiChatbotFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // فتح شاشة الشات المنبثقة فور الضغط على الزرار
        showDialog(
          context: context,
          builder: (context) => const AiChatScreen(),
        );
      },
      backgroundColor: const Color(0xFFFE8511),
      elevation: 4.0,
      child: const Icon(Icons.smart_toy_rounded, color: Colors.white, size: 28),
    );
  }
}
