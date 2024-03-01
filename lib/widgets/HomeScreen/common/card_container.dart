import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen/data/card_info.dart';

class DisplayCardContainer extends ConsumerWidget {
  const DisplayCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: CardsInfo(),
    );
  }
}
