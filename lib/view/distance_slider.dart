/**
 * This class implements the DistanceSlider class with
 * the attribute range
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

class DistanceSlider extends StatefulWidget {

  final void Function(int range) changeDistance;

  const DistanceSlider({this.changeDistance});

  @override
  _DistanceSliderState createState() => _DistanceSliderState();
}

class _DistanceSliderState extends State<DistanceSlider> {

  RangeValues range = new RangeValues(0, 5);
  RangeLabels labels = new RangeLabels('0', '5');

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: Colors.black54,
      min: 0,
      max: 5,
      divisions: 5,
      values: range,
      labels: labels,
      onChanged: (val) {
        widget.changeDistance(val.end.toInt());
        setState((){
          range = new RangeValues(0, val.end);
          labels = RangeLabels(range.start.toString(), range.end.toString());
        });
      },
    );
  }
}
