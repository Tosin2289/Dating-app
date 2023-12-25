import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final RxList<Person> usersProfileList = <Person>[].obs;
  List<Person> get allUserProfileList => usersProfileList.value;
  @override
  void onInit() {
    super.onInit();
    // usersProfileList.bindStream(FirebaseFirestore.instance
    //     .collection('Users')
    //     .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
    //     .snapshots()
    //     .map((QuerySnapshot queryDataSnapshot) {
    //   List<Person> profileList = [];
    //   for (var eachProfile in queryDataSnapshot.docs) {
    //     profileList.add(Person.fromMap(eachProfile));
    //   }
    //   return profileList;
    // }));
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
}
