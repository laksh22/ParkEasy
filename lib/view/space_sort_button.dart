/**
 * This class implements the SpaceSortButton class with
 * the attribute selected
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class SpaceSortButton extends StatefulWidget {

  final void Function(int type) orderBy;

  const SpaceSortButton({this.orderBy});

  @override
  _SpaceSortButtonState createState() => _SpaceSortButtonState();
}

class _SpaceSortButtonState extends State<SpaceSortButton> {

  bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Spaces",
            style: new TextStyle(
                color: Colors.black87, fontSize: 30.0),
          ),
        ),
        color: Colors.white,
        onPressed: () {
          widget.orderBy(0);
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
