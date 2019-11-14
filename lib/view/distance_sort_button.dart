/**
 * This class implements the DistanceSortButton class with
 * the attribute selected
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class DistanceSortButton extends StatefulWidget {

  final void Function(int type) orderBy;

  const DistanceSortButton({this.orderBy});

  @override
  _DistanceSortButtonState createState() => _DistanceSortButtonState();
}

class _DistanceSortButtonState extends State<DistanceSortButton> {

  bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            "Distance",
            style: new TextStyle(
                color: Colors.black87, fontSize: 30.0),
          ),
        ),
        color: Colors.white,
        onPressed: () {
          widget.orderBy(1);
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
