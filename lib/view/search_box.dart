/**
 * This class implements the SearchBox class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {

  final void Function(String text) enterDestination;

  const SearchBox({this.enterDestination});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
        child: TextField(
          onChanged: (value) {
            widget.enterDestination(value);
          },
          decoration: InputDecoration(
            hintText: "Where are you headed today?",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0))),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}