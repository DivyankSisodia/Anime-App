// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/item_data.dart';
import '../../utils/constants/style.dart';

class MerchPage extends StatelessWidget {
  MerchPage({
    super.key,
  });

  final List<Item> items = [
    Item(
      image: 'assets/images/Action_fig1.jpeg',
      name: 'Moneky D Luffy\nAction Figure',
    ),
    Item(
      image: 'assets/images/Action_fig2.jpg',
      name: 'Demon Slayer\nNike Collab',
    ),
    Item(
      image: 'assets/images/Action_fig3.jpeg',
      name: 'Shikamaru\nT-Shirt',
    ),
    Item(
      image: 'assets/images/Action_fig4.jpeg',
      name: 'Feel peace with\nVagabond',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Container(
              height: 179,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/all_anime.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      '50% OFF Anime\nAction figures',
                      style: DStyle.mediumHeading,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Gap(10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Popular Anime', style: DStyle.mediumHeading),
          ),
          SizedBox(
            height:
                400, // Provide a fixed height or use another method to constrain the height
            child: MasonryGridView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return merchItems(
                  item: items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class merchItems extends StatelessWidget {
  const merchItems({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 162,
        height: 195,
        child: Stack(children: [
          Image.asset(
            item.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Text(
              item.name,
              maxLines: 2,
              style: DStyle.smallboldlightbuttonText,
            ),
          ),
        ]),
      ),
    );
  }
}
