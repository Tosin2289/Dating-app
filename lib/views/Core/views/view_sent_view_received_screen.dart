import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controllers/core/profile_controller.dart';
import '../../../global.dart';
import '../../utils/image.dart';
import '../profile/user_details_screen.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() =>
      _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState
    extends State<ViewSentViewReceivedScreen> {
  ProfileController profileController = Get.put(ProfileController());
  bool isViewSentClicked = true;
  List<String> viewSentList = [];
  List<String> viewReceviedList = [];
  List viewList = [];
  getViewListKeys() async {
    if (isViewSentClicked) {
      var favouritesSentDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("viewSent")
          .get();
      for (int i = 0; i < favouritesSentDocument.docs.length; i++) {
        viewSentList.add(favouritesSentDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(viewSentList);
    } else {
      var favouritesreceivedDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("viewReceived")
          .get();
      for (int i = 0; i < favouritesreceivedDocument.docs.length; i++) {
        viewReceviedList.add(favouritesreceivedDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(viewReceviedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keyList) async {
    var allUserDocuments =
        await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < allUserDocuments.docs.length; i++) {
      for (int k = 0; k < keyList.length; k++) {
        if (((allUserDocuments.docs[i].data() as dynamic)["uid"]) ==
            keyList[k]) {
          viewList.add(allUserDocuments.docs[i].data());
        }
      }
    }
    setState(() {
      viewList;
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
    getViewListKeys();
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
                  setState(
                    () {
                      if (value == 0) {
                        viewReceviedList.clear();
                        viewReceviedList = [];
                        viewList.clear();
                        viewList = [];
                        isViewSentClicked = true;
                        getViewListKeys();
                      } else {
                        viewSentList.clear();
                        viewSentList = [];
                        viewList.clear();
                        viewList = [];
                        isViewSentClicked = false;
                        getViewListKeys();
                      }
                      currentIndex = value;
                    },
                  );
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
                tabs: const [Text("You viewed"), Text("You were viewed by")],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  if (currentIndex == 0)
                    viewList.isNotEmpty
                        ? GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(2),
                            children: List.generate(viewList.length, (index) {
                              final eachProfileInfo =
                                  profileController.usersProfileList[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GridTile(
                                    child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: GestureDetector(
                                    onTap: () {
                                      profileController.viewSentAndViewReceived(
                                          eachProfileInfo.uid.toString(),
                                          senderName);
                                      Get.to(UserDetailsScreen(
                                        userId: eachProfileInfo.uid,
                                      ));
                                    },
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
                                                      viewList[index]
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
                                                      '${viewList[index]["name"]} • ${viewList[index]["age"]}',
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
                                                      '${viewList[index]["city"]} • ${viewList[index]["country"]}',
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
                  if (currentIndex == 1)
                    viewList.isNotEmpty
                        ? GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(2),
                            children: List.generate(viewList.length, (index) {
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
                                                      viewList[index]
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
                                                      '${viewList[index]["name"]} • ${viewList[index]["age"]}',
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
                                                      '${viewList[index]["city"]} • ${viewList[index]["country"]}',
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
