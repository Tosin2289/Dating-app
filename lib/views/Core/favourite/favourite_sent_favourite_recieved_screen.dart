import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/views/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../global.dart';

class FavouriteSentFavouriteReceivedScreen extends StatefulWidget {
  const FavouriteSentFavouriteReceivedScreen({super.key});

  @override
  State<FavouriteSentFavouriteReceivedScreen> createState() =>
      _FavouriteSentFavouriteReceivedScreenState();
}

class _FavouriteSentFavouriteReceivedScreenState
    extends State<FavouriteSentFavouriteReceivedScreen> {
  bool isFavouriteSentClicked = true;
  List<String> favoriteSentList = [];
  List<String> favoriteReceviedList = [];
  List favoriteList = [];
  getFavouriteListKeys() async {
    if (isFavouriteSentClicked) {
      var favouritesSentDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("favouriteSent")
          .get();
      for (int i = 0; i < favouritesSentDocument.docs.length; i++) {
        favoriteSentList.add(favouritesSentDocument.docs[i].id);
      }
      print("favoriteSentList = $favoriteSentList");
      getKeysDataFromUserCollection(favoriteSentList);
    } else {
      var favouritesreceivedDocument = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId.toString())
          .collection("favouriteReceived")
          .get();
      for (int i = 0; i < favouritesreceivedDocument.docs.length; i++) {
        favoriteReceviedList.add(favouritesreceivedDocument.docs[i].id);
      }
      print("favoriteReceviedList = ${favoriteReceviedList.length}");
      getKeysDataFromUserCollection(favoriteReceviedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keyList) async {
    var allUserDocuments =
        await FirebaseFirestore.instance.collection("Users").get();
    for (int i = 0; i < allUserDocuments.docs.length; i++) {
      for (int k = 0; k < keyList.length; k++) {
        if (((allUserDocuments.docs[i].data() as dynamic)["uid"]) ==
            keyList[k]) {
          favoriteList.add(allUserDocuments.docs[i].data());
        }
      }
    }
    setState(() {
      favoriteList;
    });
    print("favoriteList = $favoriteList");
  }

  @override
  void initState() {
    super.initState();
    getFavouriteListKeys();
  }

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
                      favoriteReceviedList.clear();
                      favoriteReceviedList = [];
                      favoriteList.clear();
                      favoriteList = [];
                      isFavouriteSentClicked = true;
                    } else {
                      favoriteSentList.clear();
                      favoriteSentList = [];

                      favoriteList.clear();
                      favoriteList = [];
                      isFavouriteSentClicked = false;
                    }
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
                tabs: const [Text("Sent"), Text("Recived")],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  favoriteList.isNotEmpty
                      ? GridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(2),
                          children: List.generate(favoriteList.length, (index) {
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
                                                    favoriteList[index]
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
                                                    '${favoriteList[index]["name"]} • ${favoriteList[index]["age"]}',
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
                                                    '${favoriteList[index]["city"]} • ${favoriteList[index]["country"]}',
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                  favoriteList.isNotEmpty
                      ? GridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(2),
                          children: List.generate(favoriteList.length, (index) {
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
                                                    favoriteList[index]
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
                                                    '${favoriteList[index]["name"]} • ${favoriteList[index]["age"]}',
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
                                                    '${favoriteList[index]["city"]} • ${favoriteList[index]["country"]}',
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
