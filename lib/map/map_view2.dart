
import 'dart:io';

import 'package:ecommerce/map/map1.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_screen.dart';
import 'package:ecommerce/view/check/address_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location_permissions/location_permissions.dart';

class MapView2 extends StatefulWidget {
  num  total;
  List<CartProductModel>  cartmodel;

  MapView2({this.total,this.cartmodel});



   @override
   _MapView2State createState() => _MapView2State();
 }
 
 class _MapView2State extends State<MapView2> {
   var locationMessage="";
   var position;



   @override
  void initState() {
     currentLocation();
    // TODO: implement initState
    super.initState();
   //  currentLocation();
  }


   void currentLocation()async{

     //LocationPermissions permission = await Geolocator.requestPermission();
     location_permission();
     position = await
     Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);

     var lastposition= await Geolocator.getLastKnownPosition();
     print(lastposition);
     setState(() {
       locationMessage="$position";
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
           child:Center(
             child: Column(
               children: [
                 Container(
                   height:400,
                   child: GoogleMap(
                     initialCameraPosition: CameraPosition(
                         target: LatLng(37.43296265331129, -122.08832357078792),
                         zoom: 19.151926040649414
                     ),
                   ),
                 ),
                 SizedBox(
                     height:10
                 ),
                 //    Text(locationMessage),
                 RaisedButton(
                   onPressed:(){
                    currentLocation();
                     currentLocation();
                     print("jjjj");
                     // print("lll=" +locationMessage);
                     // print( "ooo="+position.latitude.toString(),);
                     // print( "yyy="+position.longitude.toString(),);
                     Get.to
                       (
                         Map1(
                           // l1,l2
                           position.latitude,
                           position.longitude,
                           widget.total,
                           widget.cartmodel,
                         )
                     );
                     print("ddd");
                   },
                   color: Colors.blue,
                   child:
                   Text(
                     "تحديد الموقع الحالي",
                     style:TextStyle(color:Colors.white),
                   ),
                 ),


                  SizedBox(
                    height:20
                  ),
                 RaisedButton(
                   child:Text("قم بالتخطي",style:TextStyle(color:Colors.white,fontSize:18),),
                   color: Colors.blue,
                   onPressed:(){

                     Get.offAll(
                         AdressScreen(
                           total: widget.total,
                           cartmodel: widget.cartmodel,
                           lat:0.0 ,
                           long:0.0,
                         )
                     );
                   },
                 )

               ],
             ),
           )
       ),
     );
   }
 }
 