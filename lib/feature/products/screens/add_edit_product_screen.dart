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
  AddEditProductScreen({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Produk" : "Tambah Produk"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            isEdit
                ? Column(
                    children: [
                      CustomTextField(
                        title: "Id",
                        hintText: "1",
                        controller: idController,
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
                !isEdit
                    ? await productController.addDataProduct(
                        title: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        category: categoryController.text,
                      )
                    : await productController.updateDataProduct(
                        id: idController.text,
                        title: nameController.text,
                        price: priceController.text,
                        description: descriptionController.text,
                        category: categoryController.text,
                      );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultProductScreen(),
                    ));
              },
              title: isEdit ? "Edit" : "Tambah",
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  text: 'Note from fakestoreapi.com docs: ',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'If you send an object like the code above, it will return you an object with a new id. remember that nothing in real will insert into the database. so if you want to access the new id you will get a 404 error.',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.normal),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
