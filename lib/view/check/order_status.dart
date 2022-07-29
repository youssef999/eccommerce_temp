// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/main.dart';
// import 'package:ecommerce/model/cart_product_model.dart';
// import 'package:ecommerce/model/product_moidel.dart';
// import 'package:ecommerce/view/cart_view.dart';
// import 'package:ecommerce/view/controll_view.dart';
// import 'package:ecommerce/view/details_view.dart';
// import 'package:ecommerce/view/home_view.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/viewmodel/auth_view_model.dart';
// import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
// import 'package:ecommerce/viewmodel/control_view_model.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class OrderStatus extends StatefulWidget {
//   String order_id;
//   List<CartProductModel> cartmodel;
//   OrderStatus({this.order_id,this.cartmodel});
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<OrderStatus> {
//   String allposts;
//   String v;
//   TextEditingController _searchController = TextEditingController();
//   Future resultsLoaded;
//   List _allResults = [];
//   List _resultsList = [];
//   Color color1 = Colors.grey;
//
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//
//   @override
//   void initState() {
//     setState(() {
//       print("brand =" + widget.order_id.toString());
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int i2 = widget.cartmodel.length;
//     final user = FirebaseAuth.instance.currentUser;
//     final userData =
//         FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     final orientation = MediaQuery.of(context).orientation;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar:AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Text("Luban   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
//                 fontWeight:FontWeight.w700
//
//             ),),
//             SizedBox(
//               width: 80,
//             ),
//             Text("لبان   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
//                 fontWeight:FontWeight.w700
//
//             ),),
//           ],
//         ),
//       ),
//
//       body: Container(
//         color: Colors.grey[200],
//         child: Column(
//           children: [
//             Flexible(
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('orders_checkout')
//                       .where("order_id", isEqualTo: widget.order_id)
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) return Center(child: Text('Loading'));
//                     if(snapshot.hasData==null)return Center(child:Text("Loading"));
//                     if(snapshot.data==null)return Center(child:Text("Loading"));
//                     if(snapshot.error)return Center(child:Text("Loading"));
//
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return new Text('Loading...');
//                       default:
//                         return ListView.builder(
//                             itemCount: snapshot.data.documents.length,
//                             // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             //   crossAxisCount: 2,
//                             //   crossAxisSpacing: 2,
//                             //   mainAxisSpacing: 3,
//                             // ), //(orientation == Orientation.portrait) ? 2: 2.2),
//                             itemBuilder: (BuildContext context, int index) {
//                               DocumentSnapshot posts =
//                                   snapshot.data.documents[index];
//
//                               return GetBuilder<HomeViewModel>(
//                                   init: Get.find(),
//                                   builder: (controller) => Container(
//                                       padding: EdgeInsets.all(5),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             child: Card(
//                                               color: Colors.grey[300],
//                                               child: Column(
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Text("OrderId : ",
//                                                           style: TextStyle(
//                                                               color: Colors.black,
//                                                               fontSize: 21)),
//                                                       Text(
//                                                           posts.data()[
//                                                                   'order_id'] ??
//                                                               "",
//                                                           style: TextStyle(
//                                                               fontSize: 19,
//                                                               fontWeight:
//                                                                   FontWeight.bold,
//                                                               color: Colors.green)),
//                                                     ],
//                                                   ),
//                                                   SizedBox(height: 5),
//                                                   Text(
//                                                     posts.data()['time'],
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       SizedBox(width: 20),
//                                                       Container(
//                                                           width: 50,
//                                                           child: Image.asset(
//                                                               'assets/ord.png')),
//                                                       SizedBox(width: 20),
//                                                       Text("Your Order Is : "),
//                                                       Text(
//
//                                                           posts.data()[
//                                                                   'order_status'] ??
//                                                               "",
//                                                           style: TextStyle(
//                                                              fontSize:23,
//                                                               color: Colors.green)),
//                                                     ],
//                                                   ),
//                                                   Text(posts.data()['ord 1'],
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 2'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 3'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 4'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 5'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 6'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 7'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 8'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 9'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(posts.data()['ord 10'] ?? "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                   Text(
//                                                       "--------------------------------------------"),
//                                                   Text(
//                                                       posts.data()[
//                                                               'total_amount'].toString() ??
//                                                           "",
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.bold)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             width:180,
//                                             child: GetBuilder<CartViewModel>(
//     init: Get.find(),
//     builder: (controller) =>
//      RaisedButton(
//                                                     color: Colors.red,
//                                                       shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(30.0),
//                                       ),
//                                                     onPressed: () {
//                                                       print("i"+i2.toString());
//                                                       for (int i = 0; i < i2; i++) {
//                                                         print("dd]"+widget.cartmodel[i].name);
//                                                         controller.DeleteProducts(
//                                                             CartProductModel(
//                                                                 name: widget
//                                                                     .cartmodel[i]
//                                                                     .name,
//                                                                 image: widget
//                                                                     .cartmodel[i]
//                                                                     .image,
//                                                                 price: widget
//                                                                     .cartmodel[i]
//                                                                     .price
//                                                                     .toString(),
//                                                                 quantity:
//                                                                 widget.cartmodel[i]
//                                                                     .quantity,
//                                                                 productId:
//                                                                 widget.cartmodel[i]
//                                                                     .productId),
//                                                             widget.cartmodel[i]
//                                                                 .productId);
//                                                       }
//                                                       print("ddddd");
//                                                      Get.offAll(() => ControlView());
//                                                     },
//                                                     child: Row(
//                                                       children: [
//                                                         SizedBox(width: 30),
//                                                         Custom_Text(
//                                                           text:  "عودة للتصفح ",
//                                                           color: Colors.white,
//                                                           fontSize: 16,
//                                                         ),
//                                                       ],
//                                                     )
//
//                                             ),
//                                             ))
//                                         ],
//                                       )));
//                             });
//                     }
//                   }),
//             ),
//           ],
//         ),
//         //),
//         //  ]),
//       ),
//     );
//   }
// }
