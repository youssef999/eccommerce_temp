

import 'package:ecommerce/view/home/controll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


  class NoOrdersView extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor:Colors.white,
        body:Center(
          child: Container(
            color:Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height:120
                ),

                 Container(

                   height:170,
                     width:330,
                     child: Image.asset('assets/wh3.jpeg')),


                Container(
                  child: Text("لا توجد طلبات سابقة ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 25,
                          fontWeight: FontWeight.w800)),),

                SizedBox(
                    height: 12
                ),


                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("  اطلب الان    "),
                    onPressed: () {
                      Get.off(ControlView());
                    })

              ],
            ),
          ),
        ),
      );
    }
  }
