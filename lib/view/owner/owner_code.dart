






import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/owner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'owner_request.dart';

  class  OwnerCodeView extends GetWidget<AuthViewModel> {

  String email ,pass,code;

  OwnerCodeView({this.email,this.pass,this.code});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Container(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key:_formKey,
              child: Column(

                children: [
                  SizedBox(
                      height:70
                  ),
                  Container(
                      height:220,
                      width:120,
                      color:Colors.white,
                      child:Image.asset('assets/wh3.jpeg',fit:BoxFit.cover,)
                  ),
                  SizedBox(
                      height:30
                  ),
                  // CustomTextFormField(
                  //   // controller: controller.email,
                  //     text: "E_mail",
                  //     hint: "dev@yahoo.com",
                  //     onSave: (value) {
                  //       //   controller.email = value;
                  //       controller.email=value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  // SizedBox(height: 20),
                  // CustomTextFormField(
                  //   // controller: controller.pass1,
                  //     text: "Password",
                  //     hint: "************",
                  //     onSave: (value) {
                  //       controller.password = value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  SizedBox(
                      height:11
                  ),
                  CustomTextFormField(
                    obs: true,
                      text: "Code",
                      //controller: controller.code1,
                      hint: "************",
                      onSave: (value) {
                        controller.code= value;
                      },

                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }

                        // if(value!="123456"){
                        //   print("error");
                        // }
                      }),
                  SizedBox(height: 8),

                  SizedBox(height: 20),
                  SizedBox(
                      height:20
                  ),
                  InkWell(
                    child:Container(
                      width:190,
                      child: Card(
                        color: HexColor("#ff68682A"),
                        child: Center(
                          child: Text("دخول ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                          ),),
                        ),
                      ),
                    ),
                    onTap:(){


                      _formKey.currentState.save();
                      final box = GetStorage();
                      if(controller.code=='LU1AAbb'||controller.code=='LU2AaBb'||controller.code=='LU3AaBB'
                      ||controller.code=='LU4aaBB'||controller.code=='LU5aAbb'||controller.code=='LU6AAAB'||
                          controller.code=='LU7AAABBB'|| controller.code=='123456XXXYYYZZZ'||
                          controller.code=='LU8AaaBbb'||controller.code=='LU9ABab'||controller.code=='LU10aAbB'||
                          controller.code=='LU11ABAba'||
                          controller.code=='LU12Aabb'||controller.code=='LU13bbaa'||controller.code=='LU14bbAA'||
                          controller.code=='LU15AbbAb'||
                          controller.code=='LU16aaAb'||controller.code=='LU17AAAA'||controller.code=='LU18bbbb'||
                          controller.code=='LU19BBBB'
                        || controller.code=='LU20aaaa'||controller.code=='LU21DDDD'||controller.code=='LU22CCCC'||
                          controller.code=='LU23ffff'
                        || controller.code=='LU24FFFF'||controller.code=='LU25RRRR'|| controller.code=='LU26KKKK'||
                          controller.code=='LU27AACC'||controller.code=='LU28AADD'||controller.code=='LU29AAWW'||
                          controller.code=='LU678io632' || controller.code=='LU75m1wx8c1'||controller.code=='LU006yc2w1z'||
                          controller.code=='LU123ewr4g0l' || controller.code=='LU12c3v4b5zc'|| controller.code=='LUm8n7b5v3x1' ||
                          controller.code=='LU12wer4tynz5'|| controller.code=='LUq2w3c9m00j'|| controller.code=='LU1xzcv65bnp'||
                          controller.code=='LUn1s3f8r44z'|| controller.code=='LUw7u7i99kz'||controller.code=='LU098jt4z'||
                          controller.code=='LU16yn88i10x' || controller.code=='LUx44t6y7un0'|| controller.code=='LU155u7n12x'||
                          controller.code=='LU120ii8un4'||controller.code=='LU0l9m7bx1'|| controller.code=='LU1112340h6'||
                          controller.code=='LU89713ecx'|| controller.code=='LU876ynh12z'|| controller.code=='LU0o9kn8jj7'||
                          controller.code=='LU109o8im776h'|| controller.code=='LU10p8n5y6z'|| controller.code=='LU8o90l4zx2')


                      {
                        if (_formKey.currentState.validate()){

                          Get.off(OwnerHomeView(
                            email:email,
                            pass: pass,
                            code:controller.code
                          ));
                          final box1=box.write('code', controller.code);
                          //controller.signInWithEmailAndPassword();
                        }
                      }
                      else{
                        Get.snackbar('خطا', 'ادخلت كود خاطئ',
                        );
                      }


                      //Get.to(OwnerHomeView());
                    },
                  ),
                  SizedBox(
                      height:20
                  ),
                  InkWell(
                    child:Container(
                      width:190,
                      child: Card(
                        color: HexColor("#ff68682A"),
                        child: Center(
                          child: Text("طلب اضافة متجرك ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                          ),),
                        ),
                      ),
                    ),
                    onTap:(){
                    Get.to(  OwnerRequest());
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }



}