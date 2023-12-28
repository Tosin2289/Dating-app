// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String e;
  const FullScreenImage({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black, image: DecorationImage(image: NetworkImage(e))),
    );
  }
}
