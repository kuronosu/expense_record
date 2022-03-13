import 'dart:async';
import 'package:expense_record/Expenses/model/expense.dart';
import 'package:expense_record/Expenses/repository/expense_dao.dart';
import 'package:expense_record/utils/datetime_converter.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

const dbName = 'expense.db';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Expense])
abstract class AppDatabase extends FloorDatabase {
  static AppDatabase? _instance;
  ExpenseDao get expenseDao;

  static AppDatabase getInstance() {
    assert(_instance != null, 'The database has not yet been initialized');
    return _instance!;
  }

  static Future<AppDatabase> getInstanceFuture() {
    if (_instance == null) {
      return $FloorAppDatabase
              .databaseBuilder(dbName)
              .build()
              .then((value) => _instance = value);
    }
    return Future.value(_instance!);
  }
}
