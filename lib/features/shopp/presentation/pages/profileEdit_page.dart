import 'package:flutter/material.dart';
import 'package:shopp/features/shopp/presentation/widgets/yellow_button.dart';

class ProfileEditPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E7E7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Edit profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                'assets/images/xola.png',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
                  cursorColor: const Color(0xFF6E75A8),
                  controller: nameController,
                  decoration: textfieldDecoration('Name'),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  cursorColor: const Color(0xFF6E75A8),
                  controller: emailController,
                  decoration: textfieldDecoration('email'),
                  obscureText: false,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const YellowButton(title: 'save data'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
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

  InputDecoration textfieldDecoration(String hint) {
    return InputDecoration(enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1.5, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)), errorBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Colors.red), borderRadius: BorderRadius.circular(20)), hintText: hint, hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600));
  }
}
