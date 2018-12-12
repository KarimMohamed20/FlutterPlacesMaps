import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDemo extends StatefulWidget {
  final lat;
  final lng;
  MapsDemo(this.lat, this.lng);
  @override
  State createState() => MapsPageState();
}

class MapsPageState extends State<MapsDemo> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 27, 76, 1),
        title: new Text('Location'),
      ),
      body: Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
              ),
            ),
          ) 
                
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        new CameraPosition(
          bearing: 270.0,
          target: LatLng(widget.lat, widget.lng),
          zoom: 27.0,
          tilt: 17.0
        ),
      ));
      mapController.addMarker(MarkerOptions(
        position: LatLng(widget.lat, widget.lng),
        draggable: true,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}