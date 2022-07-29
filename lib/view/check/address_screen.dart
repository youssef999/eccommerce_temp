//
//
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/model/cart_product_model.dart';
// import 'package:ecommerce/view/check/address_check.dart';
// import 'package:ecommerce/view/widgets/custom_textformfield.dart';
// import 'package:ecommerce/viewmodel/address_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'checkout_screen2.dart';
//
//
//
// class AdressScreen extends StatelessWidget {
//   //List<>String name;
//   num total;
//   List<CartProductModel> cartmodel;
//   String brand_email;
//   double lat,long;
//   //String address;
//   AdressScreen({this.total,this.cartmodel,this.lat,this.long});
//   // const CheckOutScreen({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController address3= TextEditingController();
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final box = GetStorage();
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.black),
//           title: Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                     // Colors.white,
//                     Colors.white,
//                     //Colors.lightBlueAccent,
//
//                     // Colors.lightBlueAccent,
//                     Colors.white,
//                   ])),
//               height: 30,
//               child: Center(
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.62
//                       ),
//                       Container(
//                         width:40,
//                         //width:57,
//                         child: Image.asset("assets/wh3.jpeg",
//                             fit:BoxFit.fitWidth
//                         ),
//                       ),
//                       SizedBox(
//                           width: 5
//                       ),
//                     ],
//                   ))),
//         ),
//
//
//         body: GetBuilder<AddressViewModel>(
//           init:AddressViewModel(),
//           builder:(controller)=>
//           ListView(
//             children: [
//             Form(
//           key: _formKey,
//           child: Column(
//             children:[
//               SizedBox(
//                 height:30
//               ),
//             TextFormField(
//     controller:controller.address,
//     decoration: InputDecoration(
//     hintText:'ادخل العنوان ',
//     hintStyle: TextStyle(color:Colors.grey),
//     fillColor:Colors.white,
//
//     ),
//
//     )
//
//
//
//
//
//
//             ],
//           )
//         )
//         ])) );
//   }
// }
