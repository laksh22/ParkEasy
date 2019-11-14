import 'package:flutter/material.dart';

class MapViewButton extends StatefulWidget {

  final void Function(int type) changeView;

  const MapViewButton({this.changeView});

  @override
  _MapViewButtonState createState() => _MapViewButtonState();
}

class _MapViewButtonState extends State<MapViewButton > {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Map",
            style: new TextStyle(
                color: Colors.black87, fontSize: 30.0),
          ),
        ),
        color: Colors.white,
        onPressed: () {
          widget.changeView(1);
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

