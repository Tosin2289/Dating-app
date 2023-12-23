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
    print("Over Here as well");
    print(profileController.usersProfileList.length);
    return Scaffold(
        body: Obx(
      () => PageView.builder(
        itemCount: profileController.usersProfileList.length,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        itemBuilder: (context, index) {
          final eachProfileInfo = profileController.usersProfileList[index];

          return DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(eachProfileInfo.imageProfile.toString()),
                  fit: BoxFit.cover),
            ),
            child: Center(
                child: Text(eachProfileInfo.name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ))),
          );
        },
      ),
    ));
  }
}
