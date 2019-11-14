/**
 * This class implements the ShowInfoButton class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class ShowInfoButton extends StatefulWidget {

  final Function showInfoDialog;

  const ShowInfoButton({this.showInfoDialog});

  @override
  _ShowInfoButtonState createState() => _ShowInfoButtonState();
}

class _ShowInfoButtonState extends State<ShowInfoButton> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: new Icon(Icons.info_outline),
      iconSize: 40.0,
      color: Colors.white70,
      onPressed: () {
        widget.showInfoDialog();
      },
    );
  }
}