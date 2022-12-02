import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_geekgarden/feature/products/service/products_api.dart';
import 'package:test_geekgarden/models/product_model.dart';

import '../../../models/list_products_model.dart';

class ProductController extends GetxController {
  RxList<ListProductModel> products = <ListProductModel>[].obs;

  RxList<ProductModel> product = <ProductModel>[].obs;

  RxBool loadingGetProducts = false.obs;

  getDataProduct() async {
    await ProductsApi().getDataProducts().then((data) {
      loadingGetProducts.value = true;
      log(loadingGetProducts.toString(), name: "List Produk");

      var responseJson = jsonDecode(data.body);

      if (responseJson != null) {
        for (var item in responseJson) {
          products.add(ListProductModel.fromJson(item));
        }
      }
      loadingGetProducts.value = false;
      log(loadingGetProducts.toString(), name: "List Produk");
    });
  }

  addDataProduct(
      {required String title,
      required String price,
      required String description,
      required String category}) async {
    await ProductsApi()
        .addDataProduct(
            title: title,
            price: price,
            description: description,
            category: category)
        .then((data) {
      var responseJson = jsonDecode(data.body);
      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);

      log(product.toString(), name: "products");
      // product.value = responseJson;
    });
  }

  updateDataProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String category,
  }) async {
    await ProductsApi()
        .updateDataProduct(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category)
        .then((data) {
      var responseJson = jsonDecode(data.body);
      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);
    });
  }

  deleteDataProduct({required String id}) async {
    await ProductsApi().deleteProduct(id).then((data) {
      var responseJson = jsonDecode(data.body);

      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);
    });
  }
}
