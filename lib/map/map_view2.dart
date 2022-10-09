

import 'package:ecommerce/map/map1.dart';
import 'package:ecommerce/model/cart_product_model.dart';

import 'package:ecommerce/view/check/address_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

class MapView2 extends StatefulWidget {
  num total;
  List<CartProductModel> cartmodel;

  MapView2({this.total, this.cartmodel});

  @override
  _MapView2State createState() => _MapView2State();
}

class _MapView2State extends State<MapView2> {
  var locationMessage = "";
  var position;

  @override
  void initState() {
    currentLocation();
    // TODO: implement initState
    super.initState();
    //  currentLocation();
  }

  void currentLocation() async {

    location_permission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    setState(() {
      locationMessage = "$position";
    });
  }

  void location_permission() async {
    final PermissionStatus permission = await _getLocationPermission();
    if (permission == PermissionStatus.granted) {
      final PermissionStatus permissionStatus = await LocationPermissions()
          .requestPermissions(
              permissionLevel: LocationPermissionLevel.location);
    }
  }

  Future<PermissionStatus> _getLocationPermission() async {
    final PermissionStatus permission = await LocationPermissions()
        .checkPermissionStatus(level: LocationPermissionLevel.location);

    if (permission != PermissionStatus.granted) {
      final PermissionStatus permissionStatus = await LocationPermissions()
          .requestPermissions(
              permissionLevel: LocationPermissionLevel.location);

      return permissionStatus;
    } else {
      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          children: [
            Container(
              height: 320,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(37.43296265331129, -122.08832357078792),
                    zoom: 19.151926040649414),
              ),
            ),
            SizedBox(height: 70),
            //    Text(locationMessage),
            Container(
              height: 50,
              width: 270,
              child: RaisedButton(
                onPressed: () {
                  currentLocation();
                  currentLocation();
                  print("jjjj");
                  Get.to(Map1(
                    position.latitude,
                    position.longitude,
                    widget.total,
                    widget.cartmodel,
                  ));
                  print("ddd");
                },
                color: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "locate the current location",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 12),
            Container(
              height: 50,
              width: 270,
              child: RaisedButton(
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.pinkAccent,
                onPressed: () {
                  Get.to(AdressScreen(
                    total: widget.total,
                    cartmodel: widget.cartmodel,
                    lat: 0.0,
                    long: 0.0,
                  ));
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
