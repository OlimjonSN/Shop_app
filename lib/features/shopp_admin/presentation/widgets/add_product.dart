// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  PlatformFile? pickedFile;
  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // File file = File((result.files.single.path).toString());
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9A62),
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: inputDecoration('Product name'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: inputDecoration('Category name'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: inputDecoration('Price'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: inputDecoration('Description'),
            ),
            const SizedBox(height: 15),
            FilledButton(onPressed: selectFile, child: const Text('select File'))
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
