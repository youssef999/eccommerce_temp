



 import 'dart:async';
import 'dart:collection';

import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 import 'package:ecommerce/view/check/address_view.dart';
import 'package:hexcolor/hexcolor.dart';

class Map1 extends StatefulWidget {
  double l1,l2;
  num total;
  List<CartProductModel>cartmodel;

  Map1(this.l1,this.l2,this.total,this.cartmodel);


   @override
   _Map1State createState() => _Map1State();
 }

 class _Map1State extends State<Map1> {
   var locationMessage="";
   var position;
   var l1=37.43296265331129;
   var l2=-122.08832357078792;
   GoogleMapController newGooGleMapController;
   LatLng  latLng ;
   CameraPosition  cameraPosition ;
   Completer<GoogleMapController> _googleMapController = Completer();
   CameraPosition initCameraPosition()=> CameraPosition(target: LatLng(l1, l2), zoom: 6);

   void currentLocation()async{
     position=await
     Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
     latLng = LatLng(position.latitude, position.longitude );
     cameraPosition = CameraPosition(target: latLng , zoom: 14);
     var lastposition=await Geolocator.getLastKnownPosition();
     l1=position.latitude;
     l2=position.longitude;

    //collection

     print(lastposition);
     print("lll=" +locationMessage);
     print( "ooo="+position.latitude.toString(),);
     print( "yyy="+position.longitude.toString(),);

     setState(() {
       locationMessage="$position";
       l1=position.latitude;
       l2=position.longitude;

     });

   }
   @override
   Widget build(BuildContext context) {
     var markers=HashSet<Marker>();
     return Scaffold(
       appBar:AppBar(
         backgroundColor: Colors.white,

       ),
      body:
      Column(
        children: [
          SizedBox(
            height:12,
          ),
          Container(
            height:400,
            child:

            GoogleMap(
             initialCameraPosition: CameraPosition(
              target: LatLng(widget.l1,widget.l2),
                 zoom: 19.151926040649414
             ),onMapCreated:(GoogleMapController googleMapController)
            {
              setState(() {

                markers.add(Marker(markerId: MarkerId('1'),
                    visible: true,
                    draggable: true,
                    position:LatLng(widget.l1,widget.l2),
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
          RaisedButton(
            child:Text("موافق  ",style:TextStyle(color:Colors.white,fontSize:18),),
            color:Colors.blue,
            onPressed:(){
               Get.offAll(
                   AdressScreen(
                 total: widget.total,
                 cartmodel: widget.cartmodel,
                     lat:widget.l1 ,
                     long:widget.l2,
               )
               );
            },
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
     );
   }
 }
