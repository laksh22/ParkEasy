/**
 * This class implements the Startup class
 * This is the startup class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

import 'package:park_easy_app/view/search_destination_view.dart';

void main() => runApp(Startup());

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ParkEasy",
      home: SearchDestinationView(),
    );
  }
}
