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

  changeLoading(RxBool loading) {
    loading.value = !loading.value;
    log(loading.value.toString(), name: "LOADING");
  }

  getDataProduct({required Function onFinish}) async {
    log("fetching data");
    onFinish();
    changeLoading(loadingGetProducts);
    await ProductsApi().getDataProducts().then((data) {
      var responseJson = jsonDecode(data.body);

      if (responseJson != null) {
        for (var item in responseJson) {
          products.add(ListProductModel.fromJson(item));
        }
      }
      changeLoading(loadingGetProducts);
    });
  }

  getSingleProduct({required String id, required Function onFinish}) async {
    log("fetch getSingleProduct");
    changeLoading(loadingGetProducts);
    onFinish();
    await ProductsApi().getSingleProduct(id: id).then((data) {
      var responseJson = jsonDecode(data.body);
      log(responseJson.toString(), name: "responsejson");

      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);
      changeLoading(loadingGetProducts);
    });
  }

  addDataProduct(
      {required String title,
      required String price,
      required String description,
      required String category,
      String? image,
      required Function onFinish}) async {
    changeLoading(loadingGetProducts);
    onFinish();
    await ProductsApi()
        .addDataProduct(
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    )
        .then((data) {
      var responseJson = jsonDecode(data.body);
      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);

      log(jsonEncode(product), name: "products");
      // product.value = responseJson;
      changeLoading(loadingGetProducts);
    });
  }

  updateDataProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String category,
    String? image,
    required Function onFinish,
  }) async {
    changeLoading(loadingGetProducts);
    onFinish();
    await ProductsApi()
        .updateDataProduct(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    )
        .then((data) {
      var responseJson = jsonDecode(data.body);
      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);
      changeLoading(loadingGetProducts);
    });
  }

  deleteDataProduct({
    required String id,
    required Function onFinish,
  }) async {
    changeLoading(loadingGetProducts);
    onFinish();
    await ProductsApi().deleteProduct(id).then((data) {
      var responseJson = jsonDecode(data.body);

      product.clear();
      var datas = ProductModel.fromJson(responseJson);

      product.add(datas);
      changeLoading(loadingGetProducts);
    });
  }
}
