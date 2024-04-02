import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../model/anime_model.dart';
import '../../../screen/detail_page/spotlight-anime_detail_page.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/helper/helper_functions.dart';

class TextContainerSection extends ConsumerWidget {
  const TextContainerSection({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: DColors.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: DColors.lighterColor,
            blurRadius: 14,
            spreadRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                anime.name,
                style: DStyle.mediumbuttonText,
              ),
              const Gap(10),
              Consumer(
                builder: (context, watch, _) {
                  final isJTitleExpanded = ref.watch(isJTitleExpandedProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: DHelperFunctions.screenWidth(context) * 0.8,
                          child: Text(
                            anime.jname,
                            style: DStyle.smalllightbuttonText,
                            maxLines: isJTitleExpanded ? anime.jname.length : 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(isJTitleExpandedProvider.notifier).state =
                              !ref
                                  .read(isJTitleExpandedProvider.notifier)
                                  .state;
                        },
                        child: Text(
                          ref.read(isDescExpandedProvider.notifier).state
                              ? "Read Less"
                              : "  more...",
                          maxLines: isJTitleExpanded ? anime.jname.length : 1,
                          style: DStyle.miscText3,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Gap(10),
              Consumer(
                builder: (context, watch, _) {
                  final isDescExpanded = ref.watch(isDescExpandedProvider);
                  return Text(
                    anime.description,
                    style: DStyle.descriptionText,
                    maxLines: isDescExpanded ? anime.description.length : 5,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
              const Gap(10),
              GestureDetector(
                onTap: () {
                  ref.read(isDescExpandedProvider.notifier).state =
                      !ref.read(isDescExpandedProvider.notifier).state;
                },
                child: Text(
                  ref.read(isDescExpandedProvider.notifier).state
                      ? "Read Less"
                      : "Read More",
                  style: DStyle.highlightedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
