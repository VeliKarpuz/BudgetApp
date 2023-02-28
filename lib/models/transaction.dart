class Transaction {
  final String id;
  final String category;
  final double amount;
  final String detail;
  final DateTime date;

  Transaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.detail,
    required this.date,
  });
}
