import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/style.dart';
import '../../../utils/constants/text_strings.dart';

class DownloadAnimeButton extends StatelessWidget {
  const DownloadAnimeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: GestureDetector(
        onTap: () {
          final snackBar = SnackBar(
            content: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Sorry! this feature is not available yet.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 100, 152, 235),
            elevation: 8.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            duration: const Duration(seconds: 4),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          height: 60,
          width: 153,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255),
                blurRadius: 5,
                spreadRadius: 4,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 16,
                left: 30,
                child: Text(
                  DTexts.download,
                  style: DStyle.lightbuttonText,
                ),
              ),
              Positioned(
                top: 3,
                right: 10,
                child: Image.asset(
                  'assets/icons/Download.png',
                  height: 50,
                  width: 80,
                  color: DColors.pureWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
