import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_loading.dart';
import 'package:test_geekgarden/feature/products/screens/main_product_screen.dart';

import '../controller/product_controller.dart';

class ResultProductScreen extends StatelessWidget {
  final bool ratingNull;
  final String title;
  bool? detailProduct = false;
  final productController = Get.find<ProductController>();
  ResultProductScreen({
    Key? key,
    required this.ratingNull,
    required this.title,
    this.detailProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (detailProduct != true) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MainProductScreen()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.pop(context);
        }

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (detailProduct != true) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => MainProductScreen()),
                    (Route<dynamic> route) => false);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Obx(
          () => Stack(
            children: [
              productController.loadingGetProducts.value == true
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                productController.product[0].image!,
                                height: 160.h,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "\$${productController.product[0].price.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.h,
                              ),
                            ),
                            !ratingNull
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 18.h,
                                      ),
                                      Text(
                                          "${productController.product[0].rating?.rate}"),
                                    ],
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              productController.product[0].title.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 1.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Text(
                              "Kategori",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(productController.product[0].category
                                .toString()),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 1.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Text(
                              "Produk id",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(productController.product[0].id.toString()),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 1.h,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Text(
                              "Deskripsi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(productController.product[0].description
                                .toString()),
                            SizedBox(
                              height: 40.h,
                            ),
                            detailProduct != true
                                ? CustomButton(
                                    onPress: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainProductScreen()),
                                          (Route<dynamic> route) => false);
                                    },
                                    title: ("Kembali ke Beranda"),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
              productController.loadingGetProducts.value == true
                  ? const CustomLoading()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
