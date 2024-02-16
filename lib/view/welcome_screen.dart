import 'package:expense_tracker/view/home_screen.dart';
import 'package:expense_tracker/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 50.0),
              child: Expanded(
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Expense Tracker',
                        textStyle: GoogleFonts.archivoBlack(
                          fontSize: 25.0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 20.0, bottom: 20.0, right: 20.0),
                      child: Text(
                        'Sign Up ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => email = value,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => password = value,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          try {
                            final newUser =
                                _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
                            if (newUser != _auth.currentUser) {
                              Navigator.pushNamed(context, MainScreen.id);
                            }
                            emailController.clear();
                            passwordController.clear(); 
                          } catch (e) {
                            // ignore: avoid_print
                            print(e);
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 20.0,
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'or sign up with:',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          icon: Image.asset(
                            'assets/images/google.png',
                            height: 32.0,
                            width: 32.0,
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
