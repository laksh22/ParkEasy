/**
 * This class implements the ShowInfoController class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

import 'package:park_easy_app/view/information_dialog_box_view.dart';

class ShowInfoController {
  static void handleShowInfoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return InformationDialogBoxView();
        });
  }
}