import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookItemShimmer extends StatelessWidget {
  const CustomBookItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(seconds: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            height: 16,
            width: 80,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Container(
            height: 16,
            width: 120,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
