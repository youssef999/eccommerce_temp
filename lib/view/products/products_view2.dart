import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/view/products/details_view3.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductsView extends StatefulWidget {
  String cat;

  ProductsView({this.cat});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<ProductsView> {
  String allposts;
  String v;
  Future resultsLoaded;


  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              height: 30,
              child: Center(
                  child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.62),
                  SizedBox(width: 5),
                ],
              ))),
        ),
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: 7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where('cat', isEqualTo: widget.cat)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return

                        GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 3,
                            ),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                              snapshot.data.documents[index];

                              return GetBuilder<HomeViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        height: 270,
                                        child: InkWell(
                                          child: Card(
                                            color: Colors.white,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(10),
                                                      topRight:
                                                      Radius.circular(10),
                                                      bottomLeft:
                                                      Radius.circular(10),
                                                      bottomRight:
                                                      Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 420,
                                                    height: 95,
                                                    child: Image.network(
                                                        posts.data()[
                                                        'image'],
                                                        fit: BoxFit.fill),
                                                  ),
                                                  SizedBox(height:6),
                                                  Column(
                                                    children: [
                                                      Directionality(
                                                        textDirection:
                                                        TextDirection
                                                            .rtl,
                                                        child: Container(

                                                          child: Text(
                                                            (posts.data()[
                                                            'name']),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontFamily:
                                                                "Reboto"),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:7
                                                      ),
                                                      Directionality(
                                                        textDirection:
                                                        TextDirection
                                                            .rtl,
                                                        child: Container(

                                                          child: Text(
                                                            (posts.data()[
                                                            'price'].toString()+'LE'),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontFamily:
                                                                "Reboto"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Get.to (DetailsView3(
                                              name: posts.data()['name'],
                                              price: posts.data()['price'],
                                              details: posts.data()['des'],
                                              image: posts.data()['image'],
                                              productId: posts.data()['productid'],
                                            ));
                                          },
                                        )),
                                  ));
                            });
                    }
                  }),
            ),
            //),
            //  ]),
          ]),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }

