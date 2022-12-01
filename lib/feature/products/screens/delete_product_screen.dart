import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_text_field.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({Key? key}) : super(key: key);

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
            const CustomTextField(
              title: "ID / NAMA PRODUK",
              hintText: "",
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onPress: () {},
              title: "Hapus",
            ),
          ],
        ),
      ),
    );
  }
}
