import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFf1faee),
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
