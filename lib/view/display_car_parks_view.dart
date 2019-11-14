import 'package:flutter/material.dart';
import 'package:park_easy_app/controller/change_dist_controller.dart';
import 'package:park_easy_app/controller/change_view_controller.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';
import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/view/distance_slider.dart';
import 'package:park_easy_app/view/map_view.dart';
import 'car_park_list_view.dart';
import 'map_view_button.dart';
import 'car_park_list_view_button.dart';

class DisplayCarParks extends StatefulWidget {
  _DisplayCarParksState createState() => _DisplayCarParksState();
}

class _DisplayCarParksState extends State<DisplayCarParks>
    with SingleTickerProviderStateMixin
    implements ParkEasyObserver {
  var viewType = 0;

  void changeView(int type) {
    this.setState(() {
      this.viewType = ChangeViewController.handleChangeView(type);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void update() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],
            ),
          ),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "ParkEasy",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: Colors.black87),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CarParkListViewButton(
                    changeView: this.changeView,
                  ),
                  MapViewButton(
                    changeView: this.changeView,
                  )
                ]),
            Container(
              child: DistanceSlider(
                  changeDistance:
                      ChangeDistanceController.handleChangeDistance),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            ),
            Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text("0km"), Text("5km")],
                )),
            (viewType == 0 ? CarParkListView() : MapView()),
          ])),
    );
  }
}
