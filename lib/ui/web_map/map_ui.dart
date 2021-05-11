import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:railway_admin/utils/colors_file.dart';

class TrainTracking extends StatefulWidget {
  @override
  _TrainTrackingState createState() => _TrainTrackingState();
}

class _TrainTrackingState extends State<TrainTracking> {
  GoogleMapController mapController;

  Position _currentPosition;
  String _currentAddress;

  Set<Marker> allMarkers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final Set<Polyline> _polyline = {};

  /////////////////////////////////////////////////////////////////////////
  GoogleMapController _mapController;

  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  // Method for retrieving the address
  static const LatLng _center =
  const LatLng(37.42796133580664, -122.085749655962);
  @override
  Widget build(BuildContext context) {
    print("date ${DateTime.now()}");
    return Scaffold(
      appBar: AppBar(),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              polylines: _polyline,
              initialCameraPosition:
              CameraPosition(target: _center, zoom: 12.0),
              markers: Set.from(allMarkers),
            ),
            // Positioned(
            //   bottom: 20.0,
            //   child: Container(
            //     height: 200.0,
            //     width: MediaQuery.of(context).size.width,
            //     child: PageView.builder(
            //       controller: _pageController,
            //       itemCount: coffeeShops.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return _coffeeShopList(index);
            //       },
            //     ),
            //   ),
            // )
          ],
        ));
  }

  // void mapCreated(controller) {
  //   setState(() {
  //     _mapController = controller;
  //   });
  // }

}