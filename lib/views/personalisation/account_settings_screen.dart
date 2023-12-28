import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/views/Core/Home/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../authentication/widgets/text_field_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool uploading = false;
  bool next = false;
  List<File> _images = [];
  List<String> urlsList = [];
  double val = 0;
  chooseImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _images.add(File(pickedFile!.path));
    });
  }

  uploadImages() async {
    int i = 1;
    for (var img in _images) {
      setState(() {
        val = i / _images.length;
      });
      var refImages = FirebaseStorage.instance.ref().child(
          "images/${DateTime.now().microsecondsSinceEpoch.toString()}.jpg");
      await refImages.putFile(img).whenComplete(() async {
        await refImages.getDownloadURL().then((value) {
          urlsList.add(value);
          i++;
        });
      });
    }
  }

  ///Personal info
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController profileheadingController = TextEditingController();
  TextEditingController lookingForInPartnerController = TextEditingController();

  ///Apperance
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bodytypeController = TextEditingController();
//Lifestyle
  TextEditingController drinkController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController maritalstatusController = TextEditingController();
  TextEditingController haveChildrenController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController employmentStatusController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController livingsituationController = TextEditingController();
  TextEditingController relocateController = TextEditingController();
  TextEditingController relationshiplookingforController =
      TextEditingController();
//background
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController ethnicityController = TextEditingController();

  //Personal info
  String name = '';
  String age = '';
  String gender = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  //Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  //Lietyle
  String drink = '';
  String smaoke = '';
  String maritalStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipLookingFor = '';

  //Bakround
  String nationality = '';
  String education = '';
  String language = '';
  String religion = '';
  String ethnicity = '';
  retriverUserData() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUserId)
        .get()
        .then(
      (value) {
        if (value.exists) {
          setState(() {
            name = value.data()!['name'];
            nameController.text = name;
            age = value.data()!['age'].toString();
            ageController.text = age;
            gender = value.data()!['gender'];
            genderController.text = gender;
            phoneNo = value.data()!['phoneNo'];
            phonenumberController.text = phoneNo;
            city = value.data()!['city'];
            cityController.text = city;
            country = value.data()!['country'];
            countryController.text = country;
            profileHeading = value.data()!['profileHeading'];
            profileheadingController.text = profileHeading;
            lookingForInaPartner = value.data()!['lookingForInaPartner'];
            lookingForInPartnerController.text = lookingForInaPartner;
            height = value.data()!['height'];
            heightController.text = height;
            weight = value.data()!['weight'];
            weightController.text = weight;
            bodyType = value.data()!['bodyType'];
            bodytypeController.text = bodyType;

            drink = value.data()!['drink'];
            drinkController.text = drink;
            smaoke = value.data()!['smaoke'];
            smokeController.text = smaoke;
            maritalStatus = value.data()!['maritalStatus'];
            maritalstatusController.text = maritalStatus;
            haveChildren = value.data()!['haveChildren'];
            haveChildrenController.text = haveChildren;
            noOfChildren = value.data()!['noOfChildren'];
            noOfChildrenController.text = noOfChildren;
            profession = value.data()!['profession'];
            professionController.text = profession;
            employmentStatus = value.data()!['employmentStatus'];
            employmentStatusController.text = employmentStatus;
            income = value.data()!['income'];
            incomeController.text = income;
            livingSituation = value.data()!['livingSituation'];
            livingsituationController.text = livingSituation;
            willingToRelocate = value.data()!['willingToRelocate'];
            relocateController.text = willingToRelocate;
            relationshipLookingFor = value.data()!['relationshipLookingFor'];
            relationshiplookingforController.text = relationshipLookingFor;

            nationality = value.data()!['nationality'];
            nationalityController.text = nationality;
            education = value.data()!['education'];
            educationController.text = education;
            language = value.data()!['language'];
            languageController.text = language;
            religion = value.data()!['religion'];
            religionController.text = religion;
            ethnicity = value.data()!['ethnicity'];
            ethnicityController.text = ethnicity;
          });
        }
      },
    );
  }

  updateUserDataToFirebaseFirestoreDatabase(
    String name,
    String age,
    String gender,
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 200,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text("Uploading images....")
              ],
            )),
          ),
        );
      },
    );
    await uploadImages();
    FirebaseFirestore.instance.collection("Users").doc(currentUserId).update({
      'name': name,
      'age': age,
      'phoneNo': phoneNo,
      'city': city,
      'country': country,
      'profileHeading': profileHeading,
      'lookingForInaPartner': lookingForInaPartner,
      'height': height,
      'weight': weight,
      'bodyType': bodyType,
      'drink': drink,
      'smaoke': smaoke,
      'maritalStatus': maritalStatus,
      'haveChildren': haveChildren,
      'noOfChildren': noOfChildren,
      'profession': profession,
      'employmentStatus': employmentStatus,
      'income': income,
      'livingSituation': livingSituation,
      'willingToRelocate': willingToRelocate,
      'relationshipLookingFor': relationshipLookingFor,
      'nationality': nationality,
      'education': education,
      'language': language,
      'religion': religion,
      'ethnicity': ethnicity,
      'urlImage1': urlsList[0].toString(),
      'urlImage2': urlsList[1].toString(),
      'urlImage3': urlsList[2].toString(),
      'urlImage4': urlsList[3].toString(),
      'urlImage5': urlsList[4].toString(),
    });
    Get.snackbar("Updated", "Your account has been updated successfully",
        colorText: Colors.white, backgroundColor: Colors.pink);
    Get.to(const HomeScreen());
    setState(() {
      uploading = false;
      urlsList.clear();
      _images.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    retriverUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            next ? "Profile Information" : "Choose 5 images",
          ),
          actions: [
            next
                ? Container()
                : IconButton(
                    onPressed: () {
                      if (_images.length == 5) {
                        setState(() {
                          uploading = false;
                          next = true;
                        });
                      } else {
                        Get.snackbar("5 Images", "Please Choose 5 Images");
                      }
                    },
                    icon: const Icon(Icons.navigate_next_outlined))
          ],
        ),
        body: next
            ? SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),

                    ///Personal info
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Personal Info :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      iconData: Icons.person_outlined,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: ageController,
                      labelText: 'Age',
                      iconData: Icons.numbers,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: genderController,
                      labelText: 'Gender(Male or Female)',
                      iconData: Icons.female,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: phonenumberController,
                      labelText: 'Phone',
                      iconData: Icons.phone,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: cityController,
                      labelText: 'City',
                      iconData: Icons.location_city,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: countryController,
                      labelText: 'Country',
                      iconData: Icons.location_city_outlined,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: profileheadingController,
                      labelText: "Profile Heading(Let's catch up over snacks)",
                      iconData: Icons.text_fields,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: lookingForInPartnerController,
                      labelText: 'What are you looking for in a partner',
                      iconData: Icons.face,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Appearance
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Appearance :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: heightController,
                      labelText: 'Height',
                      iconData: Icons.insert_chart,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: weightController,
                      labelText: 'Weight',
                      iconData: Icons.table_chart,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: bodytypeController,
                      labelText: 'Body Type(slim,fat,...)',
                      iconData: Icons.type_specimen,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lifestyle ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: drinkController,
                      labelText: 'Do you drink ?',
                      iconData: Icons.local_drink,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: smokeController,
                      labelText: 'Do you smoke ?',
                      iconData: Icons.smoking_rooms,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: maritalstatusController,
                      labelText: 'Marital Status',
                      iconData: CupertinoIcons.person_2,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: haveChildrenController,
                      labelText: 'Do you have children ?',
                      iconData: CupertinoIcons.person_3,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: noOfChildrenController,
                      labelText: 'no Of children(if any)',
                      iconData: CupertinoIcons.person_3_fill,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: professionController,
                      labelText: 'Profession',
                      iconData: Icons.business_center,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: employmentStatusController,
                      labelText: 'Employment Status',
                      iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: incomeController,
                      labelText: 'Income',
                      iconData: CupertinoIcons.money_dollar_circle,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: livingsituationController,
                      labelText: 'Living Situation',
                      iconData: CupertinoIcons.person_2_square_stack,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: relocateController,
                      labelText: 'Willing to relocate',
                      iconData: CupertinoIcons.placemark,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: relationshiplookingforController,
                      labelText:
                          'What type of relationship are you looking for?',
                      iconData: CupertinoIcons.person,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Background
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Background- Cultural values :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: nationalityController,
                      labelText: 'Nationality',
                      iconData: CupertinoIcons.flag,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: educationController,
                      labelText: 'Education',
                      iconData: Icons.history_edu,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: languageController,
                      labelText: 'Language',
                      iconData: Icons.language,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: religionController,
                      labelText: 'Religion',
                      iconData: Icons.church_outlined,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: ethnicityController,
                      labelText: 'Ethnicity',
                      iconData: CupertinoIcons.eye,
                      isObscured: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          if (nameController.text.trim().isNotEmpty &&
                              ageController.text.trim().isNotEmpty &&
                              genderController.text.trim().isNotEmpty &&
                              phonenumberController.text.trim().isNotEmpty &&
                              cityController.text.trim().isNotEmpty &&
                              countryController.text.trim().isNotEmpty &&
                              profileheadingController.text.trim().isNotEmpty &&
                              lookingForInPartnerController.text
                                  .trim()
                                  .isNotEmpty &&
                              heightController.text.trim().isNotEmpty &&
                              weightController.text.trim().isNotEmpty &&
                              bodytypeController.text.trim().isNotEmpty &&
                              drinkController.text.trim().isNotEmpty &&
                              smokeController.text.trim().isNotEmpty &&
                              maritalstatusController.text.trim().isNotEmpty &&
                              haveChildrenController.text.trim().isNotEmpty &&
                              noOfChildrenController.text.trim().isNotEmpty &&
                              professionController.text.trim().isNotEmpty &&
                              employmentStatusController.text
                                  .trim()
                                  .isNotEmpty &&
                              incomeController.text.trim().isNotEmpty &&
                              livingsituationController.text
                                  .trim()
                                  .isNotEmpty &&
                              relocateController.text.trim().isNotEmpty &&
                              relationshiplookingforController.text
                                  .trim()
                                  .isNotEmpty &&
                              nationalityController.text.trim().isNotEmpty &&
                              educationController.text.trim().isNotEmpty &&
                              languageController.text.trim().isNotEmpty &&
                              religionController.text.trim().isNotEmpty &&
                              ethnicityController.text.trim().isNotEmpty) {
                            _images.length > 0
                                ? await updateUserDataToFirebaseFirestoreDatabase(
                                    nameController.text.trim(),
                                    ageController.text.trim(),
                                    genderController.text.trim(),
                                    phonenumberController.text.trim(),
                                    cityController.text.trim(),
                                    countryController.text.trim(),
                                    profileheadingController.text.trim(),
                                    lookingForInPartnerController.text.trim(),
                                    heightController.text.trim(),
                                    weightController.text.trim(),
                                    bodytypeController.text.trim(),
                                    drinkController.text.trim(),
                                    smokeController.text.trim(),
                                    maritalstatusController.text.trim(),
                                    haveChildrenController.text.trim(),
                                    noOfChildrenController.text.trim(),
                                    professionController.text.trim(),
                                    employmentStatusController.text.trim(),
                                    incomeController.text.trim(),
                                    livingsituationController.text.trim(),
                                    relocateController.text.trim(),
                                    relationshiplookingforController.text
                                        .trim(),
                                    nationalityController.text.trim(),
                                    educationController.text.trim(),
                                    languageController.text.trim(),
                                    religionController.text.trim(),
                                    ethnicityController.text.trim())
                                : null;
                          } else {
                            Get.snackbar("A Field is Empty",
                                "Please make sure you fill in every field");
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ))
            : Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    child: GridView.builder(
                      itemCount: _images.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        if (_images.length < 5) {
                                          !uploading ? chooseImage() : null;
                                        } else {
                                          setState(() {
                                            uploading = true;
                                          });
                                          Get.snackbar('5 Images chosen',
                                              'Only a  total of 5 Images is allowed');
                                        }
                                      },
                                      icon: const Icon(Icons.add)),
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(_images[index - 1]),
                                        fit: BoxFit.cover)),
                              );
                      },
                    ),
                  ),
                ],
              ));
  }
}
