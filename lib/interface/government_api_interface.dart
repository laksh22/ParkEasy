/**
 * This class implements the GovtAPI class with
 * the attributes jsonData
 *
 * @author Raghav Mantri
 */

//import 'package:park_easy/model/car_park.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'dart:async';

class GovtDataAPI
{
  Future<String> getData() async
  {
    var response = await http.get
      (
        Uri.encodeFull("https://api.data.gov.sg/v1/transport/carpark-availability"),
        headers:
        {
          "Accept": "application/json"
        }
    );

    return response.body;
  }
}


