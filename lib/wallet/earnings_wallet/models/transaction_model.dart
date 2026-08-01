class TransactionModel {
  final String title;

  final String date;

  final String amount;

  final String type;

  final String status;

  final bool isIncome;

  TransactionModel({
    required this.title,

    required this.date,

    required this.amount,

    required this.type,

    required this.status,

    required this.isIncome,
  });
}
