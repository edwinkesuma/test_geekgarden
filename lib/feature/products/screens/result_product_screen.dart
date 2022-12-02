import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/feature/products/screens/main_product_screen.dart';

import '../controller/product_controller.dart';

class ResultProductScreen extends StatelessWidget {
  final productController = Get.find<ProductController>();
  ResultProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Tambah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "id",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nama",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Harga",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Deskripsi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ketgori",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ": ${productController.product[0].id}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ": ${productController.product[0].title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ": ${productController.product[0].price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ": ${productController.product[0].description}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(": ${productController.product[0].category}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onPress: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MainProductScreen()),
                    (Route<dynamic> route) => false);
              },
              title: "Kembali ke Beranda",
            ),
          ],
        ),
      ),
    );
  }
}
