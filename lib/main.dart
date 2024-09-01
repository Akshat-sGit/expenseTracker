import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/view/add_expense_screen.dart';
import 'package:expense_tracker/view/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, WidgetsFlutterBinding, runApp;
import 'package:expense_tracker/view/home_screen.dart';
import 'view/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'expenseTracker',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        MainScreen.id: (context) => const MainScreen(),
        AddExpense.id:(context) => const AddExpense(),
      },
    );
  }
}