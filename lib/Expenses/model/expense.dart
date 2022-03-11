import 'package:floor/floor.dart';

@entity
class Expense {
  const Expense({
    this.id,
    required this.description,
    required this.date,
    required this.price,
    this.img,
  });

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String description;
  final DateTime date;
  final double price;
  final String? img;
}
