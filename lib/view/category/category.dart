import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/size_helper.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cateogry_product.dart';

class CategoriesView extends StatefulWidget {


  @override
  _PostsScreenState createState() => _PostsScreenState();
}


class _PostsScreenState extends State<CategoriesView> {
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
          backgroundColor: Colors.red,
          toolbarHeight: 1,

        ),

        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: Dimentions.height7,
            ),

            SizedBox(
              height: Dimentions.height7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('categories')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:

                        if(snapshot.data.docs==0 || !snapshot.hasData ){

                          Center(
                            child: Custom_Text(
                              text:"no products in this category try another category",
                              fontSize: 23,
                              alignment: Alignment.center,
                            ),
                          );

                        }
                        else{
                          return GridView.builder(
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height:
                                          Dimentions.pageViewContainer220,
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.white,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                        Radius.circular(
                                                            Dimentions
                                                                .Radius10),
                                                        topRight:
                                                        Radius.circular(
                                                            Dimentions
                                                                .Radius10),
                                                        bottomLeft:
                                                        Radius.circular(
                                                            Dimentions
                                                                .Radius10),
                                                        bottomRight:
                                                        Radius.circular(
                                                            Dimentions
                                                                .Radius10)),
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
                                                      width:
                                                      Dimentions.width420,
                                                      height: Dimentions
                                                          .ViewContainer140,
                                                      child: Image.network(
                                                          posts.data()[
                                                          'image'],
                                                          fit: BoxFit.fill),
                                                    ),
                                                    SizedBox(
                                                        height: Dimentions
                                                            .height10),
                                                    Column(
                                                      children: [
                                                        Directionality(
                                                          textDirection:
                                                          TextDirection
                                                              .rtl,
                                                          child: Container(
                                                            //    width:100,
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
                                                          height: Dimentions
                                                              .height7,
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Get.to ( CategoryProducts(
                                                cat:  controller.categoryModel[index].name,
                                              ));

                                            },
                                          )),
                                    ));
                              });
                        }

                    }
                  }),
            ),
            //),
            //  ]),
          ]),
        ));
  }
}