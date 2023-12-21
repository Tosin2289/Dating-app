import 'dart:io';

import 'package:dating_app/views/authentication/widgets/text_field_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/authentication_controller.dart.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ///Personal info
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
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
  bool showProgressbar = false;
  var authController = AuthenticationController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "To get started now",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  authController.imageFile == null
                      ? const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black12,
                          backgroundImage: AssetImage("assets/profile.png"),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black12,
                          backgroundImage:
                              FileImage(File(authController.imageFile!.path)),
                        ),
                  Positioned(
                    bottom: 20,
                    right: 15,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            onPressed: () async {
                              await authController.pickedImageFileFromGallery();

                              authController.imageFile;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                              size: 16,
                            )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
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
                controller: emailController,
                labelText: 'Email',
                iconData: Icons.email_outlined,
                isObscured: false,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                iconData: Icons.lock_outlined,
                isObscured: true,
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
                labelText: 'Profile Heading',
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
                labelText: 'What type of relationship are you looking for?',
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
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (authController.imageFile != null) {
                      if (nameController.text.trim().isNotEmpty &&
                          emailController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty &&
                          ageController.text.trim().isNotEmpty &&
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
                          employmentStatusController.text.trim().isNotEmpty &&
                          incomeController.text.trim().isNotEmpty &&
                          livingsituationController.text.trim().isNotEmpty &&
                          relocateController.text.trim().isNotEmpty &&
                          relationshiplookingforController.text
                              .trim()
                              .isNotEmpty &&
                          nationalityController.text.trim().isNotEmpty &&
                          educationController.text.trim().isNotEmpty &&
                          languageController.text.trim().isNotEmpty &&
                          religionController.text.trim().isNotEmpty &&
                          ethnicityController.text.trim().isNotEmpty) {
                        setState(() {
                          showProgressbar = true;
                        });
                        await authController.createNewUserAccount(
                            authController.profileImage!,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                            int.parse(ageController.text.trim()),
                            phonenumberController.text.trim(),
                            cityController.text.trim(),
                            countryController.text.trim(),
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
                            relationshiplookingforController.text.trim(),
                            nationalityController.text.trim(),
                            educationController.text.trim(),
                            languageController.text.trim(),
                            religionController.text.trim(),
                            ethnicityController.text.trim());
                        setState(() {
                          showProgressbar = false;
                        });
                      } else {
                        Get.snackbar("A Field is Empty",
                            "Please make sure you fill in every field");
                      }
                    } else {
                      Get.snackbar("Oh Snap", "Please pick image from gallery");
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              showProgressbar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    ));
  }
}
