import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final double minWidth;
  final double minHeight;

  const ShimmerWidget({
    super.key,
    required this.maxHeight,
    required this.maxWidth,
    required this.minHeight,
    required this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(128, 143, 143, 143),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
