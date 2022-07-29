



import 'package:ecommerce/view/owner/ownerallorders.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/owner_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'owner_orders_request.dart';
import 'owner_products.dart';

class OwnerHomeView extends GetWidget<AuthViewModel> {

  String email;
  String  pass;
  String  code;
  OwnerHomeView({this.email,this.pass,this.code});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
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
      body:Container(

        child:GridView.count(
        primary: false,
        padding: const EdgeInsets.only(top:50,left: 20,right:20,bottom:40),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        crossAxisCount: 1,
        children: <Widget>[

          InkWell(
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(top:8,left:20,right:20,bottom:20),
              child: Center(child: Column(
                children: [

                  InkWell(
                    child: Container(
                        height:180,
                        width:400,
                        child:
                        Image.network(
                          'https://isisorganic.com/wp-content/uploads/2020/12/home-page-products-groserys-1024x1024.jpg',
                          fit:BoxFit.fill,)),
                    onTap:(){

                     Get.to( OwnerProductsView(email:email));
                      //Get.to(CategoryProducts(cat:'عطر',));
                    },
                  ),
                  SizedBox(
                    height:22
                  ),
                  const Text("منتجاتك ",style:TextStyle(color:Colors.white,fontSize:22),),
                ],
              )),
              color: HexColor("#ff68682A"),
            ),
            onTap:(){
              Get.to( OwnerProductsView(email:email));
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              child:Center(child: Column(
                children: [
                  InkWell(
                    child: Container(
                        height:180,
                        width:400,
                        child:
                        Image.network
                          ('https://cdn.iconscout.com/icon/premium/png-256-thumb/restaurant-order-2214132-1858660.png'
                         //   'k8oyGVEQ411FJ45sBqr1b9kz7UMTEbUh+ePzFsTw+F4YA4UuveU1M2dZOhtJXV8O/17nlYfGCYdsUF+oOerRMpl7JJseOKNfI+eWZDFlBshq6lGsENlXjPUjWDbbmheaJEsLSUpDbDq2cxpGgyYfthVsxFZlbDWKrYLYglS1v0zWKahZjCBvDObNjdA+kNWeR6GhzTSETa498mEG7dLIYF5ZJWU7YXLcyGnY/ekM2a4F3DMeURF81vVkPbnSJbnnL+Pzv5J3yhjsrplN/MbcyGNV8Whp+ejo83lOzWqR9bV38tXgFTHjVcIXjvpLSe8jFw5bmaSc3Gdi4bnrsmFm4osxfPh2ehcbz+rzG/IKZmsH6IEO7oqqbBtsL5PfHU8yGb6RPJMJ7+EUvLuscNy/pLppajNnb5226G3dYd9/OSbT82QaG1tJw1hiyibkeI454m9Bz3NNVKMmRDsB341BNJVQaj0Z5dTSnnIhFd0M5o1mol8ma9vHYbNmVYDWPFkLf8j+PK0xq3eY6H261GPVuwcVq6DNs6v2jIx2mk/WLR47ww9TRRQsfzUkQ15ON0aTd8Xkm/asjHaVjaHg49J8bvFt0GojkfsnGaWg27lfNlQ2E9NV95/8V8bgzfnvp4T3cCZj2fmQ2jfqt62ZAPzdx8Nz9IUP/9MKL9VWfIompfukOmit/pFa8b8nH6GAm/2jXRfZHRV1iazBWrHLvdzehP1m8HTQOvd+JByvoNmO0WLLTi43TWtLTUEel1sF/DaJw3u06Sy/dYs8uo5cK9QxOj81aNo5ZdGRouxSbsfvJbiTPL8fxrUVZ5miTJIY8ns9f8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+JB/ANV0RlXZS1G4AAAAAElFTkSuQmCC',
                          ,fit:BoxFit.fill,)),
                    onTap:(){

                      Get.to(OwnerAllOrdersView(brand_email:email,));
                     // Get.to(CategoryProducts(cat:'حلوي',));
                    },

                  ),
                  SizedBox(
                    height:22
                  ),
                  Center(child: const Text("الطلبات علي متجرك",style:TextStyle(color:Colors.white,fontSize:22),)),
                ],
              )),
              color: HexColor("#ff68682A"),
            ),
            onTap:(){
              Get.to(OwnerAllOrdersView(brand_email:email,));
             // Get.to(CategoryProducts(cat:'حلوي',));
            },
          )


        ],
         )

        )
      );

  }
}