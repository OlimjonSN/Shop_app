// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopp_admin_procider.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9A62),
        title: const Text('Add Category'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ShoppAdminProvider>(context, listen: false).createCategory(nameController.text);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: inputDecoration('category name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: inputDecoration('description'),
            ),
            // const SizedBox(height: 15),
            // FilledButton(onPressed: selectFile, child: const Text('select File'))
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String name) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1.5, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 3, color: Color(0xFFFF9A62)), borderRadius: BorderRadius.circular(20)),
      hintText: name,
      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
    );
  }
}
