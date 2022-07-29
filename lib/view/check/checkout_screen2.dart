import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/order_status.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart'as intl;


class CheckOutScreen2 extends StatefulWidget {
  String  country,city;
  String address;
  String  apartment;
  String  floor;
  String mobile;
  num  total;
  List<CartProductModel> cartmodel;
  String  brand_email;
  double  lat,long;
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
      this.lat,this.long
  );

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
    double opacity=0.0;
    num shipping_cost=22;
    TextEditingController _notesController = TextEditingController();
    TextEditingController codeController = TextEditingController();

    final box_brand=box.read('brand')??'x';
    DateTime now = DateTime.now();
bool clicked=true;
    String time =intl. DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    // String cartmodel2=cartmodel.toString();
    return
      Scaffold(
        backgroundColor:Colors.white,
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
                                color:Colors.white,
                                height:80,
                                width:600,
                                child:Image.asset('assets/ecom.png'),
                              ),
                              SizedBox(height: 5),
                                Card(
                                  color:Colors.white ,
                                  child: Column(
                                    children: [
                                      SizedBox(height:5,),
                                      Center(
                                          child: Text(
                                            "طلبك ",
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 19,fontWeight:FontWeight.w700),
                                          )),
                                      SizedBox(height:5,),


                                      Row(
                                        children: [
                                          SizedBox(width:11,),
                                          Text(
                                            time,
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height:6),
                                      for (int i = 0; i < i2; i++)
                                        Row(
                                          children: [
                                            Text(
                                              "   " + widget.cartmodel[i].name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 18),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              "x " + widget.cartmodel[i].quantity.toString(),//" x ",
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              " = " +
                                                  (int.parse(widget.cartmodel[i].price) *
                                                      widget.cartmodel[i].quantity)
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16),
                                            ),

                                          ],
                                        ),
                                      SizedBox(
                                        height:7
                                      ),
                                    ],
                                  ),
                                ),

                                Card(
                                  color: Colors.white,
                                  child:Column(
                                    children: [
                                      Text("تفاصيل العنوان ",style:TextStyle(color:Colors.black,fontSize:18),),

                                      SizedBox(
                                          height:3
                                      ),

                                      Row(
                                        children: [
                                       //   SizedBox(width:222,),
                                          Text(" الدولة  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                          Text(
                                              widget.country ??
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
                                              widget.city ??
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
                                          Container(
                                            height:36,
                                            child: Text("عنوان الشارع :  ",
                                              style:TextStyle(color:Colors.black,fontSize:19),),
                                          ),

                                          Container(
                                            height:36,
                                            child: Text(
                                                widget.address ??
                                                    "",
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
                                          Text("  الشقة : ",style:TextStyle(color:Colors.black,fontSize:19),),

                                          Text(
                                              widget.apartment ??
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
                                            Text(" الطابق : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                            Text(
                                                widget.floor??
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
                                         // Directionality(
                                          //  textDirection:TextDirection.rtl,
                                         //   child:
                                            Text(
                                                widget.mobile.replaceAll('+', '')+"+" ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.black)),
                                         // ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                              Center(
                                child: Container(
                                    color: Colors.white,
                                    height:55,
                                    child:Center(
                                      child: Directionality(
                                        textDirection:TextDirection.rtl,

                                        child: Center(
                                          child: TextFormField(
                                            maxLines:1,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(fontSize: 16,color:Colors.grey),
                                              hintText: 'اضافة كود خصم ',
                                              //suffixIcon: Icon(Icons.search),
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(22),
                                            ),
                                            controller:codeController,style:TextStyle(color:Colors.black),
                                     onSaved: (value) {
                                              codeController.text=value;
                                     }
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                              ),




                         InkWell(
                           child: Container(
                             width:170,
                             height:40,
                             child: Card(
                               elevation: 5,
                               color:Colors.blue,
                               child:Center(child: Text("  تفعيل كود الخصم  "+codeController.text,style:TextStyle(color:Colors.white,fontSize:16),)),
                             ),
                           ),
                           onTap:(){

                             print("xxx="+clicked.toString());
                             bool cc=box.read('clicked')??true;
                             print("cc="+cc.toString());
                               if(codeController.text=='123456' && cc== true){


                                 setState(() {
                                   clicked=false;
                                   widget.total=widget.total-50;
                                   print("ccccc"+clicked.toString());
                                   box.write('clicked',clicked);
                                 });
                                 Get.snackbar('done', 'تم تفعيل الخصم بنجاح ',
                                 backgroundColor: Colors.green,
                                   colorText:Colors.white,

                                 );
                               }
                               if(cc==true && codeController.text!='123456'){


                                 Get.snackbar('خطا', 'كود الخصم غير صحيح ',
                                     backgroundColor: Colors.red,
                                     colorText:Colors.white
                                 );
                               }

                               print("wwww"+widget.total.toString());




                           },
                         ),

                              SizedBox(height: 2),
                                Container(
                                    child: Column(

                                  children: [

                                    SizedBox(width:20),
                                    Container(
                                      height:100,
                                      child: Card(
                                        color: Colors.white,
                                        child: Row(
                                          children: [

                                            SizedBox(width:50),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),

                                                Text(" الاجمالي  ", //+ total.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    )),
                                                Text( widget.total.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black ,
                                                      fontSize: 18,
                                                    )),
                                              ],

                                            ),
                                            SizedBox(width:20),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),
                                                Text(
                                                  "التوصيل",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  shipping_cost.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width:20),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),
                                                Text(" الاجمالي النهائي  ", //+ (total+shipping_cost).toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    )),
                                                Text( (widget.total+shipping_cost).toString(),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [


                                      ],
                                    ),
                                    SizedBox(height: 5),

                                 //   SizedBox(height: 50),

                                    Container(
                                        color: Colors.white,
                                        height:70,
                                        width:370,
                                        child:Center(
                                          child: Directionality(
                                            textDirection:TextDirection.rtl,
                                            child: TextFormField(
                                              maxLines:3,
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(fontSize: 16,color:Colors.grey),
                                                hintText: 'اضافة ملاحظة ',
                                                //suffixIcon: Icon(Icons.search),
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.all(22),
                                              ),
                                              controller:_notesController,style:TextStyle(color:Colors.black),
                                            ),
                                          ),
                                        )
                                    ),



                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        //SizedBox(width:120),
                                        GetBuilder<CartViewModel>(
                                            init: Get.find(),
                                            builder: (controller) => Container()),
                                        Center(
                                          child: Column(
                                            children: [
                                              RaisedButton(
                                                shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
                                                color: Colors.blue,
                                                onPressed: () {
                                                  for (int i = 0; i < i2; i++)


                                                    controller.DeleteProducts2(
                                                        CartProductModel(
                                                            name: widget.cartmodel[i].name,
                                                            image: widget.cartmodel[i].image,
                                                            price: widget.cartmodel[i]
                                                                .price
                                                                .toString(),
                                                            quantity:
                                                                widget.cartmodel[i].quantity,
                                                            color: widget.cartmodel[i]
                                                                .color,
                                                            size: widget.cartmodel[i].size,
                                                            productId:
                                                                widget.cartmodel[i].productId),
                                                        widget.cartmodel[i].productId);




                                                  controller.checkout(
                                                    widget.country,
                                                      widget.city,
                                                      widget.address,
                                                      widget.apartment,
                                                      widget.floor,
                                                      widget.mobile,
                                                      widget.total+shipping_cost,
                                                      widget.cartmodel,
                                                      widget.total+shipping_cost,
                                                       widget.brand_email,
                                                      box_brand,
                                                  _notesController.text.toString(),
                                                    widget.lat,widget.long
                                                  );
                                                  print("doooo");

                                                  box.remove('cart');
                                                  box.remove('clicked');
                                                  opacity=1.0;

                                                },
                                                child: Center(
                                                  child: Text(
                                                    "تاكيد الطلب ",
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 22),
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
