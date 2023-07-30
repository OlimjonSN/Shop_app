import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E7E7),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: const Color(0xFF6E75A8),
              controller: emailController,
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), labelText: 'Email', labelStyle: const TextStyle(color: Color(0xFF6E75A8))),
            ),
            const SizedBox(height: 16.0),
            TextField(
              cursorColor: const Color(0xFF6E75A8),
              controller: passwordController,
              decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), labelText: 'Password', labelStyle: const TextStyle(color: Color(0xFF6E75A8))),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF9B6239)),
              onPressed: () {
                // Perform login logic here
                String email = emailController.text;
                String password = passwordController.text;
                // Add your authentication logic or API call here
                // For simplicity, let's just print the entered credentials
                print('Email: $email');
                print('Password: $password');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
