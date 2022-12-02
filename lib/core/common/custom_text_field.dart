import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  bool? isNumber = false;
  CustomTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: controller,
            keyboardType:
                isNumber == true ? TextInputType.number : TextInputType.name,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
