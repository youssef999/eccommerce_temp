








// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_local_variable, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class OrderStatusView2 extends StatefulWidget {

  String  order_id;
  List<CartProductModel> cartmodel;
  OrderStatusView2({this.order_id,this.cartmodel});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<OrderStatusView2> {

  String  allposts;
  String  v;
  TextEditingController _searchController = TextEditingController();
  Future  resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    int i2 = widget.cartmodel.length;
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
                      FirebaseFirestore.instance.collection('orders_checkout')
                      .where("order_id", isEqualTo: widget.order_id)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');

                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.docs[index];

                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) => Container(
                                        color:Colors.red,
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Card(
                                                    color: Colors.grey[100],
                                                    child: Column(
                                                      children: [

                                                        Text("تفاصيل العنوان ",style:TextStyle(color:Colors.black,fontSize:18),),

                                                        SizedBox(
                                                            height:6
                                                        ),

                                                        Row(
                                                          children: [
                                                            SizedBox(width:130,),
                                                            Text(
                                                                posts.data()['country'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(" :الدولة ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: 130,),

                                                            Text(
                                                                posts.data()['city'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(" :المدينة ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),


                                                        Row(
                                                          children: [
                                                            SizedBox(width:130,),

                                                            Text(
                                                                posts.data()['address'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(": عنوان الشارع  ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width:130,),

                                                            Text(
                                                                posts.data()['apartment'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(": الشقة  ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),

                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              SizedBox(width:130,),
                                                              Text(
                                                                  posts.data()['floor'] ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize: 19,
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Colors.green)),
                                                              Text(" :الطابق ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width:80,),
                                                            Text(
                                                                posts.data()['mobile'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(" :الهاتف ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(width:130,),
                                                            Text(
                                                                posts.data()['notes'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 19,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                     if(posts.data()['notes']!='')
                                                       Text(": ملاحظات  ",style:TextStyle(color:Colors.black,fontSize:19),)
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [

                                                            SizedBox(width:20),
                                                            Text(
                                                                posts.data()[
                                                                'order_id'] ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.green)),
                                                            Text(" : رقم الطلب    ",
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 18)),

                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          posts.data()['time']??"",
                                                        ),
                                                        SizedBox(height: 22),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: 7),
                                                            Container(
                                                                width: 33,
                                                                child: Image.asset(
                                                                    'assets/ord.png')),
                                                            SizedBox(width: 5),
                                                            if(posts.data()['order_status']=='pending')
                                                              Column(
                                                                children: [
                                                                  Text("تم ارسال الطلب بنجاح  " , style: TextStyle(fontSize:15,color:Colors.blue,)),

                                                                  Text("في انتظار الموافقة   " , style: TextStyle(fontSize:15,color:Colors.blue,)),
                                                                ],
                                                              ),
                                                            Text(" :  حالة الاوردر     " ,style:TextStyle(color:Colors.black,fontSize:17,fontWeight:FontWeight.w800),),



                                    //         color: Colors.green)),)

                                                            // Text(
                                                            //     posts.data()[
                                                            //     'order_status'] ??
                                                            //         "",
                                                            //     style: TextStyle(
                                                            //         fontSize:23,
                                                            //         color: Colors.green)),
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
                                                SizedBox(
                                                  height:10
                                                ),
                                                Container(
                                                    width:180,
                                                    child: GetBuilder<CartViewModel>(
                                                      init: Get.find(),
                                                      builder: (controller) =>
                                                          RaisedButton(
                                                              color: HexColor("#ff68682A"),
                                                              shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(30.0),
                                                              ),
                                                              onPressed: () {
                                                                print("i"+i2.toString());
                                                                for (int i = 0; i < i2; i++) {
                                                                  print("dd]"+widget.cartmodel[i].name);
                                                                  controller.DeleteProducts(
                                                                      CartProductModel(
                                                                          name: widget
                                                                              .cartmodel[i]
                                                                              .name,
                                                                          image: widget
                                                                              .cartmodel[i]
                                                                              .image,
                                                                          price: widget
                                                                              .cartmodel[i]
                                                                              .price
                                                                              .toString(),
                                                                          quantity:
                                                                          widget.cartmodel[i]
                                                                              .quantity,
                                                                          productId:
                                                                          widget.cartmodel[i]
                                                                              .productId),
                                                                      widget.cartmodel[i]
                                                                          .productId);
                                                                }
                                                                print("ddddd");
                                                                Get.offAll(() => ControlView());
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(width: 30),
                                                                  Custom_Text(
                                                                    text:  "عودة للتصفح ",
                                                                    color: Colors.white,
                                                                    fontSize: 19,
                                                                  ),
                                                                ],
                                                              )

                                                          ),
                                                    ))
                                              ],
                                            ),
                                          )));
                                });
                        }
                      }),
                ),
              ],
          ),
          //),
          //  ]),
        ),
    );
  }
}
