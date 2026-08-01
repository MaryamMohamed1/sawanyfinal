import 'package:dio/dio.dart';
import 'ai_chat_model.dart';

class AiApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://path-thud-isolation.ngrok-free.dev',
      headers: {
        'ngrok-skip-browser-warning': 'true',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<bool> checkHealth() async {
    try {
      final response = await _dio.get('/api/health');
      if (response.statusCode == 200 && response.data['status'] == 'ok') {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<AiChatModel> sendMessage(String message, List<Map<String, String>> history) async {
    try {
      final response = await _dio.post(
        '/api/chat',
        data: {
          'message': message,
          'history': history,
        },
      );

      if (response.statusCode == 200) {
        return AiChatModel.fromJson(response.data);
      } else {
        throw Exception('فشل في استقبال الرد من الخادم');
      }
    } on DioException catch (e) {
      String errorMsg = 'حدث خطأ في الاتصال';
      if (e.response != null && e.response?.data != null) {
        if (e.response?.data is Map) {
          errorMsg = e.response?.data['detail'] ?? errorMsg;
        }
      }
      throw Exception(errorMsg);
    }
  }
}