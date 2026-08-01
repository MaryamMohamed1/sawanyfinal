class AiChatModel {
  final String answer;
  final List<ChatSource> sources;

  AiChatModel({
    required this.answer,
    required this.sources,
  });

  factory AiChatModel.fromJson(Map<String, dynamic> json) {
    var sourcesList = json['sources'] as List? ?? [];
    List<ChatSource> parsedSources =
        sourcesList.map((sourceJson) => ChatSource.fromJson(sourceJson)).toList();

    return AiChatModel(
      answer: json['answer'] ?? '',
      sources: parsedSources,
    );
  }
}

class ChatSource {
  final String type;
  final String text;

  ChatSource({
    required this.type,
    required this.text,
  });

  factory ChatSource.fromJson(Map<String, dynamic> json) {
    return ChatSource(
      type: json['type'] ?? '',
      text: json['text'] ?? '',
    );
  }
}