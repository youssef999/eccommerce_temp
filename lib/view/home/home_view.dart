import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/services/data_controller.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:ecommerce/view/products/details_view3.dart';
import 'package:ecommerce/view/products/products_view2.dart';
import 'package:ecommerce/view/profile/profile_view.dart';
import 'package:ecommerce/view/widgets/slider_drawer.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/view/search/search_view.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  final urlImages = [
    "https://v-genius.fatafeat.com/storage/attachments/20/Fatafeat-24sept-article2_756316.png/r/800/Fatafeat-24sept-article2_756316.png",
    "https://tijaratuna.com/wp-content/uploads/2020/08/pexels-photo-2447042-e1598880669824-630x300.jpeg",
    "https://www.civgrds.com/projects/wp-content/uploads/2019/10/%D9%85%D8%B4%D8%B1%D9%88%D8%B9-%D9%85%D8%AD%D9%84-%D8%A7%D9%83%D8%B3%D8%B3%D9%88%D8%A7%D8%B1%D8%A7%D8%AA.webp",
    "https://www.fatakat-a.com/wp-content/uploads/%D8%B5%D9%88%D8%B1-%D8%AF%D8%B1%D9%8A%D8%B3%D8%A7%D8%AA-%D9%85%D8%AD%D8%AC%D8%A8%D8%A7%D8%AA-%D8%B7%D9%88%D9%8A%D9%84%D8%A9-%D8%B1%D8%A8%D9%8A%D8%B9-2022.jpg",
    "https://cdn4.premiumread.com/?url=https://www.alroeya.com/uploads/images/2022/01/30/1479522.jpg&w=w850&q=100&f=jpg",
  ];

  String email;

  HomeView({this.email});

  bool isExecuted = false;

  String get urlImage => null;


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModel());
     Get.put(HomeViewModel());
    Get.put(AuthViewModel());
    // Widget searchedData() {
    //   return ListView.builder(
    //       itemCount: querySnapshot.docs.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return ListTile(
    //           leading: CircleAvatar(
    //             backgroundImage:
    //                 NetworkImage(querySnapshot.docs[index].data()['image']),
    //           ),
    //           title: Text(querySnapshot.docs[index].data()['name']),
    //         );
    //       });
    // }


    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Shopping App"),
                centerTitle: true,
                toolbarHeight: 70,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.pink],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.black),
              ),
              drawer: Drawer(
                child: Container(
                  child: Column(
                    children: [
                      SidebarPage(),
                      MyDrawerList(),
                    ],
                  ),
                ),
              ),
              body
                  : Container(
                padding: EdgeInsets.only(top: 5, right: 10, left: 10),
                child: ListView(children: [
                  SizedBox(height: 20),
                  GetBuilder<DataController>(
                    init: DataController(),
                    builder: (controller) => _searchTextFormField(),
                  ),
                  SizedBox(height: 30),

                  Container(
                      child: Center(
                          child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 170,
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                      autoPlayInterval: Duration(
                        seconds: 2,
                      ),
                    ),
                  ))),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Custom_Text(
                        text: "Catogories",
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCatx(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Text(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(ProductsView());
                            },
                            child: Custom_Text(
                              text: "See all",
                              color: Colors.pinkAccent,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts2()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                ]),
              )),
    );
  }

  Widget _searchTextFormField() {
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    // bool isExecuted = false;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => TextFormField(
                controller: search_txt,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: InkWell(
                      child: Icon(Icons.search, color: Colors.black),
                      onTap: () {
                        controller.queryData(search_txt.text).then((value) {
                          querySnapshot = value;
                          isExecuted = true;
                          print("issss" + isExecuted.toString());
                          print("qqq=" + querySnapshot.docs.toString());
                          print("sss=" + search_txt.text.toString());
                          Get.to(SearchView(
                            search_txt: search_txt.text.toString(),
                          ));
                        });
                      }),
                ),
              )
          //}
          ),
    );
  }


  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(),
        ],
      ),
    );
  }

  Widget menuItem() {
    return Material(
      child:

      Column(
        children: [
          InkWell(
            onTap: () {
              // Get.to(ProfileView());
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.pink,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Share App",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Get.to(ProfileView());
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                        Icons.star_rate,
                        size: 20,
                        color: Colors.pink,
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Rate App",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                        Icons.message_rounded,
                        size: 20,
                        color: Colors.pink,
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Contact us",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _listViewProducts2() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 320,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("oopslpslds");
                  Get.to(DetailsView3(
                    name: controller.productModel[index].name,
                    price: controller.productModel[index].price,
                    details: controller.productModel[index].des,
                    image: controller.productModel[index].image,
                    productId:
                    controller.productModel[index].productId,
                    color: controller.productModel[index].color,
                    size: controller.productModel[index].size,
                  ));


                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                              )
                            ]),
                        child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 220,
                            child: Image.network(
                              controller.productModel[index].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Custom_Text(
                        text: controller.productModel[index].name.toString(),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Custom_Text(
                        text: controller.productModel[index].price.toString() +
                            " L.E",
                        color: Colors.pinkAccent,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewCatx() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 220,
          child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                Get.to ( CategoryProducts(
                  cat:  controller.categoryModel[index].name,
                ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                              )
                            ]),
                        child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: 120,
                            child: Image.network(
                              controller.categoryModel[index].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Custom_Text(
                        text: controller.categoryModel[index].name.toString(),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                urlImage,
              ),
              fit: BoxFit.cover)),
    );

enum DrwaerSection {
  dashboard,
  Catogary,
  Your_Products,
  Notfication,
  EditProfile,
}
