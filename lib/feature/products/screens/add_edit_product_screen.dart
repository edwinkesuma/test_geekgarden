import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            SizedBox(
              height: 30.h,
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
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  )
                : const SizedBox(),
            CustomTextField(
              controller: nameController,
              title: "Nama:",
              hintText: "Baju",
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              controller: priceController,
              title: "Harga:",
              hintText: "10000",
              isNumber: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              controller: imageController,
              title: "Url gambar:",
              hintText: "https://i.pravatar.cc",
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              controller: descriptionController,
              title: "Deskripsi:",
              hintText: "Produk yang sangat bagus.",
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              controller: categoryController,
              title: "Kategori:",
              hintText: "Pakaian pria",
            ),
            SizedBox(
              height: 75.h,
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
                        image: imageController.text,
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
                        image: imageController.text,
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
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
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
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
