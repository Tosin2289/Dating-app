// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/core/user_details_controller.dart';
import '../../../global.dart';
import '../../personalisation/account_settings_screen.dart';
import '../../utils/subheading_text.dart';
import '../../utils/text_tile.dart';
import 'full_screen_image.dart';

class UserDetailsScreen extends StatefulWidget {
  String? userId;
  UserDetailsScreen({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var userDetailsController = Get.put(UserDetailsController());
  @override
  void initState() {
    super.initState();
    userDetailsController.reteriveUserInfo(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading:
                widget.userId == currentUserId ? false : true,
            actions: [
              widget.userId == currentUserId
                  ? IconButton(
                      onPressed: () {
                        Get.to(const SettingsScreen());
                      },
                      icon: const Icon(Icons.settings_outlined))
                  : const SizedBox(),
              widget.userId == currentUserId
                  ? IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(Icons.logout))
                  : const SizedBox(),
            ],
            title: const Text(
              "Account",
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CustomCarouselSlider(
                          height: 150,
                          subHeight: 50,
                          width: 300,
                          autoplay: true,
                          showSubBackground: false,
                          showText: false,
                          items: [
                            CarouselItem(
                              onImageTap: (e) {
                                Get.to(FullScreenImage(
                                  e: userDetailsController.urlImage1.value,
                                ));
                              },
                              image: NetworkImage(
                                userDetailsController.urlImage1.value,
                              ),
                            ),
                            CarouselItem(
                              onImageTap: (e) {
                                Get.to(FullScreenImage(
                                  e: userDetailsController.urlImage2.value,
                                ));
                              },
                              image: NetworkImage(
                                userDetailsController.urlImage2.value,
                              ),
                            ),
                            CarouselItem(
                              onImageTap: (e) {
                                Get.to(FullScreenImage(
                                  e: userDetailsController.urlImage3.value,
                                ));
                              },
                              image: NetworkImage(
                                userDetailsController.urlImage3.value,
                              ),
                            ),
                            CarouselItem(
                              onImageTap: (e) {
                                Get.to(FullScreenImage(
                                  e: userDetailsController.urlImage4.value,
                                ));
                              },
                              image: NetworkImage(
                                userDetailsController.urlImage4.value,
                              ),
                            ),
                            CarouselItem(
                              onImageTap: (e) {
                                Get.to(FullScreenImage(
                                  e: userDetailsController.urlImage5.value,
                                ));
                              },
                              image: NetworkImage(
                                userDetailsController.urlImage5.value,
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SubheadingText(
                            value: "Personal Info",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.name.value,
                            title: "Name :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.age.value,
                            title: "Age :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.gender.value,
                            title: "Gender :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.phoneNo.value,
                            title: "Phone number :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.city.value,
                            title: "City :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.country.value,
                            title: "Country :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController: userDetailsController
                                .lookingForInaPartner.value,
                            title: "Seeking :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SubheadingText(
                            value: "Appearance",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.height.value,
                            title: "Height :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.weight.value,
                            title: "Weight :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.bodyType.value,
                            title: "Body Type :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SubheadingText(
                            value: "Life Style",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.drink.value,
                            title: "Drink :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.smoke.value,
                            title: "Smoke :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.maritalStatus.value,
                            title: "Marital Status :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.haveChildren.value,
                            title: "Have Children :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          userDetailsController.haveChildren.value == "yes" ||
                                  userDetailsController.haveChildren.value ==
                                      "Yes" ||
                                  userDetailsController.haveChildren.value ==
                                      "YES"
                              ? TextTile(
                                  userDetailsController:
                                      userDetailsController.noOfChildren.value,
                                  title: "Number of Children :",
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.profession.value,
                            title: "Profession :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.employmentStatus.value,
                            title: 'Employment Status :',
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.income.value,
                            title: 'Income :',
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.livingSituation.value,
                            title: "Living Situation :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.willingToRelocate.value,
                            title: "Willing to relocate :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController: userDetailsController
                                .relationshipYourLookingFor.value,
                            title: "Looking for:",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SubheadingText(
                            value: "Background",
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.nationality.value,
                            title: "Nationality :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.education.value,
                            title: "Education :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.languageSpoken.value,
                            title: "Language :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.religion.value,
                            title: "Religion :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextTile(
                            userDetailsController:
                                userDetailsController.ethnicity.value,
                            title: "Ethnicity :",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
