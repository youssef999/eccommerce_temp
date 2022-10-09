
import 'package:ecommerce/map/map_view2.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_check.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../viewmodel/cart_viewmodel.dart';


class CartView3 extends StatefulWidget {
  int id;
  //String brand_email;
  CartView3({this.id});

  @override
  State<CartView3> createState() => _CartView3State();
}

class _CartView3State extends State<CartView3> {
  void initState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    bool x = false;
    final box_Lat = box.read('Lat') ?? 37.42796133580664;
    final box_Long = box.read('Long') ?? 122.085749655962;
    final box_address = box.read('Adress_details1') ?? 'x';
    final box_address2 = box.read('Adress_details2') ?? "hh";
    final box_address3 = box.read('Adress_details3') ?? "ogi";
    final box_address4 = box.read('Adress_details4') ?? "yyy";
    final box_country = box.read('Adress_country') ?? "///";
    final box_city = box.read('Adress_city') ?? "///";

    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => (Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          toolbarHeight: 1,
        ),

        backgroundColor: Colors.white,
        body: controller.cartProductModel.length == 0 || widget.id == 3
            ? Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Center(
                    child: Image.asset("assets/emp.png"),
                  ),
                ],
              ))
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 25),
                            child: Container(
                                height: 140,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 140,
                                      child: Image.network(
                                          controller
                                              .cartProductModel[index].image
                                              .toString(),
                                          fit: BoxFit.fill),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .cartProductModel[index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            controller.cartProductModel[index]
                                                    .price
                                                    .toString() +
                                                " L.E",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pinkAccent),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            color: Colors.grey.shade200,
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.pinkAccent,
                                                    )),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Custom_Text(
                                                  alignment: Alignment.center,
                                                  text: controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  fontSize: 20,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20),
                                                    child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          Icons.minimize,
                                                          color:
                                                              Colors.pinkAccent,
                                                        ))),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      controller.DeleteProducts(
                                                          CartProductModel(
                                                              name: controller
                                                                  .cartProductModel[
                                                                      index]
                                                                  .name,
                                                              image: controller
                                                                  .cartProductModel[
                                                                      index]
                                                                  .image,
                                                              price: controller
                                                                  .cartProductModel[
                                                                      index]
                                                                  .price,
                                                              quantity: controller
                                                                  .cartProductModel[
                                                                      index]
                                                                  .quantity,
                                                              productId: controller
                                                                  .cartProductModel[
                                                                      index]
                                                                  .productId),
                                                          controller
                                                              .cartProductModel[
                                                                  index]
                                                              .productId);
                                                    },
                                                    child: Icon(
                                                        Icons.delete_outline))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                        itemCount: controller.cartProductModel.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "TOTAL",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controller) => Custom_Text(
                                text: controller.totalPrice.toString(),
                                color: Colors.pinkAccent,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                                height: 70,
                                width: 120,
                                child: GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => (RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13)),
                                        color: Colors.pinkAccent,
                                        child: Text(
                                          "CHECKOUT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          print("lll=" + box_address);

                                          if (box_address == 'x') {
                                            Get.to(MapView2(
                                              total: controller.totalPrice,
                                              cartmodel:
                                                  controller.cartProductModel,
                                            ));
                                          }
                                          if (box_address != 'x') {
                                            Get.to(AddressCheck(
                                              country: box_country,
                                              city: box_city,
                                              total: controller.totalPrice,
                                              cartmodel:
                                                  controller.cartProductModel,
                                              adress: box_address,
                                              building: box_address2,
                                              floor: box_address3,
                                              phone: box_address4,
                                              lat: box_Lat,
                                              long: box_Long,
                                            ));
                                          }
                                        })))))
                      ],
                    ),
                  )
                ],
              ),
      )),
    );

    //  );
  }
}
