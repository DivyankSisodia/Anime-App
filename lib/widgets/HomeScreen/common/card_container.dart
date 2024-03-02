import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view/data/trending_card_info.dart';

class DisplayCardContainer extends ConsumerWidget {

  const DisplayCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TrendingAnimeCard();
  }
}
