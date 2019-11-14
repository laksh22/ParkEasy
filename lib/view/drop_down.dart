/**
 * This class implements the DropDown class
 *
 * @author Lakshyajeet Dwivedee
 */

import 'package:flutter/material.dart';

import 'package:park_easy_app/model/destination.dart';

class DropDown extends StatefulWidget {

  final Function selectDestination;
  final List<Destination> destinations;
  final Destination selectedDestination;

  const DropDown({this.selectDestination, this.destinations, this.selectedDestination});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 2.0),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          //print(widget.destinations[index].name);
            return GestureDetector(
              onTap: (){
                widget.selectDestination(widget.destinations[index]);
              },
              child: Card(
                  color: (widget.selectedDestination != null && widget.selectedDestination.name == widget.destinations[index].name) ? Colors.lightBlueAccent : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 10.0, right: 5.0),
                    child: Text(widget.destinations[index].name
                      , style: new TextStyle(fontSize: 20.0),),
                  ),

                elevation: 1.5

          ),
            );
        },
        itemCount: widget.destinations == null ? 0 : widget.destinations.length,
      ),
    );
  }
}
