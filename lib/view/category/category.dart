

 import 'package:ecommerce/view/brands/brand_cat_view.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:ecommerce/view/products/products_view2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
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
      body:Container(
        color:Colors.white38,
        child:
        Padding(
          padding: const EdgeInsets.only(top:38.0),
          child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[

              InkWell(
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Column(
                      children: [
                        InkWell(
                          child: Container(
                              height:100,
                              width:400,
                              child: Image.asset("assets/w1.png",
                                fit:BoxFit.fitHeight,)
                              ),
                          onTap:(){
                            Get.to(ProductsView(cat:'men',));
                          },
                        ),
                        const Text("ملابس رجالي",style:TextStyle(color:Colors.blue,fontSize:22),),
                      ],
                    )),
                    color: Colors.white
                  ),
                ),
                onTap:(){

                  Get.to(ProductsView (cat:'men',));

                },
              ),
              InkWell(
               child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child:Center(child: Column(
                    children: [
                      InkWell(
                        child: Container(
                            height:100,
                            width:400,
                            child: Image.asset("assets/w2.png",fit:BoxFit.fill)),
                        onTap:() {
                          Get.to(ProductsView (cat:'women',));
                        },
                      ),


                      const Text("ملابس حريمي",style:TextStyle(color:Colors.blue,fontSize:22),),

                    ],
                  )),
                  color: Colors.white,
                )),
                onTap:(){
                  Get.to(ProductsView (cat:'women',));
                },
              ),

              InkWell(
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Column(
                      children: [
                        InkWell(
                          child: Container(
                              height:100,
                              width:400,
                              child: Image.asset("assets/w44.png",fit:BoxFit.fill,)),
                          onTap:(){
                            Get.to(ProductsView (cat:'kids',));
                          },
                        ),
                        const Text('ملابس اطفال',style:TextStyle(color:Colors.blue,fontSize:22),),
                      ],
                    )),
                    color: Colors.white,

                  ),
                ),
                onTap:(){Get.to(ProductsView (cat:'kids',));},
              ),
              InkWell(
                child:Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(child: Column(
                    children: [
                      InkWell(
                        child: Container(
                            height:100,
                            width:400,
                            child: Image.asset("assets/w66.png",fit:BoxFit.fill,)),
                        onTap:(){
                          Get.to(ProductsView (cat:'Acx',));
                        },
                      ),
                      const Text("اكسسوارات",style:TextStyle(color:Colors.blue,fontSize:22),),
                    ],
                  )),
                  color: Colors.white,
                ) ),
                onTap:(){Get.to(ProductsView (cat:'Acx',));},
              ),

          //     InkWell(
          //       child: Card(
          //         child: Container(
          //           padding: const EdgeInsets.all(8),
          //           child: Center(child: Column(
          //             children: [
          //               InkWell(
          //                 child: Container(
          //                     height:100,
          //                     width:400,
          //                     child: Image.asset("assets/c5.jpeg",fit:BoxFit.fill,)),
          //                 onTap:(){
          //                   Get.to(BrandsCatView(cat:'',));
          //                 },
          //               ),
          //               const Text("المذاق العُماني",style:TextStyle(color:Colors.white,fontSize:22),),
          //             ],
          //           )),
          //           color: HexColor("#ff68682A"),
          //         ),
          //       ),
          //       onTap:(){Get.to(BrandsCatView(cat:'المذاق العُماني',));},
          //     ),
          //
          //
          //     InkWell(
          // child:      Card(
          //       child: Container(
          //         padding: const EdgeInsets.all(8),
          //         child: Center(child: Column(
          //           children: [
          //             InkWell(
          //               child: Container(
          //                   height:100,
          //                   width:400,
          //                   child: Image.asset("assets/c4.jpeg",fit:BoxFit.fill,)),
          //               onTap:(){
          //                 Get.to(BrandsCatView(cat:'تمور',));
          //               },
          //             ),
          //             const Text("تمور",style:TextStyle(color:Colors.white,fontSize:22),),
          //           ],
          //         )),
          //         color: HexColor("#ff68682A"),
          //
          //       )),
          //       onTap:(){Get.to(BrandsCatView(cat:'تمور',));},
          //     ),






              // InkWell(
              //   child: Container(
              //     padding: const EdgeInsets.all(8),
              //     child: Center(child: Column(
              //       children: [
              //         InkWell(
              //           child: Container(
              //               height:100,
              //               width:400,
              //               child: Image.asset("assets/w3.png",fit:BoxFit.fill,)),
              //           onTap:(){
              //             Get.to(BrandsCatView(cat:'سعفيات',));
              //           },
              //         ),
              //         const Text("سعفيات",style:TextStyle(color:Colors.white,fontSize:22),),
              //       ],
              //     )),
              //     color: HexColor("#ff68682A"),
              //
              //   ),
              //   onTap:(){Get.to(BrandsCatView(cat:'سعفيات',));},
              // ),


              // InkWell(
              //   child: Container(
              //     padding: const EdgeInsets.all(8),
              //     child: Center(child: Column(
              //       children: [
              //         InkWell(
              //           child: Container(
              //               height:100,
              //               width:400,
              //               child: Image.asset("assets/q7.png",fit:BoxFit.fill,)),
              //           onTap:(){
              //             Get.to(BrandsCatView(cat:'خلطات',));
              //           },
              //         ),
              //         const Text("خلطات",style:TextStyle(color:Colors.white,fontSize:22),),
              //       ],
              //     )),
              //     color: HexColor("#ff68682A"),
              //
              //   ),
              //   onTap:(){Get.to(BrandsCatView(cat:'خلطات',));},
              // ),



            ],
          ),
        )
      ),
    );
  }
}
