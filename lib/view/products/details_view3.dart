
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/cart/cart_view2.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailsView3 extends StatefulWidget {
  String name;
  num price;
  String details;
  String image;
  String productId;
  String color, size;

  DetailsView3(
      {this.name,
      this.image,
      this.price,
      this.details,
      this.productId,
      this.size,
      this.color});

  @override
  State<DetailsView3> createState() => _DetailsView3State();
}

class _DetailsView3State extends State<DetailsView3> {
  int index = 0;

  String lg = '';
  final bool groupValue = false;
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  bool size = false;
  bool size1 = false;
  bool size2 = false;
  String s, c;

  final ValueChanged<bool> onChanged = (bool value) {
    value = value;
  };
  @override
  void initState() {
    // final box = GetStorage();
    // final box_country = box.read('country') ?? 'x';
    //
    // if (box_country == 'امارات') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'البحرين') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'قطر') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'سلطنة عمان') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'كويت') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'السعودية') {
    //   lg = 'LE';
    // }
    //
    // if (box_country == 'x') {
    //   lg = 'LE';
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:

      GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Container(
                  height: 320,//MediaQuery.of(context).size.height * .55,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.image,
                          ),
                          fit: BoxFit.fill)),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Details",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.details,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 90,
                                  ),
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    widget.price.toString() + " L.E",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:80.0),
                                child: GetBuilder<CartViewModel>(
                                  init: CartViewModel(),
                                  builder: (controller) => Padding(
                                    padding: const EdgeInsets.only(right: 12, bottom: 7),
                                    child: Container(
                                      width: 150,
                                      height: 70,
                                      child: CustomButton(
                                        text: "Add To Cart",
                                        onPressed: () {
                                          index = index + 1;
                                          print("ttt");
                                          print(widget.name);
                                          print(widget.price);
                                          print("ccc=" + c.toString());
                                          print("sss=" + s.toString());
                                          controller.dialogAndAdd(
                                            CartProductModel(
                                              name: widget.name,
                                              image: widget.image,
                                              price: widget.price.toString(),
                                              quantity: 1,
                                              productId: widget.productId,
                                              color: c.toString(),
                                              size: s.toString(),
                                            ),
                                            widget.productId,
                                          );

                                          print("cooooo" +
                                              controller.totalPrice.toString());
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                  top: MediaQuery.of(context).padding.top + 5,
                  left: 25,
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 1),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      iconSize: 25,
                      onPressed: () {
                        Get.to(MainPage());
                      },
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).padding.top + 5,
                  right: 25,
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 0),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      iconSize: 25,
                      onPressed: () {
                        Get.to(CartView3());
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
