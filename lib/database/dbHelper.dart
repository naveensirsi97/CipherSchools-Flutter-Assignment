import 'package:ciperschools_assignment_app/model/expense_model.dart';
import 'package:ciperschools_assignment_app/model/income_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database database;

  static Future createDatabase() async {
    String dbName = 'school.db';
    String path = await getDatabasesPath();
    String dbPath = join(path, dbName);
    database =
        await openDatabase(dbPath, version: 1, onCreate: (database, version) {
      database.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        amount REAL,
        category TEXT,
        date TEXT
      )
    ''');
      database.execute('''
      CREATE TABLE income(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        description TEXT,
        amount REAL,
        category TEXT,
        date TEXT
      )
    ''');
    });
  }

  static Future insertExpense(Expense expense) async {
    await database.insert('expenses', expense.toMap());
  }

  static Future insertIncome(Income income) async {
    await database.insert('income', income.toMap());
  }

  static Future<List<Expense>> getExpenses() async {
    List<Map<String, dynamic>> maps = await database.query('expenses');
    return List.generate(maps.length, (i) {
      return Expense(
        id: maps[i]['id'],
        description: maps[i]['description'],
        amount: maps[i]['amount'],
        category: maps[i]['category'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  static Future<List<Income>> getIncome() async {
    List<Map<String, dynamic>> maps = await database.query('income');
    return List.generate(maps.length, (i) {
      return Income(
        id: maps[i]['id'],
        description: maps[i]['description'],
        amount: maps[i]['amount'],
        category: maps[i]['category'],
        date: DateTime.parse(maps[i]['date']),
      );
    });
  }

  static Future<void> deleteExpense(int id) async {
    await database.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteIncome(int id) async {
    await database.delete('income', where: 'id = ?', whereArgs: [id]);
  }

  static Future<double> calculateAddExpenseTotalAmount() async {
    List<Map<String, dynamic>> maps =
        await database.query('expenses', columns: ['amount']);

    double total = 0;
    for (final map in maps) {
      total += map['amount'];
    }

    return total;
  }

  static Future<double> calculateIncomeTotalAmount() async {
    List<Map<String, dynamic>> maps =
        await database.query('income', columns: ['amount']);

    double total = 0;
    for (final map in maps) {
      total += map['amount'];
    }

    return total;
  }
}
