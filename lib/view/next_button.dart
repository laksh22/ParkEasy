/**
 * This class implements the NextButton class with
 * the attribute active
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

import 'display_car_parks_view.dart';

class NextButton extends StatefulWidget {

  final bool active;

  const NextButton({this.active});

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(
          "Next",
          style: new TextStyle(
              color: Colors.white, fontSize: 25.0),
        ),
        color: widget.active ? Colors.black87: Colors.black12,
        onPressed: () {
          widget.active ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DisplayCarParks()),
          ) : null;

        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      height: 55.0,
    );


  }
}