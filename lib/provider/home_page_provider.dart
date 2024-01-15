import 'package:ciperschools_assignment_app/database/dbHelper.dart';
import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {
  double totalAddExpense = 0;
  double totalIncome = 0;
  void updateAddExpenseTotal() async {
    double total = await DatabaseHelper.calculateAddExpenseTotalAmount();

    totalAddExpense = total;
    notifyListeners();
  }

  void updateAIncomeTotal() async {
    double total = await DatabaseHelper.calculateIncomeTotalAmount();

    totalIncome = total;
    notifyListeners();
  }
}
