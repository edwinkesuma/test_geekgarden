import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(
                              productController.product[0].image!,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$${productController.product[0].price.toString()}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          !ratingNull
                              ? Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    Text(
                                        "${productController.product[0].rating?.rate}"),
                                  ],
                                )
                              : SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productController.product[0].title.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Kategori",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                              productController.product[0].category.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Produk id",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(productController.product[0].id.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Deskripsi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(productController.product[0].description
                              .toString()),
                          // Row(
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: const [
                          //         Text(
                          //           "id:",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           "Nama",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           "Harga",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           "Deskripsi",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           "Ketgori",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //       ],
                          //     ),
                          //     const SizedBox(
                          //       width: 15,
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           ": ${productController.product[0].id}",
                          //           style: const TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         const SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           ": ${productController.product[0].title}",
                          //           style: const TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         const SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           ": ${productController.product[0].price}",
                          //           style: const TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         const SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(
                          //           ": ${productController.product[0].description}",
                          //           style: const TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //         const SizedBox(
                          //           height: 20,
                          //         ),
                          //         Text(": ${productController.product[0].category}",
                          //             style: const TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 20,
                          //             )),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                          const SizedBox(
                            height: 40,
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
                              : SizedBox(),
                        ],
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
