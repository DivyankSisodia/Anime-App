import 'package:anime_app/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/bottom_navbar_controller.dart';
import 'screen/categories/anime_stack_screen.dart';
import 'screen/my_list/favorite.dart';
import 'screen/user_profile/profile_screen.dart';
import 'utils/constants/colors.dart';

class CustomBottomNavbar extends ConsumerWidget {
  CustomBottomNavbar({super.key});

  final List<Widget> _screens = [
    const AppHomeScreen(),
    const Favourites(),
    const AnimeScreens(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 101,
        child: BottomNavigationBar(  
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: DColors.backgroundColor,
          onTap: (index) {
            ref.watch(currentIndexProvider.notifier).state = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? Image.asset(
                      'assets/icons/Home.png',
                      color: DColors.pureWhite,
                    )
                  : Image.asset(
                      'assets/icons/Home.png',
                      color: DColors.textColor,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? Image.asset(
                      'assets/icons/Bookmark.png',
                      color: DColors.pureWhite,
                    )
                  : Image.asset(
                      'assets/icons/Bookmark.png',
                      color: DColors.textColor,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? Image.asset(
                      'assets/icons/Book Stack.png',
                      color: DColors.pureWhite,
                    )
                  : Image.asset(
                      'assets/icons/Book Stack.png',
                      color: DColors.textColor,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 3
                  ? Image.asset(
                      'assets/icons/Male User.png',
                      color: DColors.pureWhite,
                    )
                  : Image.asset(
                      'assets/icons/Male User.png',
                      color: DColors.textColor,
                    ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
