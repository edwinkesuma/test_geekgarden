import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_text_field.dart';
import 'package:test_geekgarden/feature/products/controller/product_controller.dart';
import 'package:test_geekgarden/feature/products/screens/result_product_screen.dart';

class DeleteProduct extends StatelessWidget {
  final productController = Get.find<ProductController>();
  DeleteProduct({Key? key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hapus Produk"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: textEditingController,
              title: "ID",
              hintText: "1",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPress: () async {
                await productController.deleteDataProduct(
                    id: textEditingController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultProductScreen(),
                    ));
              },
              title: "Hapus",
            ),
          ],
        ),
      ),
    );
  }
}
