import 'package:ciperschools_assignment_app/database/dbHelper.dart';
import 'package:ciperschools_assignment_app/model/expense_model.dart';
import 'package:ciperschools_assignment_app/model/income_model.dart';
import 'package:ciperschools_assignment_app/provider/home_page_provider.dart';
import 'package:ciperschools_assignment_app/widget/category_icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  late HomePageProvider homePageProvider;

  @override
  void initState() {
    super.initState();
    homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    homePageProvider.updateAddExpenseTotal();
    homePageProvider.updateAIncomeTotal();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<HomePageProvider>(builder:
        (BuildContext context, HomePageProvider homeProvider, Widget? child) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              width: width,
              height: 312,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.06, -1.00),
                  end: Alignment(0.06, 1),
                  colors: [Color(0xFFFFF6E5), Color(0x00F7ECD7)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:
                                          AssetImage("assets/images/img_6.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0xFFAD00FF),
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                        spreadRadius: 3,
                                      ),
                                      BoxShadow(
                                        color: Color(0xFFF5F5F5),
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 96),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 8, bottom: 8),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFF1F1FA)),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.keyboard_arrow_down_rounded)
                                  ],
                                ),
                                Text(
                                  'Month',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF212224),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 76),
                          Container(
                            width: 32,
                            height: 32,
                            padding: const EdgeInsets.only(
                              top: 3.58,
                              left: 5.96,
                              right: 5.96,
                              bottom: 4,
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20.08,
                                  height: 24.42,
                                  child: Icon(
                                    Icons.notifications,
                                    color: Color(0xFF7E3DFF),
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Account Balance',
                      style: TextStyle(
                        color: Color(0xFF90909F),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 258,
                      child: Text(
                        '₹${homeProvider.totalIncome - homeProvider.totalAddExpense}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF161719),
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 158,
                          height: 80,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF00A86B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 46,
                                height: 46,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFBFBFB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 42,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_downward_sharp,
                                            color: Colors.green,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.wallet,
                                            color: Colors.green,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Income',
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '₹${homeProvider.totalIncome}',
                                    style: const TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 158,
                          height: 80,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFD3C4A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 46,
                                height: 46,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFFBFBFB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 42,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Column(
                                        children: [
                                          Icon(
                                            Icons.arrow_upward_sharp,
                                            color: Colors.red,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.wallet,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Expenses',
                                    style: TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '₹${homeProvider.totalAddExpense}',
                                    style: const TextStyle(
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: 34,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFFBFBFB)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFCEED3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Today',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFCAC12),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.80,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Week',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF90909F),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.80,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Month',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF90909F),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Color(0xFF90909F),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Recent Transaction',
                    style: TextStyle(
                      color: Color(0xFF292B2D),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 78,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEE5FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      'See All',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7E3DFF),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: width,
                child: FutureBuilder<List<List<dynamic>>>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        (snapshot.data![0].isEmpty &&
                            snapshot.data![1].isEmpty)) {
                      return const Center(
                        child: Text('No transactions recorded '),
                      );
                    } else {
                      List<List<dynamic>> data = snapshot.data!;
                      List<Expense> expenses = data[0] as List<Expense>;
                      List<Income> incomes = data[1] as List<Income>;

                      List<dynamic> transactions = [...expenses, ...incomes];
                      transactions.sort((a, b) => b.date.compareTo(a.date));
                      if (kDebugMode) {
                        print('Number of transactions: ${transactions.length}');
                      }

                      return ListView.builder(
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          if (transactions[index] is Expense) {
                            Expense expense = transactions[index] as Expense;
                            return buildTransactionTile(expense);
                          } else if (transactions[index] is Income) {
                            Income income = transactions[index] as Income;
                            return buildTransactionTile(income);
                          }

                          return const Text('Error Kony');
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Future<List<List<dynamic>>> fetchData() async {
    List<Expense> expenses = await DatabaseHelper.getExpenses();
    List<Income> incomes = await DatabaseHelper.getIncome();
    return [expenses, incomes];
  }

  Widget buildTransactionTile(dynamic transaction) {
    IconData iconData =
        icons[transaction.category] ?? Icons.miscellaneous_services;
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(transaction.id.toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        if (transaction is Expense) {
          DatabaseHelper.deleteExpense(transaction.id!);
        } else if (transaction is Income) {
          DatabaseHelper.deleteIncome(transaction.id!);
        }
        homePageProvider.updateAddExpenseTotal();
        homePageProvider.updateAIncomeTotal();
      },
      child: ListTile(
        leading: Container(
          width: 52,
          height: 52,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: const Color(0xFFEEE5FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Icon(
            iconData,
            color: transaction is Expense ? Colors.red : Colors.green,
            size: 32,
          ),
        ),
        title: Text(
          transaction.category,
          style: const TextStyle(
            color: Color(0xFF292B2D),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        subtitle: Text(
          transaction.description,
          style: const TextStyle(
            color: Color(0xFF90909F),
            fontSize: 13,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${transaction is Expense ? '-' : '+'} ${transaction.amount}',
              style: TextStyle(
                color: transaction is Expense ? Colors.red : Colors.green,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            Text(
              DateFormat('h:mm a').format(transaction.date),
              style: const TextStyle(
                color: Color(0xFF90909F),
                fontSize: 13,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
