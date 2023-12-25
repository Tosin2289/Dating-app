// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/core/user_details_controller.dart';

class UserDetailsScreen extends StatefulWidget {
  String? userId;
  UserDetailsScreen({
    Key? key,
    this.userId,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  var userDetailsController = Get.put(UserDetailsController());
  @override
  void initState() {
    super.initState();
    userDetailsController.reteriveUserInfo(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.logout))
            ],
            title: const Text(
              "Profile Name",
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
