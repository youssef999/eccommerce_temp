//
// import 'package:ecommerce/map/map1.dart';
// import 'package:ecommerce/model/cart_product_model.dart';
// import 'package:ecommerce/view/brands/brands_view.dart';
// import 'package:ecommerce/viewmodel/auth_view_model.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapView extends StatefulWidget{
//
//   num ? total;
//   List<CartProductModel> ? cartmodel;
//
//   MapView({this.total,this.cartmodel});
//  //
//  //   @override
//  //   _MapViewState createState() => _MapViewState();
//  // }
//  //
//  // class _MapViewState extends State<MapView> {
//  //
//   var locationMessage="";
//   var position;
//
//   void currentLocation()async{
//
//
//      position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
//  var lastposition=await Geolocator.getLastKnownPosition();
//  print(lastposition);
//    locationMessage="$position";
//   }
//  //
//  //
//
//
//
//   @override
//   State<StatefulWidget> createState() {
//
//     @override
//     Widget build(BuildContext context) {
//
//       return Scaffold(
//           appBar:AppBar(
//             backgroundColor: Colors.white,
//           ),
//           body:
//           GetBuilder<HomeViewModel>(
//             init: Get.find(),
//             builder: (controller) => controller.loading.value
//                 ? Center(child: CircularProgressIndicator())
//                 : Scaffold(
//               body:
//               Container(
//                   child:Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           height:400,
//                           child: GoogleMap(
//                             initialCameraPosition: CameraPosition(
//                                 target: LatLng(37.43296265331129, -122.08832357078792),
//                                 zoom: 19.151926040649414
//                             ),
//
//                           ),
//                         ),
//                         SizedBox(
//                             height:10
//                         ),
//                         //    Text(locationMessage),
//                         RaisedButton(
//                           onPressed:(){
//                             currentLocation();
//                             print("jjjj");
//                             // print("lll=" +locationMessage);
//                             // print( "ooo="+position.latitude.toString(),);
//                             // print( "yyy="+position.longitude.toString(),);
//                             Get.to
//                               (
//                                 Map1(
//                                   // l1,l2
//                                   position.latitude,
//                                   position.longitude,
//                                   total!,
//                                   cartmodel!,
//                                 )
//                             );
//                             print("ddd");
//                           },
//                           color:Colors.blue,
//                           child:
//                           Text(
//                             "Get Current Location",
//                             style:TextStyle(color:Colors.white),
//                           ),
//                         ),
//                         // GoogleMap(
//                         //   initialCameraPosition: CameraPosition(
//                         //     target: LatLng( l1, l2),
//                         //     zoom: 14.4746,
//                         //   ),
//                         // ),
//                         // RaisedButton(onPressed:(){
//                         //
//                         // },
//                         //   color:Colors.lightGreen,
//                         //   child:Text("Ok",style:TextStyle(color:Colors.white),),
//                         // ),
//
//                       ],
//                     ),
//                   )
//               ),
//             ),
//           ));
//     }
//   }
//  }
