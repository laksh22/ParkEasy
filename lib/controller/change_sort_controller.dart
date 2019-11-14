import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/model/car_park.dart';
import 'package:park_easy_app/interface/park_easy_observer.dart';


class ChangeSortController implements ParkEasyObserver
{
  static void handleChangeSort(int type) //sortByDistance true if need to sort by distance
  {
    CarParkManager.sortCarParkList(type);
  }

  void update(){}
}