import 'dart:async';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/expense_dao.dart';
import 'package:expense_record/utils/datetime_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Expense])
abstract class AppDatabase extends FloorDatabase {
  ExpenseDao get expenseDao;
}

Future<AppDatabase> getDatabase(String name) {
  return $FloorAppDatabase.databaseBuilder(name).build();
}
