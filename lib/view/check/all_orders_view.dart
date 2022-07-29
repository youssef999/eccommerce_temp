
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';


class AllOrdersView extends StatefulWidget {
  String  user;

  AllOrdersView({this.user});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllOrdersView> {

  String  allposts;
  String  v;
  TextEditingController _searchController = TextEditingController();
  Future  resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    num price;
    final box_country=box.read('country');

    Query query=FirebaseFirestore.instance.collection('orders_checkout')
        .where("username", isEqualTo: widget.user)
        .orderBy('time2', descending: true,);


    return Scaffold(
        backgroundColor: Colors.white,
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
          color: Colors.white,
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      // FirebaseFirestore.instance.collection('orders_checkout')
                      // .orderBy('time', descending: true,)
                      // .where("username", isEqualTo: widget.user)
                      query .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   crossAxisSpacing: 2,
                                //   mainAxisSpacing: 3,
                                // ), //(orientation == Orientation.portrait) ? 2: 2.2),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.docs[index];
                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) =>

                                          Directionality(
                                            textDirection:TextDirection.rtl,
                                            child: Container(
                                                padding: EdgeInsets.all(5),
                                                child:
                                                Container(
                                                  child: Card(
                                                    color: Colors.grey[100],
                                                    child: Column(
                                                      children: [

                                                        Text("تفاصيل الطلب ",style:TextStyle(color:Colors.black,fontSize:18),),

                                                        SizedBox(
                                                            height:6
                                                        ),

                                                        if(posts.data()['brand']!=null)
                                                        Row(
                                                          children: [
                                                            Text("المتجر  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['brand'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),
                                                          ],
                                                        ),

                                                        Row(
                                                          children: [
                                                            Text("الدولة : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['country'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(" المدينة : ",style:TextStyle(color:Colors.black,fontSize:19),),

                                                            Text(
                                                                posts.data()['city'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),

                                                          ],
                                                        ),


                                                        Row(
                                                          children: [
                                                            Text(" عنوان الشارع :  ",style:TextStyle(color:Colors.black,fontSize:19),),

                                                            Text(
                                                                posts.data()['address'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),

                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(" المبني  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['apartment'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),

                                                          ],
                                                        ),

                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              Text(" الطابق :  ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                              Text(
                                                                  posts.data()['floor'] ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize: 19,
                                                                      fontWeight:
                                                                      FontWeight.w400,
                                                                      color: Colors.black)),

                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(" الهاتف : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                               posts.data()['mobile'].toString().replaceAll('+','')+"+"??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),

                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            if(posts.data()['notes']!='')
                                                            Text(" ملاحظات  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                                            Text(
                                                                posts.data()['notes'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [

                                                            Text("  رقم الطلب   : ",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 18)),
                                                            Text(
                                                                posts.data()[
                                                                'order_id'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),


                                                          ],
                                                        ),
                                                        SizedBox(height:17,),
                                                        Row(
                                                          children: [

                                                            Text(" التوقيت  : ",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 18)),
                                                            Text(
                                                                posts.data()['time']??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    color: Colors.black)),


                                                          ],
                                                        ),
                                                    //    SizedBox(height: 5),

                                                        SizedBox(height: 22),
                                                        Row(
                                                          children: [

                                                            Container(
                                                                width: 33,
                                                                child: Image.asset(
                                                                    'assets/ord.png')),
                                                            SizedBox(width: 5),
                                                            Text("  حالة الطلب   : "),
                                                              if( posts.data()['order_status']=='delivered')

                                              Text(
                                                  "تم التوصيل  ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green)),
                                            if( posts.data()['order_status']=='pending')
                                              Text(
                                                  "بانتظار الموافقة ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green)),

                                            if( posts.data()['order_status']=='cancel')
                                              Text(
                                                  "تم الالغاء  ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green)),

                                            if( posts.data()['order_status']=='confirm')
                                              Text(
                                                  "تم التاكيد  ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green)),


                                            if( posts.data()['order_status']=='ontheway')
                                              Text(
                                                  "في الطريق",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.green)),






                                                          ],
                                                        ),
                                                        Text(posts.data()['ord 1']??"",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 2'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 3'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 4'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 5'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 6'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 7'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 8'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 9'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(posts.data()['ord 10'] ?? "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text(
                                                            "--------------------------------------------"),
                                                        Text(
                                                            posts.data()[
                                                            'total_amount'].toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                      ],
                                                    ),
                                                  ),
                                                ),


                                            ),
                                          )

                                  );
                                });
                        }
                      }),
                ),
                //),
                //  ]),
              ] ),
        ));
  }
}
