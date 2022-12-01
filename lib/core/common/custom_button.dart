import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../feature/products/controller/product_controller.dart';

class CustomButton extends StatelessWidget {
  final productsController = Get.find<ProductController>();
  final Function() onPress;
  final String title;
  CustomButton({Key? key, required this.onPress, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ElevatedButton(
            onPressed:
                productsController.loadingGetProducts.value ? null : onPress,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: productsController.loadingGetProducts.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(title),
          ),
        ));
  }
}
