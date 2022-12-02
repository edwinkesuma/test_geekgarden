import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_text_field.dart';
import 'package:test_geekgarden/feature/products/controller/product_controller.dart';
import 'package:test_geekgarden/feature/products/screens/result_product_screen.dart';
import 'package:test_geekgarden/feature/products/service/products_api.dart';

class AddEditProductScreen extends StatelessWidget {
  final productController = Get.find<ProductController>();
  final bool isEdit;
  final String warning;
  AddEditProductScreen({
    Key? key,
    required this.isEdit,
    required this.warning,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Produk" : "Tambah Produk"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            isEdit
                ? Column(
                    children: [
                      CustomTextField(
                        title: "Id",
                        hintText: "1",
                        controller: idController,
                        isNumber: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                : const SizedBox(),
            CustomTextField(
              controller: nameController,
              title: "Nama:",
              hintText: "Baju",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: priceController,
              title: "Harga:",
              hintText: "10000",
              isNumber: true,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: imageController,
              title: "Url gambar:",
              hintText: "https://picsum.photos/200/300.",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: descriptionController,
              title: "Deskripsi:",
              hintText: "Produk yang sangat bagus.",
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: categoryController,
              title: "Kategori:",
              hintText: "Pakaian pria",
            ),
            const SizedBox(
              height: 75,
            ),
            CustomButton(
              onPress: () async {
                if (isEdit) {
                  if (idController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      categoryController.text.isNotEmpty) {
                    await productController.updateDataProduct(
                        id: idController.text,
                        title: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        category: categoryController.text,
                        onFinish: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultProductScreen(
                                  title: "Hasil Edit Produk",
                                  ratingNull: true,
                                ),
                              ));
                        });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tolong isi semua form'),
                        backgroundColor: (Colors.black),
                      ),
                    );
                  }
                } else {
                  if (nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      categoryController.text.isNotEmpty) {
                    await productController.addDataProduct(
                        title: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        category: categoryController.text,
                        onFinish: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultProductScreen(
                                  title: "Hasil Tambah Produk",
                                  ratingNull: true,
                                ),
                              ));
                        });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Tolong isi semua form'),
                        backgroundColor: (Colors.black),
                      ),
                    );
                  }
                }
              },
              title: isEdit ? "Edit" : "Tambah",
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                    text: 'Note from fakestoreapi.com\'s docs: ',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: warning,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.normal),
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
