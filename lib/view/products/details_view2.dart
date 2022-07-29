import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/cart/cart_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsView2 extends StatefulWidget {
  String  name;
  num  price;
  String  details;
  String  image;
  String  productId;
  String  color, size;

  DetailsView2(
      {this.name,
      this.image,
      this.price,
      this.details,
      this.productId,
        this.size,this.color
    });

  @override
  State<DetailsView2> createState() => _DetailsView2State();
}

class _DetailsView2State extends State<DetailsView2> {
  int index = 0;

  String lg = '';
  final bool  groupValue= false;
  bool value=false;
  bool value1=false;
  bool value2=false;


  bool size=false;
  bool size1=false;
  bool size2=false;
    String  s,c;

  final ValueChanged<bool> onChanged= (bool value) {

      value=value;

  };
  @override
  void initState() {
    final box = GetStorage();
    final box_country = box.read('country') ?? 'x';

    if (box_country == 'امارات') {
      lg = 'LE';
    }

    if (box_country == 'البحرين') {
      lg = 'LE';
    }

    if (box_country == 'قطر') {
      lg = 'LE';
    }

    if (box_country == 'سلطنة عمان') {
      lg = 'LE';
    }

    if (box_country == 'كويت') {
      lg = 'LE';
    }

    if (box_country == 'السعودية') {
      lg = 'LE';
    }

    if (box_country == 'x') {
      lg = 'LE';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Container(
          color:Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 320,
            child: Image.network(widget.image, fit: BoxFit.scaleDown)),
        SizedBox(height: 15),

        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Custom_Text(
                    text: widget.name.toString(),
                    fontSize: 26,
                    color: Colors.black
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 20,
                  ),

                  Custom_Text(
                    text: 'تفاصيل',
                    fontSize: 18,
                    color: HexColor("#ff68682A"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget.details,
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(
                    height:20,
                  ),



              if(widget.color!=null)
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Red",style:TextStyle(color:Colors.black,fontSize:16),),

                          Radio<bool>(
                            groupValue: true,
                            value: value,
                            onChanged: (bool  newValue) {

                              setState(() {
                                value = !value;
                                value1=false;
                                c='red';
                              });
                              print("vvv111=$value");

                            },
                          ),


                        ],
                      ),
                      SizedBox(width: 100,),
                      Column(
                        children: [
                          Text("Blue",style:TextStyle(color:Colors.black,fontSize:16),),

                          Radio<bool>(
                            groupValue: true,
                            value: value1,
                            onChanged: (bool  newValue) {

                              setState(() {
                                c='blue';
                                value1= !value1;
                                value=false;
                              });
                              print("vvv222=$value1");

                            },
                          ),


                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height:20,
                  ),

                  if(widget.size!=null)
                  Row(
                    children: [
                      Column(
                        children: [

                          Text("Small",style:TextStyle(color:Colors.black,fontSize:16),),
                          Radio<bool>(
                            groupValue: true,
                            value: size,
                            onChanged: (bool  newValue) {

                              setState(() {
                                s='small';
                                size = !size;
                                size1=false;
                                size2=false;
                              });
                              print("vvv111=$size");

                            },
                          ),


                        ],
                      ),
SizedBox(width: 100,),
                      Column(

                        children: [

                          Text("Meduim",style:TextStyle(color:Colors.black,fontSize:16),),

                          Radio<bool>(
                            groupValue: true,
                            value: size1,
                            onChanged: (bool   newValue) {

                              setState(() {
                                s='medium';
                                size1= !size1;
                                size=false;
                                size2=false;
                              });
                              print("vvv222=$value1");

                            },
                          ),


                        ],
                      ),
                      SizedBox(width: 100,),
                      Column(

                        children: [

                          Text("large",style:TextStyle(color:Colors.black,fontSize:16),),

                          Radio<bool>(
                            groupValue: true,
                            value: size2,
                            onChanged: (bool   newValue) {

                              setState(() {
                                s='large';
                                size2= !size2;
                                size=false;
                                size1=false;
                              });
                              print("vvv222=$value1");

                            },
                          ),


                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width:2,),
              Column(
                children: [
                  Custom_Text(
                    text: "    السعر",
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(height:3,),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      SizedBox(width: 5),
                      Row(
                        children: [
                          Custom_Text(
                            text: '  ' + widget.price.toString(),
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                          Custom_Text(
                            text: '  ' + 'LE',
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(width: 55),

              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => Container(
                    width: 120,
                    height: 60,
                    child: CustomButton(
                        text: 'اضف',
                        onPressed: () {

                          index = index + 1;
                          print("ttt");
                          print(widget.name);
                          print(widget.price);
                          print("ccc="+c.toString());
                          print("sss="+s.toString());
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
                            // controller.addProduct2(
                            //   CartProductModel(
                            //       name: widget.name,
                            //       image: widget.image,
                            //       price: widget.price.toString(),
                            //       quantity: 1,
                            //       productId: widget.productId,
                            //       brand: widget.brand,
                            //       brand_email: widget.brandemail),
                            //   widget.productId,
                            //
                            //   // model.productId
                            //   //productId:model.productId)
                            // );

                    //        box.write('cart', '1');
                            print("cooooo" + controller.totalPrice.toString());
                          // } else {
                          //
                          //   controller.dialogAndDelete(
                          //     CartProductModel(
                          //         name: widget.name,
                          //         image: widget.image,
                          //         price: widget.price.toString(),
                          //         quantity: 1,
                          //         productId: widget.productId,),
                          //     widget.productId,
                          //   );
                          //  // box.write('brand_email', widget.brandemail);
                          // }

                          //  controller.addProduct2(
                          //      CartProductModel
                          //        (name:name,image:image,
                          //        price:price.toString(),quantity: 1,
                          //      //  productId:productId,
                          //      ),
                          //    //  model.productId
                          //    //productId:model.productId)
                          //  );
                          //  controller.addProduct
                          //    (model.name,model.image,model.price,controller.quant2,model.productId);
                        })),
              ),
            ],
          ),
        ),
        Container(height: 30),


        GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => InkWell(
              child: Container(
             //   width:333,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green)
                ),
                height:60,
                child: Card(
                  color:Colors.blue,
                  child: Row(
                        children: [

                          SizedBox(width:111),
                          Text(controller.totalPrice.toString(),style:TextStyle(color:Colors.white,fontSize:17),),
                          SizedBox(width:10),
                          Container(
                           // height: 60,
                            child: Text("  =   انتقل الي السلة  ",style:TextStyle(color:Colors.white,fontSize:17),),
                          ),
                        ],
                      ),
                ),
              ),
              onTap:(){
                Get.to(CartView2());
              },
            ))
      ])),
    );
  }
}
