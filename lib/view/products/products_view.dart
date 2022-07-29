//
//
//
//
//
//
// // ignore_for_file: must_be_immutable
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/view/products/details_view2.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:hexcolor/hexcolor.dart';
//
//
// class ProductsView extends StatefulWidget {
//
//   String br;
//
//   ProductsView({this.br});
//
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
// class _PostsScreenState extends State<ProductsView> {
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
//
//   String lg = '';
//
//
//   @override
//   void initState() {
//
//
//     final box = GetStorage();
//     final box_country=box.read('country')??'x';
//
//     if(box_country=='امارات'){
//       lg ='د.ا';
//     }
//     if(box_country=='البحرين'){
//       lg='د.ب';
//     }
//     if(box_country=='قطر'){
//       lg='ر.ق';
//     }
//     if(box_country=='سلطنة عمان'){
//       lg='ر.ع';
//     }
//
//     if(box_country=='كويت'){
//       lg='د.ك';
//     }
//     if(box_country=='السعودية'){
//
//       lg='ر.س' ;
//     }
//     if(box_country=='x'){
//       lg='ر.س' ;
//     }
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     final box = GetStorage();
//     num price;
//     final box_country=box.read('country');
//
//     return Scaffold(
//         backgroundColor: Colors.white,
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
//         body:
//         Container(
//           color: Colors.white,
//           child: Column(
//               children: [
//
//                 SizedBox(
//                   height:7,
//                 ),
//
//                 Flexible(
//                   child: StreamBuilder(
//                       stream:
//                       FirebaseFirestore.instance.collection('products')
//                       .where('brand',isEqualTo:widget.br)
//                           .snapshots(),
//                       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                         if (!snapshot.hasData) return Center(child: Text('Loading'));
//                         switch (snapshot.connectionState) {
//                           case ConnectionState.waiting:
//                             return new Text('Loading...');
// //.where("category", isEqualTo:"tec")
//                           default:
//                             return ListView.builder(
//                                 itemCount: snapshot.data.documents.length,
//                                 // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                                 //   crossAxisCount: 2,
//                                 //   crossAxisSpacing: 2,
//                                 //   mainAxisSpacing: 3,
//                                 //
//                                 // ), //(orientation == Orientation.portrait) ? 2: 2.2),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   DocumentSnapshot posts =
//                                   snapshot.data.documents[index];
//
//                                   return GetBuilder<HomeViewModel>(
//                                       init: Get.find(),
//
//                                       builder: (controller) => Container(
//                                           padding: EdgeInsets.all(5),
//                                           child: Flexible(
//                                             child: InkWell(
//                                               child: Card(
//                                                 color: Colors.grey[100],
//                                                 child: Row(children: [
//                                                   SizedBox(height: 18),
//
//                                                   SizedBox(width:MediaQuery.of(context).size.width*0.22),
//
//                                                   Column(
//                                                     children: [
//                                                       Container(
//                                                         width:100,
//                                                         child: Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:16,
//                                                             fontWeight:FontWeight.bold),),
//                                                       ),
//                                                       SizedBox(height: 2),
//
//                                                       if(box_country=='السعودية')
//                                                         Row(
//                                                           children: [
//
//                                                             SizedBox(
//                                                                 width:2
//                                                             ),
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),),
//
//
//                                                             SizedBox(
//                                                                 width:2
//                                                             ),
//                                                             Text((posts.data()['price']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//                                                             ),
//
//                                                           ],
//                                                         ),
//
//                                                       if(box_country=='قطر')
//                                                         Row(
//                                                           children: [
//
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//
//                                                             ,
//
//                                                             SizedBox(
//                                                                 width:2
//                                                             ),
//                                                             Text((posts.data()['priceQ']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//                                                             ),
//
//                                                           ],
//                                                         ),
//
//
//                                                       if(box_country=='كويت')
//                                                         Row(
//                                                           children: [
//
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//
//                                                             , SizedBox(
//                                                                 width:2
//                                                             ),
//
//                                                             Text((posts.data()['priceQw']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//
//                                                             ),
//
//
//                                                           ],
//                                                         ),
//
//                                                       if(box_country=='سلطنة عمان')
//                                                         Row(
//                                                           children: [
//
//
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//                                                             , SizedBox(
//                                                                 width:2
//                                                             ),
//                                                             Text((posts.data()['priceAm']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//
//                                                             ),
//
//                                                           ],
//                                                         ),
//
//                                                       if(box_country=='البحرين')
//                                                         Row(
//                                                           children: [
//
//
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//                                                             ,SizedBox(
//                                                                 width:2
//                                                             ),
//
//                                                             Text((posts.data()['priceBh']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//
//                                                             ),
//
//                                                           ],
//                                                         ),
//
//
//
//                                                       if(box_country=='الكويت')
//                                                         Row(
//                                                           children: [
//
//
//
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//                                                             , SizedBox(
//                                                                 width:2
//                                                             ),
//                                                             Text((posts.data()['priceQw']).toString(),
//                                                               style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                   fontWeight:FontWeight.bold),
//
//                                                             ),
//
//
//                                                           ],
//                                                         ),
//                                                       if(box_country=='امارات')
//                                                         Row(
//                                                           children: [
//                                                             Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
//
//                                                             , SizedBox(
//                                                                 width:2
//                                                             ),
//                                                             Text((posts.data()['priceAmar']).toString(),
//                                                                 style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
//                                                                     fontWeight:FontWeight.bold)),
//
//                                                           ],
//                                                         ),
//
//
//
//
//
//                                                     ],
//                                                   ),
//                                                   SizedBox(width:10),
//                                                   Container(
//
//                                                     width: 130,
//                                                     height: 85,
//                                                     child: Image.network(
//                                                         posts.data()['image'],
//                                                         fit: BoxFit.scaleDown),
//                                                   ),
//
//
//
//
//                                                 ]),
//                                               ),
//                                               onTap: () {
//
//
//                                                 if(box_country=='امارات'){
//                                                   price=posts.data()['priceAmar'];
//                                                 }
//                                                 if(box_country=='الكويت'){
//                                                   price=posts.data()['priceQw'];
//                                                 }
//                                                 if(box_country=='البحرين'){
//                                                   price=posts.data()['priceBh'];
//                                                 }
//                                                 if(box_country=='سلطنة عمان'){
//                                                   price=posts.data()['priceAm'];
//                                                 }
//                                                 if(box_country=='قطر'){
//                                                   price=posts.data()['priceQ'];
//                                                 }
//                                                 if(box_country=='السعودية'){
//                                                   price=posts.data()['price'];
//                                                 }
//                                                 if(box_country=='x'){
//                                                   price=posts.data()['price'];
//                                                 }
//
//                                                 Get.to(DetailsView2(
//                                                   name: posts.data()['name'],
//                                                   price: price,
//                                                   x:posts.data()['x'],
//                                                   details: posts.data()['des'],
//                                                   image: posts.data()['image'],
//                                                   productId:posts.data()['productid'],
//                                                   brand:posts.data()['brand'],
//                                                   brandemail:posts.data()['brandemail']
//                                                 ));
//                                               },
//                                             ),
//                                           )));
//                                 });
//                         }
//                       }),
//                 ),
//                 //),
//                 //  ]),
//               ] ),
//         ));
//   }
// }
//
// //                         }
// //                       }
// //                   ),
// //                 ),
// //               //),
//
//
// //             ]),
// //       ),
//
//
// //     );
// //   }
// // }
