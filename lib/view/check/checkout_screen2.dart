import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' as intl;

class CheckOutScreen2 extends StatefulWidget {
  String country, city;
  String address;
  String apartment;
  String floor;
  String mobile;
  num total;
  List<CartProductModel> cartmodel;
  String brand_email;
  double lat, long;
  CheckOutScreen2(
      this.country,
      this.city,
      this.address,
      this.apartment,
      this.floor,
      this.mobile,
      this.total,
      this.cartmodel,
      //  this.brand_email,
      // this.brand_name,
      this.lat,
      this.long);

  @override
  State<CheckOutScreen2> createState() => _CheckOutScreen2State();
}

class _CheckOutScreen2State extends State<CheckOutScreen2> {
  final box = GetStorage();
  void initState() {
    super.initState();
    box.remove('clicked');
  }

  @override
  Widget build(BuildContext context) {
    int i2 = widget.cartmodel.length;
    double opacity = 0.0;
    num shipping_cost = 22;
    TextEditingController _notesController = TextEditingController();
    TextEditingController codeController = TextEditingController();

    final box_brand = box.read('brand') ?? 'x';
    DateTime now = DateTime.now();
    bool clicked = true;
    String time = intl.DateFormat('kk:mm:ss  EEE d MMM').format(now);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        toolbarHeight: 3,
      ),
      body: GetBuilder<CheckOutViewModel>(
          init: CheckOutViewModel(),
          builder: (controller) => Container(
                  child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      Container(
                          width: 300,
                          height: 1100,
                          child: Card(
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 1),
                                    Container(
                                      color: Colors.white,
                                      height: 80,
                                      width: 600,
                                      child: Image.asset('assets/ecom.png'),
                                    ),
                                    SizedBox(height: 10),
                                    Card(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                              child: Text(
                                            "Yor Order",
                                            style: TextStyle(
                                                color: Colors.pinkAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Text(
                                                time,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6),
                                          for (int i = 0; i < i2; i++)
                                            Row(
                                              children: [
                                                Text(
                                                  "   " +
                                                      widget.cartmodel[i].name
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 7),
                                                Text(
                                                  "x " +
                                                      widget
                                                          .cartmodel[i].quantity
                                                          .toString(), //" x ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  " = " +
                                                      (int.parse(widget
                                                                  .cartmodel[i]
                                                                  .price) *
                                                              widget
                                                                  .cartmodel[i]
                                                                  .quantity)
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 5,
                                            ),
                                            child: Text(
                                              "Your Address",
                                              style: TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              //   SizedBox(width:222,),
                                              Text(
                                                "Country : ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 5),
                                              Text(widget.country ?? "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "City : ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(widget.city ?? "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 36,
                                                child: Text(
                                                  "Street:  ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                height: 36,
                                                child: Text(
                                                    widget.address ?? "",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "House: ",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(widget.apartment ?? "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Float : ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(widget.floor ?? "",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 7),
                                                child: Text(
                                                  " Phone : ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              // Directionality(
                                              //  textDirection:TextDirection.rtl,
                                              //   child:
                                              Text(
                                                  widget.mobile.replaceAll(
                                                              '+', '') +
                                                          "+" ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black)),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                          color: Colors.white,
                                          height: 55,
                                          child: Center(
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Center(
                                                child: TextFormField(
                                                    maxLines: 1,
                                                    decoration: InputDecoration(
                                                      hintStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey),
                                                      hintText:
                                                          'اضافة كود خصم ',
                                                      //suffixIcon: Icon(Icons.search),
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.all(22),
                                                    ),
                                                    controller: codeController,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    onSaved: (value) {
                                                      codeController.text =
                                                          value;
                                                    }),
                                              ),
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      child: Container(
                                        width: 220,
                                        height: 50,
                                        child: Card(
                                          elevation: 5,
                                          color: Colors.pinkAccent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                              child: Text(
                                            "Active Promocode" +
                                                codeController.text,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          )),
                                        ),
                                      ),
                                      onTap: () {
                                        print("xxx=" + clicked.toString());
                                        bool cc = box.read('clicked') ?? true;
                                        print("cc=" + cc.toString());
                                        if (codeController.text == '123456' &&
                                            cc == true) {
                                          setState(() {
                                            clicked = false;
                                            widget.total = widget.total - 50;
                                            print("ccccc" + clicked.toString());
                                            box.write('clicked', clicked);
                                          });
                                          Get.snackbar(
                                            'done',
                                            'تم تفعيل الخصم بنجاح ',
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                          );
                                        }
                                        if (cc == true &&
                                            codeController.text != '123456') {
                                          Get.snackbar(
                                              'خطا', 'كود الخصم غير صحيح ',
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white);
                                        }

                                        print("wwww" + widget.total.toString());
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                        child: Column(
                                      children: [
                                        SizedBox(width: 20),
                                        Container(
                                          height: 100,
                                          child: Card(
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                SizedBox(width: 50),
                                                Column(
                                                  children: [
                                                    SizedBox(height: 17),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Text(
                                                          "Total", //+ total.toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Text(
                                                          widget.total
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  children: [
                                                    SizedBox(height: 17),
                                                    Text(
                                                      "Deliviry",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      shipping_cost.toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  children: [
                                                    SizedBox(height: 17),
                                                    Text(
                                                        "Final Total", //+ (total+shipping_cost).toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        )),
                                                    Text(
                                                        (widget.total +
                                                                shipping_cost)
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [],
                                        ),
                                        SizedBox(height: 5),

                                        //   SizedBox(height: 50),

                                        Container(
                                            color: Colors.white,
                                            height: 70,
                                            width: 370,
                                            child: Center(
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: TextFormField(
                                                  maxLines: 3,
                                                  decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                    hintText: 'اضافة ملاحظة ',
                                                    //suffixIcon: Icon(Icons.search),
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.all(22),
                                                  ),
                                                  controller: _notesController,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 80,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            //SizedBox(width:120),
                                            GetBuilder<CartViewModel>(
                                                init: Get.find(),
                                                builder: (controller) =>
                                                    Container()),
                                            Center(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 250,
                                                    child: RaisedButton(
                                                      shape:
                                                          new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      color: Colors.pinkAccent,
                                                      onPressed: () {
                                                        for (int i = 0;
                                                            i < i2;
                                                            i++)
                                                          controller.DeleteProducts2(
                                                              CartProductModel(
                                                                  name: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .name,
                                                                  image: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .image,
                                                                  price: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .price
                                                                      .toString(),
                                                                  quantity: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .quantity,
                                                                  color: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .color,
                                                                  size: widget
                                                                      .cartmodel[
                                                                          i]
                                                                      .size,
                                                                  productId: widget
                                                                      .cartmodel[i]
                                                                      .productId),
                                                              widget.cartmodel[i].productId);

                                                        controller.checkout(
                                                            widget.country,
                                                            widget.city,
                                                            widget.address,
                                                            widget.apartment,
                                                            widget.floor,
                                                            widget.mobile,
                                                            widget.total +
                                                                shipping_cost,
                                                            widget.cartmodel,
                                                            widget.total +
                                                                shipping_cost,
                                                            widget.brand_email,
                                                            box_brand,
                                                            _notesController
                                                                .text
                                                                .toString(),
                                                            widget.lat,
                                                            widget.long);
                                                        print("doooo");

                                                        box.remove('cart');
                                                        box.remove('clicked');
                                                        opacity = 1.0;
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          "Confirm Your Order",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 22),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //     Opacity(
                                                  //       opacity:opacity,
                                                  //       child: GetBuilder<CartViewModel>(
                                                  //       init: CartViewModel(),
                                                  // builder: (controller) =>
                                                  //         RaisedButton(
                                                  //           shape: new RoundedRectangleBorder(
                                                  //             borderRadius: new BorderRadius.circular(30.0),
                                                  //           ),
                                                  //           color: Colors.red,
                                                  //           onPressed: () {
                                                  //             for (int i = 0; i < i2; i++)
                                                  //               controller.DeleteProducts(
                                                  //                   CartProductModel(
                                                  //                       name: cartmodel[i].name,
                                                  //                       image: cartmodel[i].image,
                                                  //                       price: cartmodel[i]
                                                  //                           .price
                                                  //                           .toString(),
                                                  //                       quantity:
                                                  //                       cartmodel[i].quantity,
                                                  //                       productId:
                                                  //                       cartmodel[i].productId),
                                                  //                   cartmodel[i].productId);
                                                  //
                                                  //             Get.offAll(OrderStatus(
                                                  //               order_id:'kkk',
                                                  //               cartmodel: cartmodel,
                                                  //             ));
                                                  //
                                                  //           },
                                                  //           child: Center(
                                                  //             child: Text(
                                                  //              "تم",
                                                  //               style: TextStyle(
                                                  //                   color: Colors.white, fontSize: 16),
                                                  //             ),
                                                  //           ),
                                                  //         )
                                                  //
                                                  //   ),
                                                  //     ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                              ))),
                    ],
                  ),
                ),
              ))),
    );
  }
}
