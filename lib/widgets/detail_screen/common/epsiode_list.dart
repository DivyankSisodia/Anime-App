import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../model/static_data.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';

class EpisodeListWidget extends StatelessWidget {
  const EpisodeListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: epsiodes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage(epsiodes[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: DStyle.misctext4,
                            ),
                            Text(
                              '.  ${epsiodes[index].title}',
                              style: DStyle.misctext4,
                            ),
                          ],
                        ),
                        const Gap(5),
                        const Text(
                          '24 min',
                          style: DStyle.misctext6,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/Download.png',
                      color: DColors.pureWhite,
                      height: 40,
                      width: 70,
                    )
                  ],
                ),
                const Gap(5),
                Text(
                  epsiodes[index].descp,
                  maxLines: 2,
                  style: DStyle.misctext6,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
