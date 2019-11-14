/**
 * This class implements the SearchDestinationView class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

import 'package:park_easy_app/controller/search_destination_controller.dart';
import 'package:park_easy_app/controller/show_info_controller.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';
import 'package:park_easy_app/interface/park_easy_subject.dart';
import 'package:park_easy_app/model/car_park.dart';
import 'package:park_easy_app/model/destination.dart';
import 'package:park_easy_app/model/destination_manager.dart';
import 'package:park_easy_app/view/car_park_card.dart';
import 'package:park_easy_app/view/drop_down.dart';
import 'package:park_easy_app/view/next_button.dart';
import 'package:park_easy_app/view/search_box.dart';
import 'package:park_easy_app/view/show_info_button.dart';

class SearchDestinationView extends StatefulWidget {
  @override
  _SearchDestinationViewState createState() => _SearchDestinationViewState();
}

class _SearchDestinationViewState extends State<SearchDestinationView>
    with SingleTickerProviderStateMixin implements ParkEasyObserver {

  _SearchDestinationViewState(){}

  Destination selectedDestination = null;
  List<Destination> destinations = [];

  SearchDestinationController searchDestinationController = new SearchDestinationController();

  void update() {
    List data = DestinationManager.getData();
    this.setState((){
      this.selectedDestination = data[1];
      this.destinations = data[0];
    });
  }

  showInfoDialog(BuildContext context) {
    ShowInfoController.handleShowInfoDialog(context);
  }

  enterDestination(String text) {
    searchDestinationController.handleEnterDestination(text);
  }

  selectDestination(Destination selectedDestination) {
    this.selectedDestination = selectedDestination;
    searchDestinationController.handleSelectDestination(selectedDestination);
  }

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    DestinationManager.attach(this);
  }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  child: Image.asset("assets/car_image.png"),
                  transform:
                      Matrix4.translationValues(0.0, animation.value, 0.0)),
              Text(
                "ParkEasy",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: Colors.black87),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    SearchBox(
                      enterDestination: enterDestination,
                    ),
                    NextButton(
                      active: this.selectedDestination == null ? false : true,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                      height: 180.0,
                      width: 288.0,
                      child: DropDown(
                        selectDestination: this.selectDestination,
                        destinations: this.destinations,
                        selectedDestination: this.selectedDestination,
                      )),
                ),
              ),
              Container(
                child: Align(
                  child: ShowInfoButton(
                    showInfoDialog: () {
                      this.showInfoDialog(context);
                    },
                  ),
                  alignment: Alignment.bottomRight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
