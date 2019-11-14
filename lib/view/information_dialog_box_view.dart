/**
 * This class implements the InformationDialogBoxView class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class InformationDialogBoxView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(
        "Find a carpark in 4 easy steps!",
        style: new TextStyle(color: Colors.deepPurple),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "1. Select your destination!",
            style: new TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Where do you want to go?",
            style: new TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            "2. Customise to your needs!",
            style: new TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Filter results based on proximity and number of lots available",
            style: new TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            "3. Choose a carpark!",
            style: new TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Click on the card or pin to see more details",
            style: new TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            "4. Navigate to the carpark!",
            style: new TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "'Navigate' to a chosen carpark using Google Maps",
            style: new TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            "What do the colours mean?",
            style: new TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            children: <Widget>[
              Container(
                color: Colors.green,
                width: 20.0,
                height: 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Text(
                "< 60% occupancy",
                style: new TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            children: <Widget>[
              Container(
                color: Colors.orange,
                width: 20.0,
                height: 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Text(
                "60% - 90% occupancy",
                style: new TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 20.0,
                height: 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Text(
                "> 90% occupancy",
                style: new TextStyle(fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            "Want to go back and check out other results?",
            style: new TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          Text(
            "Click on the card or pin to see more details",
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }
}
