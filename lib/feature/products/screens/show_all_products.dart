import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_loading.dart';
import 'package:test_geekgarden/feature/products/screens/result_product_screen.dart';

import '../controller/product_controller.dart';

class ShowAllProducts extends StatelessWidget {
  final productsController = Get.find<ProductController>();
  ShowAllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Produk"),
      ),
      body: Obx(
        () => Stack(
          children: [
            productsController.loadingGetProducts.value == true
                ? const SizedBox()
                : ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      height: 1.h,
                      color: Colors.grey,
                    ),
                    itemCount: productsController.products.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          await productsController.getSingleProduct(
                              onFinish: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultProductScreen(
                                        detailProduct: true,
                                        ratingNull: false,
                                        title: "Detail Produk",
                                      ),
                                    ));
                              },
                              id: productsController.products[index].id
                                  .toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: Image.network(
                                  productsController.products[index].image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Name:"),
                                  Text("price:"),
                                  Text("desc:"),
                                  Text("category:"),
                                  Text("rating:"),
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ": ${productsController.products[index].title}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ": ${productsController.products[index].price}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ": ${productsController.products[index].description}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ": ${productsController.products[index].category}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ": ${productsController.products[index].rating!.rate}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            productsController.loadingGetProducts.value == true
                ? const CustomLoading()
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
