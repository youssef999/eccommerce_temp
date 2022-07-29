
import 'package:ecommerce/view/owner/owner_code.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

 class OwnerCheck extends StatefulWidget {


   @override
   _OwnerCheckState createState() => _OwnerCheckState();
 }



 class _OwnerCheckState extends State<OwnerCheck> {

   @override
   void initState() {

   super.initState();
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor:Colors.white,
        body:Column(
          children: [
            SizedBox(
              height:50
            ),
            Container(
              color:Colors.white,
              height:240,
              width:500,
              child:Image.asset('assets/wh3.jpeg')
            ),
            Container(
              child:Center(
                child: Text("هل انت تاجر او تريد ان تكون تاجر داخل التطبيق",
                style:TextStyle(color:Colors.black,fontSize:18, fontWeight:FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height:20
            ),

            RaisedButton(
              color: HexColor("#ff68682A"),
              child:Text("نعم",style:TextStyle(color:Colors.white,fontSize:18,
                  fontWeight:FontWeight.w700),),
              onPressed:(){
                final box = GetStorage();
                final box1= box.read('email')??'x';
                final box2= box.read('pass')??'x';
                final box3=box.read('code')??'x';

                print("box1=="+box1);
                print("box3=="+box3);
                if(box3=='x'){
                  Get.to(OwnerCodeView());
                }
                else{
                  Get.to(OwnerHomeView(
                    email:box1,
                    pass:box2,
                    code:box3
                  ));
                }
              },
            )
          ],
        ),
     );
   }
 }
