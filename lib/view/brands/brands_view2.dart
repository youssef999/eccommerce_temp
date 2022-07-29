// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/view/products/products_view.dart';
// import 'package:ecommerce/view/products/products_view2.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
//
//
//
// class PostsScreen extends StatefulWidget {
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<PostsScreen> {
//   String allposts;
//
//   String v;
//   TextEditingController _searchController = TextEditingController();
//   Future resultsLoaded;
//   List _allResults = [];
//   List _resultsList = [];
//
//   // val date = Calendar.getInstance().time;
//
//   /* @override
//   void initState() {
//     super.initState();
//   //  _searchController.addListener(_onSearchChanged);
//   }
// */
//   /*@override
//   void dispose() {
//   //  _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }
// */
//   /*@override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     resultsLoaded = getUsersPastTripsStreamSnapshots();
//   }
// */
//
//   /*_onSearchChanged() {
//     searchResultsList();
//   }
// */
//   /*searchResultsList() {
//     var showResults = [];
//     if(_searchController.text != "") {
//       for(var tripSnapshot in _allResults){
//         var title = tripSnapshot.fromSnapshot(tripSnapshot).title.toLowerCase();
//         if(title.contains(_searchController.text.toLowerCase())) {
//           showResults.add(tripSnapshot);
//         }
//       }
//     } else {
//       showResults = List.from(_allResults);
//     }
//     setState(() {
//       _resultsList = showResults;
//     });
//   }
// */
//   /*getUsersPastTripsStreamSnapshots() async {
//    // var data= await Firestore.instance.collection('posts5').document(allposts).collection('posts5').where("searchIndex",arrayContains:_searchController).snapshots();
//     //final uid = await Provider.of(context).auth.getCurrentUID();
//   /* var data2 = await Firestore.instance
//         .collection('')
//         .document(data)
//         .collection('trips')
//         .where("endDate", isLessThanOrEqualTo: DateTime.now())
//         .orderBy('endDate')
//         .getDocuments();
//     setState(() {
//       _allResults = data;
//     });
// */
//     searchResultsList();
//     return "complete";
//   }
// */
//
//
//
//
//
//
//   void filterCategory(value) {}
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   // Colors.white,
//                   Colors.white,
//                   //Colors.lightBlueAccent,
//
//                   // Colors.lightBlueAccent,
//                   Colors.white,
//                 ])),
//             height: 30,
//             child: Center(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.62
//                     ),
//                     Container(
//                       width:40,
//                       //width:57,
//                       child: Image.asset("assets/wh3.jpeg",
//                           fit:BoxFit.fitWidth
//                       ),
//                     ),
//                     SizedBox(
//                         width: 5
//                     ),
//                   ],
//                 ))),
//       ),
//
//
//
//
//       body:
//       Container(
//         color:Colors.white,
//         child: Column(
//             children: [
//               SizedBox(
//                 height:16,
//               ),
//
//
//
//
//
//               Flexible(
//                 child: Expanded(
//                   child: StreamBuilder(
//                       stream:
//                       FirebaseFirestore.instance.collection('category')
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
//                                 itemBuilder: (context, index) {
//                                   DocumentSnapshot posts = snapshot.data.documents[index];
//
//                                   // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
//
//
//                                   return Column(
//                                     children: <Widget>[
//     GetBuilder<HomeViewModel>(
//     init: Get.find(),
//     builder: (controller) =>
//                                            Container(
//                                             padding: EdgeInsets.only(left:30,right:30,top:11),
//                                             height: 230,
//                                             color:Colors.white10,
//                                             width: MediaQuery.of(context).size.width / 0.8,
//                                             child: InkWell(
//                                               child: Card(
//                                               //  elevation:30,
//                                                 child:
//                                                 Column(
//                                                   children: [
//                                                     Container(
//                                                       width:310,
//                                                       height:110,
//                                                       //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
//                                                       child:
//                                                       Image.network(posts.data()['pic'],
//                                                       fit:BoxFit.fill
//                                                       ),
//
//                                                       ),
//                                                     SizedBox(
//                                                       height:3
//                                                     ),
//
//                                                      Container(
//                                                        padding: EdgeInsets.only(left:120),
//                                                        child: ListTile(
//                                                           leading:  Column(
//                                                             children: [
//                                                               Text(posts.data()['name'],style:TextStyle(fontSize:16),),
//                                                           //   Text(posts.data()['cat'].split('/'),style:TextStyle(fontSize:13,color:Colors.green),),
//                                                             ],
//                                                           ),
//                                                          title:Container(
//                                                              width:120,
//                                                              height:70,
//                                                              child: CircleAvatar(
//
//                                                                radius:30,
//                                                                backgroundImage: NetworkImage(
//
//                                                                  posts.data()['image'],scale:120),
//                                                              )),
//
//
//                                                             // Image.network(posts.data()['image'])),
//                                                          //Text(posts.data()['name'],
//                                                         //   style:TextStyle(color:Colors.red,fontSize:21,fontWeight:FontWeight.w700),),
//
//                                                     //     trailing: Text(" " + posts.data()['class'],style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w500),),
//                                                        ),
//                                                      ),
//
//
//
//                                                   ],
//                                                 ),
//                                               ),
//                                               onTap: () {
//                                                 Get.to(ProductsView(br:posts.data()['name'])
//                                                 //controller.categoryModel[index].name)
//
//                                                 );
//                                               },
//                                             ),
//                                           )
//
//                                       ),
//                                      //  Container(
//                                      //    padding: EdgeInsets.only(left:180),
//                                      //    child: ListTile(
//                                      //      // leading: Image.network(posts.data()['img']),
//                                      //      title: Text(posts.data()['name'],
//                                      //        style:TextStyle(color:Colors.red,fontSize:21,fontWeight:FontWeight.w700),),
//                                      //      subtitle: Container(
//                                      //          height:30,
//                                      //          child: Text(""  + posts.data()['cat'],style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w500),)),
//                                      // //     trailing: Text(" " + posts.data()['class'],style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w500),),
//                                      //    ),
//                                      //  ),
//                                     ],
//                                   );
//                                 });
//                         }
//                       }
//                   ),
//                 ),
//               ),
//
//
//
//             ]),
//       ),
//
//
//
//     );
//   }
// }