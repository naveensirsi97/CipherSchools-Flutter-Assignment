import 'package:ciperschools_assignment_app/database/dbHelper.dart';
import 'package:ciperschools_assignment_app/model/expense_model.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/creatorBottomBar.dart';
import 'package:ciperschools_assignment_app/widget/category_icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController descriptionController = TextEditingController();
  String selectedCategory = '';
  String selectedWallet = '';

  List<String> wallets = ['20', '50', '100', '200', '500', '1000'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 68.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.5,
                      ),
                      const Text(
                        'Expense',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 170,
                ),
                const Text(
                  'How much?',
                  style: TextStyle(
                    color: Color(0xFFFBFBFB),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      '₹ ',
                      style: TextStyle(
                        color: Color(0xFFFBFBFB),
                        fontSize: 64,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Text(
                      selectedWallet,
                      style: const TextStyle(
                        color: Color(0xFFFBFBFB),
                        fontSize: 64,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF676767).withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCategory.isNotEmpty
                              ? selectedCategory
                              : null,
                          style: const TextStyle(
                              color: Color(0xFF676767), fontSize: 16),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 32,
                            color: Colors.grey,
                          ),
                          hint: const Text(
                            ' Category',
                            style: TextStyle(color: Color(0xFF676767)),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                          items: icons.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      style: const TextStyle(
                        color: Color(0xFF676767),
                        fontSize: 16,
                      ),
                      cursorColor: const Color(0xFF676767),
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: const TextStyle(
                          color: Color(0xFF676767),
                          fontSize: 15,
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 10, right: 10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: const Color(0xFF676767).withOpacity(0.9)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: const Color(0xFF676767).withOpacity(0.2)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF676767).withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value:
                              selectedWallet.isNotEmpty ? selectedWallet : null,
                          style: const TextStyle(
                              color: Color(0xFF676767), fontSize: 16),
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined,
                              size: 32, color: Colors.grey),
                          hint: const Text(
                            ' Wallet',
                            style: TextStyle(color: Color(0xFF676767)),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedWallet = newValue!;
                            });
                          },
                          items: wallets
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                  value), // Display only the name without '$' sign
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Divider(),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: double.infinity, // Make it full width
                      height: 50.0, // Set your desired height
                      child: ElevatedButton(
                        onPressed: () {
                          if (descriptionController.text.isNotEmpty &&
                              selectedCategory.isNotEmpty &&
                              selectedWallet.isNotEmpty) {
                            Expense expense = Expense(
                              description: descriptionController.text,
                              amount: double.parse(selectedWallet),
                              category: selectedCategory,
                              date: DateTime.now(),
                            );
                            DatabaseHelper.insertExpense(expense);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreatorBottomBar(),
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          } else {
                            if (kDebugMode) {
                              print('Please fill in all fields.');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(
                              0xFF7E3DFF), // Set your desired background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                16.0), // Set border radius
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
