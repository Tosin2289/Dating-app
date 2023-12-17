import 'package:dating_app/views/authentication/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
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
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.black12,
                backgroundImage: AssetImage("assets/profile.png"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ///Personal info
            const Text(
              "Personal Info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
          ]),
        ),
      ),
    ));
  }
}
