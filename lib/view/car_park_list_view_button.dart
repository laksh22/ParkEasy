import 'package:flutter/material.dart';

class CarParkListViewButton extends StatefulWidget {

  final void Function(int type) changeView;

  const CarParkListViewButton({this.changeView});

  @override
  _CarParkListViewButtonState createState() => _CarParkListViewButtonState();
}

class _CarParkListViewButtonState extends State<CarParkListViewButton> {

  bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "List",
            style: new TextStyle(
                color: Colors.black87, fontSize: 30.0),
          ),
        ),
        color: Colors.white,
        onPressed: () {
          widget.changeView(0);
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
