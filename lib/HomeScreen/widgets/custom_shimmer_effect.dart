// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  final Widget? child;

  const CustomShimmerEffect({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100.withOpacity(0.5),
      child: child!,
    );
  }
}
