// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/HomeScreen/common/text_heading.dart';
import '../../widgets/user-profile/profile-Section/member_ship_box.dart';
import '../../widgets/user-profile/profile-Section/preference_box.dart';
import '../../widgets/user-profile/profile-Section/profile_section_header.dart';
import '../../widgets/user-profile/profile-Section/sign_out_btn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String? userName;

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

  void signOut() async {
    print('i am called');
    FirebaseAuth.instance.signOut();
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: ProfileHeadingSection(),
                      ),
                      const Gap(8),
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/images/Ellipse 19.png'),
                      ),
                      const Gap(12),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          height: DHelperFunctions.screenHeight(context) * 0.20,
                          width: DHelperFunctions.screenWidth(context) * 0.9,
                          decoration: BoxDecoration(
                            color: DColors.lightColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
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
                                        'Feature yet to be implemented till then edit your profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 100, 152, 235),
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const MemberShipAndChangeEmail(),
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
                                        'These feature will be added soon. Stay tuned!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.teal.shade700,
                                elevation: 8.0,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                duration: const Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const PreferenceBox(),
                          ),
                        ),
                        const Gap(20),
                        GestureDetector(
                          onTap: signOut,
                          child: const SignOutButton(),
                        ),
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
