// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? iconData;
  final String? assetRef;
  final String? labelText;
  final bool? isObscured;
  const CustomTextField({
    Key? key,
    this.controller,
    this.iconData,
    this.assetRef,
    this.labelText,
    this.isObscured,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured!,
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: const TextStyle(fontSize: 18),
        prefixIcon: iconData != null
            ? Icon(iconData)
            : Padding(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage(assetRef.toString()),
                ),
              ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }
}
