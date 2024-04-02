import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:anime_app/widgets/HomeScreen/common/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class VerticalLoadingEffect extends StatelessWidget {
  const VerticalLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DHelperFunctions.screenHeight(context),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: 12,
        itemBuilder: (context, index) => const ShimmerEffect(),
      ),
    );
  }
}
