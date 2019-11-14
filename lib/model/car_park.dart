class CarPark{
  String number, address;
  int lotsAvailable, totalLots;
  double fraction_taken,  distance, latitude, longitude;

  CarPark(String number, String address, double lat, double long){
    this.number = number;
    this.address = address;
    this.lotsAvailable = 0; //api
    this.totalLots = 1; //api
    this.fraction_taken = (totalLots-lotsAvailable)/totalLots; //calc
    this.distance = 0.0; //calc
    this.latitude = lat;
    this.longitude = long;
  }
}