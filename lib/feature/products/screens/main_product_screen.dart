import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/feature/products/controller/product_controller.dart';
import 'package:test_geekgarden/feature/products/screens/add_edit_product_screen.dart';
import 'package:test_geekgarden/feature/products/screens/delete_product_screen.dart';
import 'package:test_geekgarden/feature/products/screens/show_all_products.dart';

class MainProductScreen extends StatelessWidget {
  final productsController = Get.find<ProductController>();
  MainProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geek Garden"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                title: "Tampilkan data produk",
                onPress: () async {
                  await productsController.getDataProduct();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAllProducts(),
                      ));
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Tambah produk",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditProductScreen(
                          isEdit: false,
                        ),
                      ));
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Edit produk",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddEditProductScreen(isEdit: true),
                      ));
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: "Hapus produk",
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeleteProduct(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
