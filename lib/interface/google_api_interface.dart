/**
 * This class implements the GoogleAPIInterface class
 *
 * @author Lakshyajeet Dwivedee
 */
import 'package:park_easy_app/model/destination.dart';
import 'package:park_easy_app/api_keys.dart';

import 'package:google_maps_webservice/places.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:park_easy_app/model/destination_manager.dart';

class GoogleAPIInterface {

  static List<Destination> listOfPlaces = [];

  static Future<Destination> getLatLong(Destination destination) async {

      String id = destination.placeID;

      String baseDetailsURL = 'https://maps.googleapis.com/maps/api/place/details/json?place_id';

      Response res = await Dio().get('$baseDetailsURL=$id&fields=geometry&key=$MAPS_API_KEY');

      var locationDetails = res.data["result"]["geometry"]["location"];
      double lat = locationDetails["lat"];
      double lng = locationDetails["lng"];

      destination.latitude = lat;
      destination.longitude = lng;

      return destination;
  }

  static Future<List<Destination>> getMatchingLocations(String input) async {
    if(input.isEmpty){
    } else {

      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$MAPS_API_KEY&components=country:sg';

      Response response = await Dio().get(request);

      final predictions = response.data['predictions'];

      listOfPlaces.clear();

      for(var i = 0; i < 5 && i < predictions.length; i++){
        listOfPlaces.add(Destination(predictions[i]["description"], predictions[i]["place_id"], 0.0, 0.0));
      }

      return listOfPlaces;
    }
  }

}