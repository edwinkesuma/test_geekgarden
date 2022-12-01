import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:test_geekgarden/core/common/custom_button.dart';
import 'package:test_geekgarden/core/common/custom_text_field.dart';

class AddEditProductScreen extends StatelessWidget {
  final bool isEdit;
  AddEditProductScreen({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Produk" : "Tambah Produk"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              title: "Nama:",
              hintText: "Baju",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              title: "Harga:",
              hintText: "10000",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              title: "Deskripsi:",
              hintText: "Produk yang sangat bagus.",
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomTextField(
              title: "Kategori:",
              hintText: "Pakaian pria",
            ),
            const SizedBox(
              height: 75,
            ),
            CustomButton(
              onPress: () {},
              title: isEdit ? "Edit" : "Tambah",
            ),
          ],
        ),
      ),
    );
  }
}
