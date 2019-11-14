/**
 * This class implements the DestinationManager class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:park_easy_app/model/destination.dart';
import 'package:park_easy_app/interface/google_api_interface.dart';
import 'package:park_easy_app/interface/park_easy_subject.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';

class DestinationManager implements ParkEasySubject{

  static List<Destination> destinationList = [];
  static Destination selectedDestination;
  static List<ParkEasyObserver> observers = [];

  //MVC Functions
  static void attach(ParkEasyObserver o) {
    DestinationManager.observers.add(o);
  }

  static void detach(ParkEasyObserver o) {
    DestinationManager.observers.remove(o);
  }

  static void notify() {
    for(ParkEasyObserver o in observers) {
      o.update();
    }
  }

  static List getData() {
    return [destinationList, selectedDestination];
  }

  //Destination manager functions
  static void getDestinationList(String text) async {
    DestinationManager.destinationList = await GoogleAPIInterface.getMatchingLocations(text);
    DestinationManager.notify();
  }

  static void selectDestination(Destination selectedDestination) async {
    DestinationManager.selectedDestination = selectedDestination;
    DestinationManager.selectedDestination = await GoogleAPIInterface.getLatLong(selectedDestination);
    DestinationManager.notify();
  }
}