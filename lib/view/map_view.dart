//<<<<<<< .mine
import 'package:flutter/material.dart';
import 'package:park_easy_app/controller/select_car_park_controller.dart';
import 'package:park_easy_app/view/car_park_card.dart';
import 'package:park_easy_app/view/select_dialog_box_view.dart';
import '../interface/park_easy_observer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/destination.dart';
import '../model/car_park_manager.dart';
import '../model/car_park.dart';
import 'package:park_easy_app/model/destination_manager.dart';
import 'package:park_easy_app/model/car_park_manager.dart';

class MapView extends StatefulWidget {

  const MapView();

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> implements ParkEasyObserver {
  List<CarPark> carParkList = [];
  List<Marker> allMarkers = [];
  CarPark selectedCarPark;

  double colour;

  void update() {
    List data = CarParkManager.getData();
    this.setState((){
      this.carParkList = data[0];
      this.selectedCarPark = data[1];
      allMarkers.clear();
      for (CarPark carPark in carParkList) {
        if (carPark.fraction_taken < 0.6) {
          colour = BitmapDescriptor.hueGreen;
        } else if (carPark.fraction_taken >= 0.6 &&
            carPark.fraction_taken <= 0.9) {
          colour = BitmapDescriptor.hueOrange;
        } else {
          colour = BitmapDescriptor.hueRed;
        }
        allMarkers.add(Marker(
            markerId: MarkerId(carPark.number),
            draggable: false,
            icon: BitmapDescriptor.defaultMarkerWithHue(colour),
            onTap: () {
              print(carPark.number);
              SelectCarParkController.handleSelectedCarPark(carPark, context);
            },
            position: LatLng(
                carPark.latitude,
                carPark
                    .longitude) //LatLng(carParkList[i].latitude, carParkList[i].longitude)
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    CarParkManager.attach(this);

    print("INITTED");

    List data = CarParkManager.getData();
    this.carParkList = data[0];
    this.selectedCarPark = data[1];

    for (CarPark carPark in carParkList) {
      if (carPark.fraction_taken < 0.6) {
        colour = BitmapDescriptor.hueGreen;
      } else if (carPark.fraction_taken >= 0.6 &&
          carPark.fraction_taken <= 0.9) {
        colour = BitmapDescriptor.hueOrange;
      } else {
        colour = BitmapDescriptor.hueRed;
      }
      allMarkers.add(Marker(
          markerId: MarkerId(carPark.number),
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(colour),
          onTap: () {
            print(carPark.number);
            SelectCarParkController.handleSelectedCarPark(carPark, context);
          },
          position: LatLng(
              carPark.latitude,
              carPark
                  .longitude) //LatLng(carParkList[i].latitude, carParkList[i].longitude)
          ));
    }
  }

  @override
  void dispose() {
    CarParkManager.detach(this);
    super.dispose();
  }

  GoogleMapController mapController;

  final LatLng _center = const LatLng(1.359, 103.80);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  bool active;
  int zoomLevel;
  List<CarPark> listOfPins; //List should be of type coordinates

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height - 300,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.25,
          ),
          markers: Set.from(allMarkers),
        ),
      ),
    );
  }
}
