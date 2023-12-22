import 'package:dating_app/views/Core/likes/like_sent_liked_received_screen.dart';
import 'package:dating_app/views/Core/profile/user_details_screen.dart';
import 'package:dating_app/views/Core/swipe/swipe_screen.dart';
import 'package:dating_app/views/Core/views/view_sent_view_received_screen.dart';
import 'package:flutter/material.dart';

import '../favourite/favourite_sent_favourite_recieved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List screens = const [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavouriteSentFavouriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Home Screen",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
