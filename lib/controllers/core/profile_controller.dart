import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../global.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final RxList<Person> usersProfileList = <Person>[].obs;
  List<Person> get allUserProfileList => usersProfileList.value;
  @override
  void onInit() {
    super.onInit();

    getAllProfileList();
  }

  Future<void> getAllProfileList() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      final list = snapshot.docs
          .map((queryDataSnapshot) => Person.fromMap(queryDataSnapshot));
      usersProfileList.assignAll(list);
      usersProfileList.shuffle();
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong.Please try again';
    }
  }

  favoriteSentAndFavouriteReceived(String toUserId, String senderName) async {
    var documnet = await FirebaseFirestore.instance
        .collection("Users")
        .doc(toUserId)
        .collection("favouriteReceived")
        .doc(currentUserId)
        .get();
    if (documnet.exists) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUserId)
          .collection("favouriteReceived")
          .doc(currentUserId)
          .delete();
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId)
          .collection("favouriteSent")
          .doc(toUserId)
          .delete();
      Get.snackbar(
        "Favourite",
        "Removed as Favourites",
        colorText: Colors.white,
        backgroundColor: Colors.pink,
      );
    } else {
      //add current user id to the fav  received l
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUserId)
          .collection("favouriteReceived")
          .doc(currentUserId)
          .set({});
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId)
          .collection("favouriteSent")
          .doc(toUserId)
          .set({});
      Get.snackbar(
        "Favourite",
        "Marked as Favourites",
        colorText: Colors.white,
        backgroundColor: Colors.pink,
      );
    }
    update();
  }

  likeSentAndLikeReceived(String toUserId, String senderName) async {
    var documnet = await FirebaseFirestore.instance
        .collection("Users")
        .doc(toUserId)
        .collection("likeReceived")
        .doc(currentUserId)
        .get();
    if (documnet.exists) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUserId)
          .collection("likeReceived")
          .doc(currentUserId)
          .delete();
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId)
          .collection("likeSent")
          .doc(toUserId)
          .delete();
      Get.snackbar(
        "Like",
        "Removed as Likes",
        colorText: Colors.white,
        backgroundColor: Colors.pink,
      );
    } else {
      //add current user id to the like received
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUserId)
          .collection("likeReceived")
          .doc(currentUserId)
          .set({});
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId)
          .collection("likeSent")
          .doc(toUserId)
          .set({});
      Get.snackbar(
        "Like",
        "Added as Likes",
        colorText: Colors.white,
        backgroundColor: Colors.pink,
      );
    }
    update();
  }
}
