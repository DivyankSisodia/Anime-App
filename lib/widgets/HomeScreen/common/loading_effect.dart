import 'package:anime_app/widgets/HomeScreen/common/shimmer_effect.dart';
import 'package:flutter/material.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Or any placeholder count
        itemBuilder: (context, index) => ShimmerEffect(),
      ),
    );
  }
}
