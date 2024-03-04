// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/HomeScreen/common/text_heading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Adjust duration as needed
    );
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Start off-screen to the left
                  end: const Offset(0, 0), // End at its final position
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: const Interval(
                        0.0, 0.5), // Adjust the intervals as needed
                  ),
                ),
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: DHelperFunctions.screenHeight(context) * 0.017,
                        ),
                        child: const TitleORHeading(
                          title: DTexts.profile,
                          fontstyle: DStyle.mediumHeading,
                        ),
                      ),
                      const Gap(8),
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/images/Ellipse 19.png'),
                      ),
                      const Gap(22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          height: DHelperFunctions.screenHeight(context) * 0.20,
                          width: DHelperFunctions.screenWidth(context) * 0.9,
                          decoration: BoxDecoration(
                            color: DColors.lightColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      DTexts.membership,
                                      style: DStyle.smalllightbuttonText,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: DColors.textSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      DTexts.changeEmail,
                                      style: DStyle.smalllightbuttonText,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: DColors.textSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      DTexts.changePassword,
                                      style: DStyle.smalllightbuttonText,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: DColors.textSecondaryColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(
                  parent: _animationController,
                  curve: const Interval(0.5, 1),
                )),
                child: Container(
                  color: DColors.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: TitleORHeading(
                            title: DTexts.preferences,
                            fontstyle: DStyle.mediumHeading,
                          ),
                        ),
                        const Gap(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Container(
                            height:
                                DHelperFunctions.screenHeight(context) * 0.21,
                            width: DHelperFunctions.screenWidth(context) * 0.9,
                            decoration: BoxDecoration(
                              color: DColors.lightColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        DTexts.audioLang,
                                        style: DStyle.smalllightbuttonText,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: Text(
                                            DTexts.lang,
                                            style: DStyle.smalllightbuttonText,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: DColors.textSecondaryColor,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        DTexts.subtitleLang,
                                        style: DStyle.smalllightbuttonText,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 16.0),
                                          child: Text(
                                            DTexts.appLang,
                                            style: DStyle.smalllightbuttonText,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: DColors.textSecondaryColor,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        DTexts.mobileData,
                                        style: DStyle.smalllightbuttonText,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: Switch(
                                        value: true,
                                        onChanged: (value) {
                                          value = !value;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        DTexts.matureContent,
                                        style: DStyle.smalllightbuttonText,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: Switch(
                                        value: true,
                                        onChanged: (value) {
                                          value = !value;
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Center(
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                              color: DColors.lightColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: const Center(
                              child: Text(
                                DTexts.signout,
                                style: DStyle.lightbuttonText,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
