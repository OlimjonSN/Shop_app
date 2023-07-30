import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/yellow_button.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldName('Email or Username'),
                TextField(
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                  cursorColor: const Color(0xFF6E75A8),
                  controller: emailController,
                  decoration: textfieldDecoration(Icons.email, 'Email@mail.ru'),
                ),
                const SizedBox(height: 16.0),
                textFieldName('Password'),
                TextField(
                  cursorColor: const Color(0xFF6E75A8),
                  controller: passwordController,
                  decoration: textfieldDecoration(Icons.lock, 'Password'),
                  obscureText: true,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const YellowButton(title: 'Login'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Don\'t have an account? ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14)), TextButton(onPressed: () {}, child: Text('Sign up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14)))]),
          ],
        ),
      ),
    );
  }

  Padding textFieldName(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14)),
    );
  }

  InputDecoration textfieldDecoration(icon, String hint) {
    return InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1.5, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.red), borderRadius: BorderRadius.circular(20)),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600));
  }
}
