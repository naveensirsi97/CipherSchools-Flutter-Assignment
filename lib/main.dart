import 'package:ciperschools_assignment_app/database/dbHelper.dart';
import 'package:ciperschools_assignment_app/provider/home_page_provider.dart';
import 'package:ciperschools_assignment_app/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.createDatabase();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyA3jb1SkRnmQYQAcOapHmJ8Dyq70-S6ChQ',
          appId: '1:828816694647:android:ca98ec118915bb1e641572',
          messagingSenderId: '828816694647',
          projectId: 'ciperschools'));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
