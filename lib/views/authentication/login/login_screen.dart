import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/authentication_controller.dart.dart';
import '../../utils/image.dart';
import '../register/register.dart';
import '../widgets/text_field_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showProgressbar = false;
  var authController = AuthenticationController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    DImages.logo1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text("Login to find find your best match",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 28,
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
                      if (emailController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty) {
                        setState(() {
                          showProgressbar = true;
                        });
                        await authController.loginUser(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        setState(() {
                          showProgressbar = false;
                        });
                      } else {
                        Get.snackbar("Oh Snap",
                            "Please make sure you fill in all fields",
                            snackPosition: SnackPosition.BOTTOM,
                            icon: const Icon(Icons.error_outline));
                      }
                    },
                    child: const Text(
                      "Login",
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
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: const Text(
                          "Register here",
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
      ),
    );
  }
}
