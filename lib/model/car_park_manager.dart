import 'dart:math';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

import 'package:park_easy_app/interface/park_easy_subject.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';
import 'package:park_easy_app/model/car_park.dart';
import 'package:park_easy_app/interface/government_api_interface.dart';
import 'package:park_easy_app/model/destination_manager.dart';

class CarParkManager implements ParkEasySubject {
  static List<CarPark> allCarParkList = [];
  static List<CarPark> neededCarParkList = [];
  static CarPark selectedCarPark;
  static int sortType = 1;
  static List<ParkEasyObserver> observers = [];

  static int attachCount = 0;

  //***************************MVC Functions****************************
  static void attach(ParkEasyObserver o) {
    CarParkManager.observers.add(o);

    if (attachCount == 0) {
      getAllCarParkList();
      attachCount = 1;
    }
  }

  static void detach(ParkEasyObserver o) {
    CarParkManager.observers.remove(o);
  }

  static void notify() {
    for (ParkEasyObserver o in observers) {
      o.update();
    }
  }

  static List getData() {
    return [neededCarParkList, selectedCarPark];
  }
//**********************************************************************

  static void getAllCarParkList() async {
    List<List<dynamic>> CSVdata = [];

    final String myData =
        await rootBundle.loadString("assets/hdb-carpark-information.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    CSVdata = csvTable;

    int i = 1;
    while (i <
        2121) //note that i starts from 1 since data[0][0] is list of attributes, 2122 is the total number of car parks in database
    {
      CarPark x = new CarPark(
          CSVdata[i][0], CSVdata[i][1], CSVdata[i][2], CSVdata[i][3]);
      allCarParkList.add(x);
      neededCarParkList.add(x);
      i++;
    }
    CarParkManager.notify();
    getNeededCarParkList(5.0);
  }

  static getNeededCarParkList(
      double
          range) async //when changedistctrl calls it, passes in a dist as parameter
  {
    CarParkManager.neededCarParkList.clear();

    var a = await GovtDataAPI().getData();
    var govtData = json.decode(a);

    for (int i = 0; i < allCarParkList.length; i++) {
      var distance = getDistance(
              DestinationManager.selectedDestination.latitude,
              DestinationManager.selectedDestination.longitude,
              allCarParkList[i].latitude,
              allCarParkList[i].longitude)
          .abs();
      distance = double.parse(distance.toStringAsFixed(1));
      if (distance <= range) {
        CarPark tempCarPark = new CarPark(
            allCarParkList[i].number,
            allCarParkList[i].address,
            allCarParkList[i].latitude,
            allCarParkList[i].longitude);
        tempCarPark.distance = distance;
        CarParkManager.neededCarParkList.add(tempCarPark);
      }

    }

    var pos;
    for (pos = 1; pos < govtData["items"][0]['carpark_data'].length; pos++) {
      String number =
          govtData["items"][0]['carpark_data'][pos]['carpark_number'];
      int lotsAvailable = int.parse(govtData["items"][0]['carpark_data'][pos]
          ['carpark_info'][0]['lots_available']);
      int totalLots = int.parse(govtData["items"][0]['carpark_data'][pos]
          ['carpark_info'][0]['total_lots']);
      int index = neededCarParkList.indexWhere((carPark) => carPark.number == number);
      if (index != -1) {
        neededCarParkList[index].number = number;
        neededCarParkList[index].lotsAvailable = lotsAvailable;
        neededCarParkList[index].totalLots = totalLots;
        neededCarParkList[index].fraction_taken = (totalLots-lotsAvailable)/totalLots;
      }
    }

    CarParkManager.notify();
    CarParkManager.sortCarParkList(CarParkManager.sortType);
  }

  static void sortCarParkList(int type) // boolean yes for sort by distance
  {
    CarParkManager.sortType = type;
    if (type == 1) {
      neededCarParkList.sort((a, b) => a.distance.compareTo(b.distance));
    } else {
      neededCarParkList
          .sort((a, b) => b.lotsAvailable.compareTo(a.lotsAvailable));
    }
    CarParkManager.notify();
  }

  static void selectCarPark(CarPark enteredCarPark) {
    selectedCarPark = enteredCarPark;
    CarParkManager.notify();
  }

  static double getDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = (lat2 - lat1) * 3.141 / 180; // deg2rad below
    var dLon = (lon2 - lon1) * 3.141 / 180;
    var a = 0.5 -
        cos(dLat) / 2 +
        cos(lat1 * 3.141 / 180) * cos(lat2 * 3.141 / 180) * (1 - cos(dLon)) / 2;

    return R * 2 * asin(sqrt(a));
  }
}
