import 'package:firebase_auth_example/auth/auth_server.dart';
import 'package:firebase_auth_example/screen/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  final String password;
  const HomeScreen({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              "${email}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              "${password}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout(context);
                goToLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}
