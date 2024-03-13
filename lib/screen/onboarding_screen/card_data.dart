import 'package:flutter/cupertino.dart';

class CardData {
  final String title;
  final String description;
  final Widget image;
  final Color backgroundColor;
  final Color titleColor;
  final Color descriptionColor;

  const CardData({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.descriptionColor,
  });
}

class CardUIView extends StatelessWidget {
  const CardUIView({super.key, required this.data});

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 20,
          child: data.image,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            data.title.toUpperCase(),
            style: TextStyle(
              color: data.titleColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
            ),
            maxLines: 2,
          ),
        ),
        // const Gap(20),
        const SizedBox(
          height: 20,
        ),
        Text(
          data.description,
          style: TextStyle(
            color: data.titleColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
