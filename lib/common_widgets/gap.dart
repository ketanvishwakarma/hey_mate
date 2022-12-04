import 'package:flutter/material.dart';
import 'package:todo/constants/size_constants.dart';

class Gap extends StatelessWidget {
  const Gap({
    super.key,
    this.height = SizeConstants.bodyPadding,
    this.width = SizeConstants.bodyPadding,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
