import 'package:dating_app/views/Core/likes/like_sent_liked_received_screen.dart';
import 'package:dating_app/views/Core/profile/user_details_screen.dart';
import 'package:dating_app/views/Core/swipe/swipe_screen.dart';
import 'package:dating_app/views/Core/views/view_sent_view_received_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../favourite/favourite_sent_favourite_recieved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List screens = [
    const SwippingScreen(),
    const ViewSentViewReceivedScreen(),
    const FavouriteSentFavouriteReceivedScreen(),
    const LikeSentLikeReceivedScreen(),
    UserDetailsScreen(
      userId: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        onTap: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.eye), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.like), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.user), label: ''),
        ],
      ),
      body: screens[screenIndex],
    );
  }
}
