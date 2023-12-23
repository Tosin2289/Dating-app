import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../../../controllers/core/profile_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(
      child: Obx(
        () => CardSwiper(
          cardsCount: profileController.allUserProfileList.length,
          backCardOffset: const Offset(40, 40),
          padding: const EdgeInsets.all(24.0),
          numberOfCardsDisplayed: 2,
          cardBuilder: (context, index, horizontalOffsetPercentage,
              verticalOffsetPercentage) {
            final eachProfileInfo = profileController.allUserProfileList[index];
            print("This is iT");
            print(eachProfileInfo);
            return DecoratedBox(
              child: Center(
                  child: Text(eachProfileInfo.name.toString(),
                      style: TextStyle(color: Colors.white,fontSize: 30,))),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(eachProfileInfo.imageProfile.toString()),
                    fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    ));
  }
}
