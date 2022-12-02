import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              isNumber: true,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onPress: () async {
                if (textEditingController.text.isNotEmpty) {
                  await productController.deleteDataProduct(
                      onFinish: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultProductScreen(
                                title: "Produk yang dihapus",
                                ratingNull: false,
                              ),
                            ));
                      },
                      id: textEditingController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tolong isi semua form'),
                      backgroundColor: (Colors.black),
                    ),
                  );
                }
              },
              title: "Hapus",
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: RichText(
                text: const TextSpan(
                    text: 'Note from fakestoreapi.com\'s docs: ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'The product will not be deleted on the database. but if you sent data successfully it will return you the fake deleted product.',
                        style: TextStyle(
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
