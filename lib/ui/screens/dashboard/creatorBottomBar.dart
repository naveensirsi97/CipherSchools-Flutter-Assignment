// import 'package:ciperschools_assignment_app/ui/screens/dashboard/budget.dart';
// import 'package:ciperschools_assignment_app/ui/screens/dashboard/home_page.dart';
// import 'package:ciperschools_assignment_app/ui/screens/dashboard/profile.dart';
// import 'package:ciperschools_assignment_app/ui/screens/dashboard/transaction.dart';
// import 'package:flutter/material.dart';
//
// class CreatorBottomBar extends StatefulWidget {
//   const CreatorBottomBar({super.key});
//
//   @override
//   State<CreatorBottomBar> createState() => _CreatorBottomBarState();
// }
//
// class _CreatorBottomBarState extends State<CreatorBottomBar> {
//   int currentTab = 0;
//   List<Widget> creatorScreenItems = [
//     const HomePage(),
//     const Transaction(),
//     const Budget(),
//     const Profile(),
//   ];
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = const HomePage();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         bucket: bucket,
//         child: currentScreen,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//         onPressed: () {},
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: SizedBox(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   MaterialButton(
//                     minWidth: 30,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = HomePage();
//                         currentTab = 0;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.home,
//                           color: currentTab == 0 ? Colors.blue : Colors.grey,
//                         ),
//                         Text(
//                           'Home',
//                           style: TextStyle(
//                             color: currentTab == 0 ? Colors.blue : Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 30,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = const Transaction();
//                         currentTab = 1;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.transfer_within_a_station,
//                           color: currentTab == 1 ? Colors.blue : Colors.grey,
//                         ),
//                         Text(
//                           'Transaction',
//                           style: TextStyle(
//                             color: currentTab == 1 ? Colors.blue : Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   MaterialButton(
//                     minWidth: 30,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = Budget();
//                         currentTab = 2;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.track_changes,
//                           color: currentTab == 2 ? Colors.blue : Colors.grey,
//                         ),
//                         Text(
//                           'Budget',
//                           style: TextStyle(
//                             color: currentTab == 2 ? Colors.blue : Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     minWidth: 30,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = Profile();
//                         currentTab = 3;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.person,
//                           color: currentTab == 3 ? Colors.blue : Colors.grey,
//                         ),
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                             color: currentTab == 3 ? Colors.blue : Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ciperschools_assignment_app/ui/screens/add_expense_screen.dart';
import 'package:ciperschools_assignment_app/ui/screens/add_income_screen.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/budget.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/home_page.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/profile.dart';
import 'package:ciperschools_assignment_app/ui/screens/dashboard/transaction.dart';
import 'package:ciperschools_assignment_app/widget/exit_dialog.dart';
import 'package:flutter/material.dart';

class CreatorBottomBar extends StatefulWidget {
  const CreatorBottomBar({Key? key}) : super(key: key);

  @override
  State<CreatorBottomBar> createState() => _CreatorBottomBarState();
}

class _CreatorBottomBarState extends State<CreatorBottomBar> {
  int currentNavIndex = 0;
  final List<Widget> navBody = [
    const HomePage(),
    const Transaction(),
    const Budget(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return exitDialog(context);
            });
        return false;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          mini: true,
          backgroundColor: const Color(0xFF7E3DFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _showAddExpenseBottomSheet(context);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentNavIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7E3DFF),
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.transfer_within_a_station),
                label: 'Transaction'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: 'Budget'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          onTap: (value) {
            setState(() {
              currentNavIndex = value;
            });
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: navBody[currentNavIndex],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddExpenseScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(
                        0xFF7E3DFF), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Set border radius
                    ),
                  ),
                  child: const Text(
                    'Add Expense',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddIncomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(
                        0xFF7E3DFF), // Set your desired background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16.0), // Set border radius
                    ),
                  ),
                  child: const Text(
                    'Add Income',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
