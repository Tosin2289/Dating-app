import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUserProfileList => usersProfileList.value;
  @override
  void onInit() {
    super.onInit();
    usersProfileList.bindStream(FirebaseFirestore.instance
        .collection('Users')
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot) {
      List<Person> profileList = [];
      for (var eachProfile in queryDataSnapshot.docs) {
        profileList.add(Person.fromMap(eachProfile as Map<String, dynamic>));
        print(profileList);
        print("Check this out man");
      }
      return profileList;
    }));
  }
}
