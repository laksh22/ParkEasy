/**
 * This class implements the SearchDestinationController class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:park_easy_app/model/destination.dart';
import 'package:park_easy_app/model/destination_manager.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';

class SearchDestinationController implements ParkEasyObserver{

  void update() {}

  void handleEnterDestination(String text) {
    DestinationManager.getDestinationList(text);
  }

  void handleSelectDestination(Destination selectedDestination) {
    DestinationManager.selectDestination(selectedDestination);
  }
}