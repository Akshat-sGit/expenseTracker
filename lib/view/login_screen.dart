import 'package:flutter/material.dart'; 

class Login extends StatelessWidget {

  static String id = 'login_screen';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold( 
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
