import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_geekgarden/core/constans/constants.dart';

class ProductsApi {
  getDataProducts() async {
    var url = '${Constan().url}products';
    log(url.toString(), name: 'url get data products');

    var response = await http.get(Uri.parse(url));
    // log(response.body.toString(), name: 'response get data products');

    return response;
  }

  addDataProduct(
      {required String title,
      required String price,
      required String description,
      required String category}) async {
    var url = '${Constan().url}products';
    Map data = {
      "title": title,
      "price": price,
      "description": description,
      "category": category
    };
    var response = await http.post(Uri.parse(url), body: data);
    // log(response.body.toString(), name: 'response get data products');

    return response;
  }
}