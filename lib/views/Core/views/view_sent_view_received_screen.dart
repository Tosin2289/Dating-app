import 'package:flutter/material.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() =>
      _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState
    extends State<ViewSentViewReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "View Sent View Recived Screen",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
