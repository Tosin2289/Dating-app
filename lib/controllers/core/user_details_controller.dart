import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserDetailsController extends GetxController {
  static UserDetailsController get instance => Get.find();

  Rx<String> name = ''.obs;
  Rx<String> age = ''.obs;
  Rx<String> gender = ''.obs;
  Rx<String> phoneNo = ''.obs;
  Rx<String> city = ''.obs;
  Rx<String> country = ''.obs;
  Rx<String> profileHeading = ''.obs;
  Rx<String> lookingForInaPartner = ''.obs;
  Rx<String> height = ''.obs;
  Rx<String> weight = ''.obs;
  Rx<String> bodyType = ''.obs;
  Rx<String> drink = ''.obs;
  Rx<String> smoke = ''.obs;
  Rx<String> maritalStatus = ''.obs;
  Rx<String> haveChildren = ''.obs;
  Rx<String> noOfChildren = ''.obs;
  Rx<String> profession = ''.obs;
  Rx<String> employmentStatus = ''.obs;
  Rx<String> income = ''.obs;
  Rx<String> livingSituation = ''.obs;
  Rx<String> willingToRelocate = ''.obs;
  Rx<String> relationshipYourLookingFor = ''.obs;
  Rx<String> nationality = ''.obs;
  Rx<String> education = ''.obs;
  Rx<String> languageSpoken = ''.obs;
  Rx<String> religion = ''.obs;
  Rx<String> ethnicity = ''.obs;

  Rx<String> urlImage1 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-41138.appspot.com/o/Place%20Holder%2Fdazzle.png?alt=media&token=9e275f41-5a31-419e-a0a6-34625b31e8d7"
          .obs;
  Rx<String> urlImage2 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-41138.appspot.com/o/Place%20Holder%2Fdazzle.png?alt=media&token=9e275f41-5a31-419e-a0a6-34625b31e8d7"
          .obs;
  Rx<String> urlImage3 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-41138.appspot.com/o/Place%20Holder%2Fdazzle.png?alt=media&token=9e275f41-5a31-419e-a0a6-34625b31e8d7"
          .obs;
  Rx<String> urlImage4 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-41138.appspot.com/o/Place%20Holder%2Fdazzle.png?alt=media&token=9e275f41-5a31-419e-a0a6-34625b31e8d7"
          .obs;
  Rx<String> urlImage5 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-41138.appspot.com/o/Place%20Holder%2Fdazzle.png?alt=media&token=9e275f41-5a31-419e-a0a6-34625b31e8d7"
          .obs;

  reteriveUserInfo(String? id) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        if (snapshot.data()!['urlImage1'] != null) {
          urlImage1.value = snapshot.data()!['urlImage1'];
          urlImage2.value = snapshot.data()!['urlImage2'];
          urlImage3.value = snapshot.data()!['urlImage3'];
          urlImage4.value = snapshot.data()!['urlImage4'];
          urlImage5.value = snapshot.data()!['urlImage5'];
        }
        name.value = snapshot.data()!['name'];
        age.value = snapshot.data()!['age'].toString();
        gender.value = snapshot.data()!['gender'];
        phoneNo.value = snapshot.data()!['phoneNo'];
        city.value = snapshot.data()!['city'];
        country.value = snapshot.data()!['country'];
        profileHeading.value = snapshot.data()!['profileHeading'];
        lookingForInaPartner.value = snapshot.data()!['lookingForInaPartner'];

        height.value = snapshot.data()!['height'];
        weight.value = snapshot.data()!['weight'];
        bodyType.value = snapshot.data()!['bodyType'];

        drink.value = snapshot.data()!['drink'];
        smoke.value = snapshot.data()!['smaoke'];
        maritalStatus.value = snapshot.data()!['maritalStatus'];
        haveChildren.value = snapshot.data()!['haveChildren'];
        noOfChildren.value = snapshot.data()!['noOfChildren'];
        profession.value = snapshot.data()!['profession'];
        employmentStatus.value = snapshot.data()!['employmentStatus'];
        income.value = snapshot.data()!['income'];
        livingSituation.value = snapshot.data()!['livingSituation'];
        willingToRelocate.value = snapshot.data()!['willingToRelocate'];
        relationshipYourLookingFor.value =
            snapshot.data()!['relationshipLookingFor'];

        nationality.value = snapshot.data()!['nationality'];
        education.value = snapshot.data()!['education'];
        languageSpoken.value = snapshot.data()!['language'];
        religion.value = snapshot.data()!['religion'];
        ethnicity.value = snapshot.data()!['ethnicity'];
      }
    });
  }
}
