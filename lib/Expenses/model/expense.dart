class Expense {
  const Expense({
    required this.description,
    required this.date,
    required this.price,
    this.img,
  });

  final String description;
  final DateTime date;
  final double price;
  final String? img;
}
