import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/core/profile_controller.dart';
import '../../../global.dart';
import '../../utils/image.dart';
import '../profile/user_details_screen.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() =>
      _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState
    extends State<LikeSentLikeReceivedScreen> {
  ProfileController profileController = Get.put(ProfileController());
  bool isLikeSentClicked = true;
  List<String> likeSentList = [];
  List<String> likeReceviedList = [];
  List likeList = [];
  getLikeListKeys() async {
    if (isLikeSentClicked) {
      var favouritesSentDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("likeSent")
          .get();
      for (int i = 0; i < favouritesSentDocument.docs.length; i++) {
        likeSentList.add(favouritesSentDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(likeSentList);
    } else {
      var favouritesreceivedDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("likeReceived")
          .get();
      for (int i = 0; i < favouritesreceivedDocument.docs.length; i++) {
        likeReceviedList.add(favouritesreceivedDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(likeReceviedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keyList) async {
    var allUserDocuments =
        await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < allUserDocuments.docs.length; i++) {
      for (int k = 0; k < keyList.length; k++) {
        if (((allUserDocuments.docs[i].data() as dynamic)["uid"]) ==
            keyList[k]) {
          likeList.add(allUserDocuments.docs[i].data());
        }
      }
    }
    setState(() {
      likeList;
    });
  }

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
    super.initState();
    getLikeListKeys();
    readCurrentUserData();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    if (value == 0) {
                      likeReceviedList.clear();
                      likeReceviedList = [];
                      likeList.clear();
                      likeList = [];
                      isLikeSentClicked = true;
                      getLikeListKeys();
                    } else {
                      likeSentList.clear();
                      likeSentList = [];
                      likeList.clear();
                      likeList = [];
                      isLikeSentClicked = false;
                      getLikeListKeys();
                    }
                    currentIndex = value;
                  });
                },
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink),
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                indicatorPadding: const EdgeInsets.all(1),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.pink,
                tabs: const [Text("You liked"), Text("You were liked by")],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  if (currentIndex == 0)
                    likeList.isNotEmpty
                        ? GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(2),
                            children: List.generate(likeList.length, (index) {
                              final eachProfileInfo =
                                  profileController.usersProfileList[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    GridTile(
                                        child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: GestureDetector(
                                        onTap: () {
                                          profileController
                                              .viewSentAndViewReceived(
                                                  eachProfileInfo.uid
                                                      .toString(),
                                                  senderName);
                                          Get.to(UserDetailsScreen(
                                            userId: eachProfileInfo.uid,
                                          ));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Card(
                                            color: Colors.grey.shade700,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          likeList[index]
                                                              ["imageProfile"]),
                                                      fit: BoxFit.cover)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Expanded(
                                                      flex: 4,
                                                      child: SizedBox(),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                          '${likeList[index]["name"]} • ${likeList[index]["age"]}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                          '${likeList[index]["city"]} • ${likeList[index]["country"]}',
                                                          style:
                                                              const TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                    Positioned(
                                      top: 5,
                                      right: 18,
                                      child: IconButton(
                                          onPressed: () {
                                            profileController
                                                .likeSentAndLikeReceived(
                                                    eachProfileInfo.uid
                                                        .toString(),
                                                    senderName);
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          )
                        : Center(
                            child: Lottie.asset(DImages.findnot),
                          ),
                  if (currentIndex == 1)
                    likeList.isNotEmpty
                        ? GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(2),
                            children: List.generate(likeList.length, (index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GridTile(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Card(
                                        color: Colors.grey.shade700,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      likeList[index]
                                                          ["imageProfile"]),
                                                  fit: BoxFit.cover)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Expanded(
                                                  flex: 4,
                                                  child: SizedBox(),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                      '${likeList[index]["name"]} • ${likeList[index]["age"]}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                      '${likeList[index]["city"]} • ${likeList[index]["country"]}',
                                                      style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              );
                            }),
                          )
                        : Center(
                            child: Lottie.asset(DImages.findnot),
                          ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
