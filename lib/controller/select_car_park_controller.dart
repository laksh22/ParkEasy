import 'package:flutter/material.dart';
import 'package:park_easy_app/model/car_park.dart';
import 'package:park_easy_app/model/car_park_manager.dart';
import 'package:park_easy_app/view/select_dialog_box_view.dart';

class SelectCarParkController
{
  static void handleSelectedCarPark(CarPark selectedCarPark, BuildContext context)
  {
    CarParkManager.selectCarPark(selectedCarPark);
    showDialog(
        context: context,
        builder: (context) {
          return SelectDialogBoxView();
        });
  }
}