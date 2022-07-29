






import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class Map2 extends StatefulWidget {
  double l1,l2;



  Map2(this.l1,this.l2);


  @override
  _Map1State createState() => _Map1State();
}

class _Map1State extends State<Map2> {
  var locationMessage="";
  var position;
  var l1=37.43296265331129;
  var l2=-122.08832357078792;
  GoogleMapController newGooGleMapController;
  LatLng  latLng ;
  CameraPosition  cameraPosition ;
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition initCameraPosition()=> CameraPosition(target: LatLng(l1, l2), zoom: 6);

  // void currentLocation()async{
  //   position=await
  //   Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
  //   latLng = LatLng(position.latitude, position.longitude );
  //   cameraPosition = CameraPosition(target: latLng , zoom: 14);
  //   var lastposition=await Geolocator.getLastKnownPosition();
  //   l1=position.latitude;
  //   l2=position.longitude;
  //
  //   //collection
  //
  //   print(lastposition);
  //   print("lll=" +locationMessage);
  //   print( "ooo="+position.latitude.toString(),);
  //   print( "yyy="+position.longitude.toString(),);
  //
  //   setState(() {
  //     locationMessage="$position";
  //     l1=position.latitude;
  //     l2=position.longitude;
  //
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    var markers=HashSet<Marker>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
            height: 30,
            child: Center(
                child: Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.62
                    ),

                    SizedBox(
                        width: 5
                    ),
                  ],
                ))),
      ),
      body:
      Container(
        color:Colors.red,
        height:700,
        child:

        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.l1??0.0,widget.l2??0.0),
              zoom: 19.151926040649414
          ),onMapCreated:(GoogleMapController googleMapController)
        {
          setState(() {

            markers.add(Marker(markerId: MarkerId('1'),
                visible: true,
                draggable: true,
                position:LatLng(widget.l1??0.0,widget.l2??0.0),
                infoWindow:InfoWindow(
                    title:'Luban 999',
                    snippet: 'ssss'
                ),
                onTap:(){
                  print("marker");
                },
                onDragEnd:(LatLng){
                  print(LatLng);
                }
            ));
          });
        },
          markers: markers,
        ),
      ),
    );
  }
}
