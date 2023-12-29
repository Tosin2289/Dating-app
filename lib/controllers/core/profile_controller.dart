import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global.dart';
import '../../views/utils/image.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final RxList<Person> usersProfileList = <Person>[].obs;
  final RxList<Person> usersProfileMaleList = <Person>[].obs;
  final RxList<Person> usersProfileFemaleList = <Person>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMaleProfileList().then((value) {
      print("Male  List :${usersProfileMaleList.length}");
    });
    getAllProfileList().then((value) {
      print("All List :${usersProfileList.length}");
    });
    getFemaleProfileList().then((value) {
      print("Female List :${usersProfileFemaleList.length}");
    });
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

  Future<void> getFemaleProfileList() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where(
            "gender",
            isEqualTo: "Female",
          )
          .get();

      final list = snapshot.docs
          .map((queryDataSnapshot) => Person.fromMap(queryDataSnapshot));
      usersProfileFemaleList.assignAll(list);
      usersProfileFemaleList.shuffle();
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

  Future<void> getMaleProfileList() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where(
            "gender",
            isEqualTo: "Male",
          )
          .get();

      final list = snapshot.docs
          .map((queryDataSnapshot) => Person.fromMap(queryDataSnapshot));
      usersProfileMaleList.assignAll(list);
      usersProfileMaleList.shuffle();
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

  viewSentAndViewReceived(String toUserId, String senderName) async {
    var documnet = await FirebaseFirestore.instance
        .collection("Users")
        .doc(toUserId)
        .collection("viewReceived")
        .doc(currentUserId)
        .get();
    if (documnet.exists) {
      Get.snackbar(
        "View",
        "Already in view List",
        colorText: Colors.white,
        backgroundColor: Colors.pink,
      );
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(toUserId)
          .collection("viewReceived")
          .doc(currentUserId)
          .set({});
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserId)
          .collection("viewSent")
          .doc(toUserId)
          .set({});
    }
    update();
  }

  Future lunchurl(String url, BuildContext context) async {
    // ignore:
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: ((context) {
            return const AlertDialog(
              content: Text('Unable to load'),
            );
          }));
    }
  }

  triggerNotification(String message, int id) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            backgroundColor: Colors.pink,
            color: Colors.white,
            id: id,
            channelKey: 'Basic_channel',
            title: 'Dating App',
            body: message));
  }

  createScheduledNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Dating app',
        body: 'Check Dating app for intresting matches',
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(
          const Duration(seconds: 10),
        ),
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }
}
