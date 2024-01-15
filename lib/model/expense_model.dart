class Expense {
  int? id;
  String description;
  double amount;
  String category;
  DateTime date;

  Expense(
      {this.id,
      required this.description,
      required this.amount,
      required this.category,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
    };
  }
}
