import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';

class ChangeDistanceController implements ParkEasyObserver
{
  static void handleChangeDistance(int range)
  {
    return CarParkManager.getNeededCarParkList(range.toDouble());
  }

  void update() {

  }
}