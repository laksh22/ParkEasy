import 'package:park_easy_app/controller/change_sort_controller.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';
import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/view/distance_sort_button.dart';
import 'package:park_easy_app/view/space_sort_button.dart';

import '../model/car_park.dart';
import 'package:flutter/material.dart';
import 'car_park_card.dart';

class CarParkListView extends StatefulWidget {
  @override
  _CarParkListViewState createState() => _CarParkListViewState();
}

class _CarParkListViewState extends State<CarParkListView>
    implements ParkEasyObserver {

  List<CarPark> carParkList = [];
  CarPark selectedCarPark;

  Color setCardColor(CarPark carPark) {
    if (carPark.fraction_taken < 0.6) {
      return Colors.greenAccent;
    } else if (0.6 <= carPark.fraction_taken &&
        carPark.fraction_taken <= 0.9) {
      return Colors.orangeAccent;
    } else {
      return Colors.redAccent;
    }
  }

  @override
  void initState(){
    super.initState();
    CarParkManager.attach(this);
    List data = CarParkManager.getData();
    this.carParkList = data[0];
    this.selectedCarPark = data[1];
  }

  @override
  void dispose() {
    CarParkManager.detach(this);
    super.dispose();
  }

  void update() {
    //updates list of car parks displayed
    List data = CarParkManager.getData();
    this.setState((){
      this.carParkList = data[0];
      this.selectedCarPark = data[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.58,
              child: new ListView.builder(
                  padding: EdgeInsets.only(top: 2.0),
                  itemCount: this.carParkList == null ? 0: carParkList.length,
                  itemBuilder: (BuildContext context, int index) => new CarParkCard(
                      carPark: carParkList[index],
                  borderColor: setCardColor(carParkList[index]),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Nearest on Top", style: new TextStyle(fontWeight: FontWeight.bold),),
                Text("Most Empty Lots on Top", style: new TextStyle(fontWeight: FontWeight.bold),)
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DistanceSortButton(orderBy: ChangeSortController.handleChangeSort),
                SpaceSortButton(orderBy: ChangeSortController.handleChangeSort),
              ],
            )
          ],
        ),
      ),
    );
  }
}
