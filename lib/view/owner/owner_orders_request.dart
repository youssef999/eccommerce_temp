// // ignore_for_file: must_be_immutable
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/model/product_moidel.dart';
// import 'package:ecommerce/view/products/details_view.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
//
//
//
//
// class OwnerOrdersRequest extends StatefulWidget {
//   String brand_email;
//
//
//   OwnerOrdersRequest({this.brand_email});
//
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<OwnerOrdersRequest> {
//   String allposts;
//   String v;
//   Future resultsLoaded;
//
//   Color color1 = Colors.grey;
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//
//   @override
//   void initState() {
//     setState(() {
//       print("brand =" + widget.brand_email.toString());
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//   String _value = '';
//   @override
//   Widget build(BuildContext context) {
//
//     // final user = FirebaseAuth.instance.currentUser;
//     // final userData =
//     //     FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     // final orientation = MediaQuery.of(context).orientation;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               // Colors.white,
//               Colors.white,
//               //Colors.lightBlueAccent,
//
//               // Colors.lightBlueAccent,
//               Colors.white,
//             ])),
//             height: 30,
//             child: Center(
//                 child: Row(
//               children: [
//                 SizedBox(
//                   width: 25,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "Luban   ",
//                       style: TextStyle(
//                           color: HexColor("#ff68682A"),
//                           fontSize: 22,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       width: 12,
//                     ),
//                     Container(
//                       width: 70,
//                       child: Image.asset(
//                         "assets/wh3.jpeg",
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 80,
//                 ),
//               ],
//             ))),
//       ),
//       body: Container(
//         color: Colors.grey[200],
//         child: Flexible(
//           child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('orders_checkout')
//                   //.orderBy('time', descending: true)
//                   .where("brand_email", isEqualTo: widget.brand_email)
//                   .where("order_status", isEqualTo: 'pending')
//                //    where("order_status", isNotEqualTo: 'cancel' )
//                   //.orderBy('time')
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) return Center(child: Text('Loading'));
//
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return new Text(' .......لا توجد طلبات حتي الان ...');
//                   default:
//                     return ListView.builder(
//                         itemCount: snapshot.data.documents.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           DocumentSnapshot posts =
//                               snapshot.data.documents[index];
//                           return GetBuilder<HomeViewModel>(
//                               init: Get.find(),
//                               builder: (controller) => Container(
//                                   padding: EdgeInsets.all(5),
//                                   child: Container(
//                                     child: Card(
//                                       color: Colors.grey[300],
//                                       child: Column(
//                                         children: [
//                                           Column(
//                                             children: [
//                                               // Container(
//                                               //   width:190,
//                                               //   child: Card(
//                                               //     color:Colors.white,
//                                               //     child: Center(
//                                               //       child: Text("عدد الاوردرات = " + snapshot.data.documents.length.toString(),
//                                               //       style:TextStyle(color:Colors.red,fontSize:22),
//                                               //       ),
//                                               //     ),
//                                               //   ),
//                                               // ),
//                                               Row(
//                                                 children: [
//                                                   Text("OrderId : ",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 21)),
//
//                                                   Text(
//                                                       posts.data()[
//                                                               'order_id'] ??
//                                                           "",
//                                                       style: TextStyle(
//                                                           fontSize: 19,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.green)),
//                                                   SizedBox(width: 12),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: 5),
//                                           //    Text(posts.data()['time'].toString()??"",),
//                                           SizedBox(height: 10),
//                                           Row(
//                                             children: [
//                                               SizedBox(width: 20),
//                                               Container(
//                                                   width: 50,
//                                                   child: Image.asset(
//                                                       'assets/ord.png')),
//                                               SizedBox(width: 20),
//                                               Text("Order Is : "),
//                                               Text(
//                                                   posts.data()[
//                                                           'order_status'] ??
//                                                       "",
//                                                   style: TextStyle(
//                                                       fontSize: 23,
//                                                       color: Colors.green)),
//                                             ],
//                                           ),
//
//                                           Text(posts.data()['ord 1'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 2'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 3'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 4'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 5'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 6'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 7'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 8'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 9'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(posts.data()['ord 10'] ?? "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Text(
//                                               "--------------------------------------------"),
//                                           Text(
//                                               posts
//                                                       .data()['total_amount']
//                                                       .toString() ??
//                                                   "",
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold)),
//
//                                           Container(
//                                               child: Column(
//                                             children: [
//                                               Center(
//                                                 child: Row(
//                                                   //  mainAxisAlignment:MainAxisAlignment.center,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     SizedBox(width: 6),
//                                                     Row(
//                                                       children: [
//                                                         Radio(
//                                                           value: 'cancel',
//                                                           activeColor:
//                                                               Colors.green,
//                                                           groupValue: _value,
//                                                           onChanged: (value) {
//                                                             print("val ===" +
//                                                                 value
//                                                                     .toString());
//                                                             setState(() {
//                                                               _value = value;
//                                                             });
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 22),
//                                                         Custom_Text(
//                                                           text: 'cancel',
//                                                           color: Colors.black,
//                                                         )
//                                                       ],
//                                                     ),
//                                                     SizedBox(width: 20),
//                                                     Row(
//                                                       children: [
//                                                         Radio(
//                                                           value: 'confirm',
//
//                                                           activeColor:
//                                                               Colors.green,
//                                                           groupValue: _value,
//                                                           onChanged: (value) {
//                                                             print("val ===" +
//                                                                 value
//                                                                     .toString());
//                                                             setState(() {
//                                                               _value = value;
//                                                             });
//
//
//                                                           },
//                                                         ),
//                                                         SizedBox(width: 22),
//                                                         Custom_Text(
//                                                           text: 'confirm',
//                                                           color: Colors.black,
//                                                         )
//                                                       ],
//                                                     ),
//                                                     SizedBox(height: 20),
//                                                   ],
//                                                 ),
//                                               ),
//                                               RaisedButton(
//                                                 color:Colors.green,
//                                                 child: Text("موافق ",style:TextStyle(color: Colors.white,fontSize:19),),
//                                                 onPressed: () {
//
//     Firestore.instance
//         .collection('orders_checkout')
//         .where('order_id',isEqualTo: posts.data()['order_id'])
//         .get()
//         .then((snapshot) {
//       snapshot.docs.last.reference.updateData(
//           {'order_status': _value.toString()});
//     });
//                                                   // Firestore.instance
//                                                   //     .collection('orders_checkout')
//                                                   //      .where('order_id',isEqualTo:
//                                                   // posts.data()['order_id']).
//                                                   //     .updateData({
//                                                   //   "IsNewUser":"1"
//                                                   // });
//                                                 },
//                                               )
//                                             ],
//                                           )),
//                                         ],
//                                       ),
//                                     ),
//                                   )));
//                         });
//                 }
//               }),
//         ),
//         //),
//         //  ]),
//       ),
//     );
//   }
// }
