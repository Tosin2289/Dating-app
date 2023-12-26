import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          body: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
              onTap: (value) {
                setState(() {
                  isFavouriteSentClicked = !isFavouriteSentClicked;
                });
              },
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.pink),
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
          const Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Text("Sent"),
                ),
                Center(
                  child: Text("Recived"),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
