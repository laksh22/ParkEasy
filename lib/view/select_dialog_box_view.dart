/**
 * This class implements the SelectDialogBoxView class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';
import 'package:park_easy_app/controller/navigate_controller.dart';
import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';
import 'package:park_easy_app/model/car_park.dart';

class SelectDialogBoxView extends StatefulWidget {

  @override
  _SelectDialogBoxViewState createState() => _SelectDialogBoxViewState();
}

class _SelectDialogBoxViewState extends State<SelectDialogBoxView> implements ParkEasyObserver{

  Color borderColor;
  CarPark carPark;

  void update() {
    this.carPark = CarParkManager.getData()[1];
  }

  void navigate() {
    NavigateController.handleNavigate(this.carPark.latitude, this.carPark.longitude);
  }

  @override
  void initState() {
    var data = CarParkManager.getData();
    this.carPark = data[1];

    if(this.carPark.fraction_taken < 0.6){
      this.borderColor = Colors.greenAccent;
    } else if (0.6 <= this.carPark.fraction_taken && this.carPark.fraction_taken <= 0.9) {
      this.borderColor = Colors.orangeAccent;
    } else {
      this.borderColor = Colors.redAccent;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: new BorderSide(color: this.borderColor, width: 5.0),
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 30.0,
              ),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Text(
                this.carPark.number,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Text(
            this.carPark.address,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.directions_walk,
                size: 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Text(
                "${this.carPark.distance}km away from destination",
                style: new TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.directions_car,
                size: 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Text(
                "${this.carPark.lotsAvailable} lots available",
                style: new TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Center(
            child: RaisedButton(
              color: Colors.green,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.map, color: Colors.white,),
                  Padding(padding: EdgeInsets.only(right: 10.0),),
                  Text("Navigate", style: TextStyle(color: Colors.white),),
                ],
              ),
              onPressed: () {
                this.navigate();
              },
            ),
          )
        ],
      ),
    );
  }
}
