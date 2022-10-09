import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/view/products/details_view3.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchView extends StatefulWidget {
  String search_txt;
  SearchView({this.search_txt});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SearchView> {
  String allposts;
  String v;
  Future resultsLoaded;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          toolbarHeight: 10,
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 4,
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .where('name', isGreaterThanOrEqualTo: widget.search_txt)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return GridView.builder(
                            itemCount: snapshot.data.docs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data.docs[index];

                              return GetBuilder<HomeViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => Container(
                                      height: 1400,
                                      child: InkWell(
                                        child: Card(
                                          color: Colors.white,
                                          child: Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  width: 230,
                                                  height: 100,
                                                  child: Image.network(
                                                      posts.data()['image'],
                                                      fit: BoxFit.scaleDown),
                                                ),
                                                SizedBox(height: 6),
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        (posts.data()['name']),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 50,
                                                        ),
                                                        Text(
                                                          (posts.data()[
                                                                  'price'])
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.pinkAccent,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          ("  LE"),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.pink,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(DetailsView3(
                                            name: posts.data()['name'],
                                            price: posts.data()['price'],
                                            //      x:posts.data()['x'],
                                            details: posts.data()['des'],
                                            image: posts.data()['image'],
                                            productId:
                                                posts.data()['productid'],
                                            //    brand:posts.data()['brand'],
                                            //  brandemail:posts.data()['brandemail']
                                          ));
                                        },
                                      )));
                            });
                    }
                  }),
            ),
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
