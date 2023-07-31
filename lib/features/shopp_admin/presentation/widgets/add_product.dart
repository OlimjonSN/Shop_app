// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shopp/features/shopp/data/model/product_model.dart';

import '../providers/shopp_admin_procider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late XFile? pickedFile;
  ProductModel productModel = ProductModel(
    productName: '',
    description: '',
    price: 0,
    imageUrl: '',
    categoryName: '',
    createdAt: 'as',
  );
  Future selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      ;
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
        actions: [
          IconButton(
            onPressed: () {
              ProductModel productModel = ProductModel(
                productName: productNameController.text,
                description: descriptionController.text,
                price: int.parse(priceController.text),
                imageUrl:'' ,
                categoryName: categoryNameController.text,
                createdAt: '2023',
              );
              Provider.of<ShoppAdminProvider>(context, listen: false).addProduct(productModel, pickedFile!);
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
              controller: productNameController,
              decoration: inputDecoration('Product name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: categoryNameController,
              decoration: inputDecoration('Category name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: priceController,
              decoration: inputDecoration('Price'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
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
