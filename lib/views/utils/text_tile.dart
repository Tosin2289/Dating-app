import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    required this.userDetailsController,
    required this.title,
  }) : super(key: key);

  final userDetailsController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 170,
          child: Text(
            userDetailsController,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
