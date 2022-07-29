//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/services/data_controller.dart';
// import 'package:ecommerce/view/products/details_view2.dart';
// import 'package:ecommerce/view/products/products_view.dart';
// import 'package:ecommerce/view/products/products_view2.dart';
// import 'package:ecommerce/view/search/search_view.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
//
//
// class BrandsView extends StatefulWidget {
//
//
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
// class _PostsScreenState extends State<BrandsView> {
//
//   String allposts;
//   String v;
//   TextEditingController _searchController = TextEditingController();
//   Future resultsLoaded;
//   List _allResults = [];
//   List _resultsList = [];
//
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     Get.put(HomeViewModel());
//     return Scaffold(
//       backgroundColor: Colors.white,
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
//       body:
//       Container(
//         color: Colors.white,
//         child: Column(
//             children: [
//               SizedBox(
//                 height:13,
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left:33.0),
//               //   child: Text(" جميع المتاجر   ",style:TextStyle(color:Colors.black,fontSize:19,
//               //       fontWeight:FontWeight.w800),),
//               // ),
//               SizedBox(
//                 height:13,
//               ),
//               GetBuilder<DataController>(
//                   init: DataController(),
//                   builder: (controller) => _searchTextFormField()),
//
//               SizedBox(
//                 height:13
//               ),
//
//
//               SizedBox(
//                 height:13,
//               ),
//               Flexible(
//                   child: StreamBuilder(
//                       stream:
//                       FirebaseFirestore.instance.collection('category')
//                           .snapshots(),
//                       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                         if (!snapshot.hasData) return Center(child: Text('Loading'));
//                         switch (snapshot.connectionState) {
//                           case ConnectionState.waiting:
//                             return new Text('Loading...');
//                           default:
//                         return ListView.builder(
//                         itemCount: snapshot.data.documents.length,
//                         // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         //   crossAxisCount: 2,
//                         //   crossAxisSpacing: 2,
//                         //   mainAxisSpacing: 3,
//                         //
//                         // ), //(orientation == Orientation.portrait) ? 2: 2.2),
//                         itemBuilder: (BuildContext context, int index) {
//                           DocumentSnapshot posts =
//                               snapshot.data.documents[index];
//
//                           return GetBuilder<HomeViewModel>(
//                               init: Get.find(),
//                               builder: (controller) => Container(
//                                   padding: EdgeInsets.all(5),
//                                   child: InkWell(
//                                     child: Card(
//                                       color: Colors.white,
//                                       child:  Column(children: [
//                                         Row(
//                                           children: [
//                                             SizedBox(
//                                               width:198
//                                             ),
//                                             Container(
//                                               padding:EdgeInsets.only(left:2),
//                                               width: 90,
//                                               height: 100,
//                                               child: CircleAvatar(
//                                                 radius:120,
//                                                 backgroundImage: NetworkImage( posts.data()['image']),
//                                               ),
//                                             ),
//
//                                             // Padding(
//                                             //   padding: const EdgeInsets.only(left:3.0),
//                                             //   child: Text((posts.data()['name']),
//                                             //
//                                             //     style:TextStyle(
//                                             //         color: HexColor("#ff68682A"),
//                                             //         fontSize: 19,
//                                             //         fontWeight:FontWeight.w800
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ],
//                                         ),
//
//                                         SizedBox(width: 5),
//                                         // Padding(
//                                         //   padding: const EdgeInsets.only(left:3.0),
//                                         //   child: Text((posts.data()['cat'].split('/').last),
//
//                                         //     style:TextStyle(
//                                         //         color: HexColor("#ff68682A"),
//                                         //         fontSize: 19,
//                                         //         fontWeight:FontWeight.w800
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                         SizedBox(height: 5),
//                                         Padding(
//                                           padding: const EdgeInsets.only(left:3.0),
//                                           child: Text((posts.data()['cat']),
//
//                                             style:TextStyle(
//                                                 color:Colors.green,
//                                                 fontSize: 11,
//                                                 fontWeight:FontWeight.w600
//                                             ),
//                                           ),
//                                         ),
//
//
//                                       ]),
//                                     ),
//                                     onTap: () {
//                                       Get.to(ProductsView(br:posts.data()['name']
//                                      // controller.categoryModel[index].name
//                                       )
//                                       );
//                             //         Get.to(ProductScreen(
//                             // productmodel: controller.productModel,
//                             // brand: controller.categoryModel[index].name));
//                                     },
//                                   )));
//                         });
//                 }
//               }),
//         ),
//         //),
//         //  ]),
//              ] ),
//     ));
//   }
//   Widget _searchTextFormField() {
//     TextEditingController search_txt = new TextEditingController();
//     bool isExecuted = false;
//     QuerySnapshot querySnapshot;
//     // bool isExecuted = false;
//     return Container(
//       width:303,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.grey.shade200,
//       ),
//       child: GetBuilder<DataController>(
//           init: DataController(),
//           builder: (controller) => TextFormField(
//             controller: search_txt,
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: InkWell(
//                   child: Icon(Icons.search, color: Colors.green),
//                   onTap: () {
//                     controller.queryData(search_txt.text).then((value) {
//                       querySnapshot = value;
//                       isExecuted = true;
//                       print("issss" + isExecuted.toString());
//                       print("qqq=" + querySnapshot.docs.toString());
//                       print("sss=" + search_txt.text.toString());
//                       Get.to(SearchView(
//                         search_txt: search_txt.text.toString(),
//                       ));
//                     });
//                   }),
//             ),
//           )
//         //}
//       ),
//     );
//   }
// }
//
