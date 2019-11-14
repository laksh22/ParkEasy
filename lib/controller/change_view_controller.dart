import 'package:park_easy_app/interface/park_easy_observer.dart';

import '../view/display_car_parks_view.dart';

class ChangeViewController implements ParkEasyObserver{
  static int handleChangeView(int type){
    return type;
  }

  void update(){}
}