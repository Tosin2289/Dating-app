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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                )),
          ],
        ),
        body: Obx(
          () => CardSwiper(
            cardsCount: profileController.usersProfileList.length,
            numberOfCardsDisplayed: 3,
            backCardOffset: const Offset(40, 40),
            padding: const EdgeInsets.all(24.0),
            cardBuilder: (context, index, x, y) {
              final eachProfileInfo = profileController.usersProfileList[index];

              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image:
                          NetworkImage(eachProfileInfo.imageProfile.toString()),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eachProfileInfo.name.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${eachProfileInfo.age}•${eachProfileInfo.city}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      child: Text(
                                        eachProfileInfo.profession.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      child: Text(
                                        eachProfileInfo.religion.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      child: Text(
                                        eachProfileInfo.country.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      child: Text(
                                        eachProfileInfo.ethnicity.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
