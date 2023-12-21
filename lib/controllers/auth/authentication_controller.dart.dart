import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../views/Core/Home/home_screen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;
  pickedImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Get.snackbar("Hurry", "You have sucessfully picked your profile image");
    }
    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  createNewUserAccount(
    File imageProfile,
    String email,
    String password,
    String name,
    String age,
    String phoneNo,
    String city,
    String country,
    String profileHeading,
    String lookingForInaPartner,
    String height,
    String weight,
    String bodyType,
    String drink,
    String smaoke,
    String maritalStatus,
    String haveChildren,
    String noOfChildren,
    String profession,
    String employmentStatus,
    String income,
    String livingSituation,
    String willingToRelocate,
    String relationshipLookingFor,
    String nationality,
    String education,
    String language,
    String religion,
    String ethnicity,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);
      final newUser = Person(
        imageProfile: urlOfDownloadedImage,
        email: email,
        password: password,
        name: name,
        age: int.parse(age),
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInaPartner: lookingForInaPartner,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,
        height: height,
        weight: weight,
        bodyType: bodyType,
        drink: drink,
        smaoke: smaoke,
        maritalStatus: maritalStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        livingSituation: livingSituation,
        willingToRelocate: willingToRelocate,
        relationshipLookingFor: relationshipLookingFor,
        nationality: nationality,
        education: education,
        language: language,
        religion: religion,
        ethnicity: ethnicity,
      );
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(newUser.toMap());
      Get.snackbar("Hurry", "Your account has been created sucessfully",
          backgroundColor: Colors.pink, colorText: Colors.white);
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Oh Snap", "Error occured :$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Oh Snap", "Error occured :$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Oh Snap", "Logged in succesfully",
          backgroundColor: Colors.pink, colorText: Colors.white);
      Get.to(const HomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Oh Snap", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Oh Snap", "Error occured while signning in",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
