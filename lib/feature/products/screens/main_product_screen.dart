import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_exit_popup_dialog.dart';
import 'package:test_geekgarden/core/common/custom_loading.dart';
import 'package:test_geekgarden/feature/products/controller/product_controller.dart';
import 'package:test_geekgarden/feature/products/screens/add_edit_product_screen.dart';
import 'package:test_geekgarden/feature/products/screens/delete_product_screen.dart';
import 'package:test_geekgarden/feature/products/screens/show_all_products.dart';

class MainProductScreen extends StatelessWidget {
  final productsController = Get.find<ProductController>();
  MainProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => customExitPopupDialog(context),
      child: Scaffold(
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
                    await productsController.getDataProduct(onFinish: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowAllProducts(),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Klik produk untuk melihat detail produk'),
                          backgroundColor: (Colors.black),
                        ),
                      );
                    });
                  }),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  title: "Tambah produk",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditProductScreen(
                            warning:
                                'If you send an object like the code above, it will return you an object with a new id. remember that nothing in real will insert into the database. so if you want to access the new id you will get a 404 error.',
                            isEdit: false,
                          ),
                        ));
                  }),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  title: "Edit produk",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditProductScreen(
                            warning:
                                'It will return you an object with sent id. remember that nothing in real will update in the database.',
                            isEdit: true,
                          ),
                        ));
                  }),
              SizedBox(
                height: 20.h,
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
      ),
    );
  }
}
