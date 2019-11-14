/**
 * This class implements the CarParkCard class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';
import 'package:park_easy_app/controller/select_car_park_controller.dart';
import 'package:park_easy_app/model/car_park.dart';
import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/view/select_dialog_box_view.dart';

class CarParkCard extends StatefulWidget {
  final CarPark carPark;
  final Color borderColor;

  const CarParkCard({this.carPark, this.borderColor});

  @override
  _CarParkCardState createState() => _CarParkCardState();
}

class _CarParkCardState extends State<CarParkCard> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectCarParkController.handleSelectedCarPark(widget.carPark, context);
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            side: new BorderSide(color: widget.borderColor, width: 5.0),
            borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                widget.carPark.number,
                style: new TextStyle(fontSize: 25.0, color: Colors.black54),
              )),
              Container(
                  width: 180.0,
                  child: Text(
                    widget.carPark.address,
                    style: new TextStyle(fontSize: 25.0),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  )),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Empty",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.carPark.lotsAvailable}",
                      style: new TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Distance",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.carPark.distance}km",
                      style: new TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
