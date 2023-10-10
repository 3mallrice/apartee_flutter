import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final String imgPath;
  final double height;
  const SquareTitle({super.key, required this.imgPath, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[200],
      child: Image.asset(
        imgPath,
        height: height,
      ),
    );
  }
}
