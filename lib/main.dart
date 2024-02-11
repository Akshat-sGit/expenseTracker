import 'package:expense_tracker/firebase_options.dart';
import 'package:expense_tracker/view/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/view/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: WelcomeScreen.id,  
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        Login.id: (context) => const Login(),
      }, 
    );

  }
}