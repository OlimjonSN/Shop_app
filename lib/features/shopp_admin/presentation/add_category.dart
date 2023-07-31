import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  PlatformFile? pickedFile;
  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File((result.files.single.path).toString());
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9A62),
        title: const Text('Add Category'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: inputDecoration('category name'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: inputDecoration('description'),
            ),
            SizedBox(height: 15),
            FilledButton(onPressed: selectFile, child: Text('select File'))
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
