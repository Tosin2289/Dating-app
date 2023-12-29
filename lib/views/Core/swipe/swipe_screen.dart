import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/core/profile_controller.dart';
import '../../../global.dart';
import '../profile/user_details_screen.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";
  readCurrentUserData() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .get()
        .then((value) {
      setState(() {
        senderName = value.data()!["name"].toString();
      });
    });
  }

  @override
  void initState() {
    readCurrentUserData();
    super.initState();
    profileController.createScheduledNotification();
  }

  String dropdownValue = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            DropdownButton<String>(
                value: dropdownValue,
                onTap: () {
                  setState(() {
                    if (dropdownValue == "Male") {
                      profileController.getMaleProfileList();
                    } else if (dropdownValue == "Female") {
                      profileController.getFemaleProfileList();
                    } else {
                      profileController.getAllProfileList();
                    }
                  });
                },
                icon: const Icon(Icons.filter_list),
                items: ['All', 'Female', 'Male']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newvalue) {
                  setState(() {
                    dropdownValue = newvalue!;
                    if (dropdownValue == "Male") {
                      profileController.getMaleProfileList();
                    } else if (dropdownValue == "Female") {
                      profileController.getFemaleProfileList();
                    } else {
                      profileController.getAllProfileList();
                    }
                  });
                }),
          ],
        ),
        body: Obx(() {
          if (dropdownValue == "Male") {
            return profileController.usersProfileMaleList.isNotEmpty
                ? CardSwiper(
                    cardsCount: profileController.usersProfileMaleList.length,
                    numberOfCardsDisplayed: 1,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, x, y) {
                      final eachProfileInfo =
                          profileController.usersProfileMaleList[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  eachProfileInfo.imageProfile.toString()),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    profileController.viewSentAndViewReceived(
                                        eachProfileInfo.uid.toString(),
                                        senderName);
                                    Get.to(UserDetailsScreen(
                                      userId: eachProfileInfo.uid,
                                    ));
                                  },
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.profession
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.religion
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.country
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.ethnicity
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .favoriteSentAndFavouriteReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/star.png",
                                          width: 40),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        profileController.lunchurl(
                                            Uri.parse(
                                                    "https://wa.me/${eachProfileInfo.phoneNo}")
                                                as String,
                                            context);
                                      },
                                      child: Image.asset("assets/chat.png",
                                          width: 60),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .likeSentAndLikeReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/heart.png",
                                          width: 40),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          } else if (dropdownValue == "Female") {
            return profileController.usersProfileFemaleList.isNotEmpty
                ? CardSwiper(
                    cardsCount: profileController.usersProfileFemaleList.length,
                    numberOfCardsDisplayed: 1,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, x, y) {
                      final eachProfileInfo =
                          profileController.usersProfileFemaleList[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  eachProfileInfo.imageProfile.toString()),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    profileController.viewSentAndViewReceived(
                                        eachProfileInfo.uid.toString(),
                                        senderName);
                                    Get.to(UserDetailsScreen(
                                      userId: eachProfileInfo.uid,
                                    ));
                                  },
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.profession
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.religion
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.country
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.ethnicity
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .favoriteSentAndFavouriteReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/star.png",
                                          width: 40),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        profileController.lunchurl(
                                            Uri.parse(
                                                    "https://wa.me/${eachProfileInfo.phoneNo}")
                                                as String,
                                            context);
                                      },
                                      child: Image.asset("assets/chat.png",
                                          width: 60),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .likeSentAndLikeReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/heart.png",
                                          width: 40),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          } else {
            return profileController.usersProfileList.isNotEmpty
                ? CardSwiper(
                    cardsCount: profileController.usersProfileList.length,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, x, y) {
                      final eachProfileInfo =
                          profileController.usersProfileList[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  eachProfileInfo.imageProfile.toString()),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    profileController.viewSentAndViewReceived(
                                        eachProfileInfo.uid.toString(),
                                        senderName);
                                    Get.to(UserDetailsScreen(
                                      userId: eachProfileInfo.uid,
                                    ));
                                  },
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.profession
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.religion
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.country
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white30,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16)),
                                                  ),
                                                  child: Text(
                                                    eachProfileInfo.ethnicity
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .favoriteSentAndFavouriteReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/star.png",
                                          width: 40),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (await canLaunch(Uri.parse(
                                                "https://wa.me/${eachProfileInfo.phoneNo}")
                                            as String)) {
                                          await launch(Uri.parse(
                                                  "https://wa.me/${eachProfileInfo.phoneNo}")
                                              as String);
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                              context: context,
                                              builder: ((context) {
                                                return const AlertDialog(
                                                  content:
                                                      Text('Unable to load'),
                                                );
                                              }));
                                        }
                                      },
                                      child: Image.asset("assets/chat.png",
                                          width: 60),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        profileController
                                            .likeSentAndLikeReceived(
                                                eachProfileInfo.uid.toString(),
                                                senderName);
                                      },
                                      child: Image.asset("assets/heart.png",
                                          width: 40),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container();
          }
        }));
  }
}
