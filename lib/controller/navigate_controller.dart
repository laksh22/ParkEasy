/**
 * This class implements the NavigateController class
 * This class opens up the chosen car park in Google Maps
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:url_launcher/url_launcher.dart';

class NavigateController {
  static void handleNavigate(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}