// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/user-profile/edit-profile-section/buttons.dart';
import '../../widgets/user-profile/edit-profile-section/deatils_text_field.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});

  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> userData() async {
    try {
      await addUserDetails(
        _firstNameController.text,
        _emailController.text, // Pass the email controller text
        _phoneController.text,
        _passwordController.text,
        _userNameController.text,
        _lastNameController.text,
      );

      // Show SnackBar after data is successfully added to Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text(
            'Your profile has been successfully edited.',
            style: TextStyle(
              color: Colors.black, // Set text color
            ),
          ),
        ),
      );
    } catch (e) {
      // Handle any errors that occur during the data upload process
      print('Error adding user details: $e');
    }
  }

  Future addUserDetails(String firstname, String email, String phone,
      String password, String username, String lastname) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'email': email,
      'phone': phone,
      'password': password,
      'username': username,
      'lastname': lastname,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: DColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: DColors.lightColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Let's edit your profile!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: DColors.pureWhite,
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DetailFormField(
                            controller: _firstNameController,
                            labelText: DTexts.first,
                            icon: Iconsax.user,
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: DetailFormField(
                            controller: _lastNameController,
                            labelText: DTexts.last,
                            icon: Iconsax.user,
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    DetailFormField(
                      controller: _userNameController,
                      labelText: DTexts.username,
                      icon: Iconsax.user_edit,
                    ),
                    const Gap(16),
                    DetailFormField(
                      controller: _emailController,
                      labelText: DTexts.email,
                      icon: Iconsax.direct,
                    ),
                    const Gap(16),
                    DetailFormField(
                      controller: _phoneController,
                      labelText: DTexts.phone,
                      icon: Iconsax.call,
                    ),
                    const Gap(16),
                    DetailFormField(
                      controller: _passwordController,
                      labelText: DTexts.password,
                      icon: Iconsax.password_check,
                    ),
                    const Gap(16),
                  ],
                ),
              ),

              // const Gap(30),

              // Save button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Buttons(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      boxShadow: const Color.fromARGB(255, 234, 102, 62),
                      color: Colors.redAccent,
                      text: DTexts.cancel,
                    ),
                    const Gap(20),
                    Buttons(
                      onPressed: userData,
                      boxShadow: const Color.fromARGB(255, 62, 234, 94),
                      color: Colors.greenAccent,
                      text: DTexts.save,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
