import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class UpdateProfile extends StatefulWidget {


    String name;
    String email;

    @override
    _UpdateProfileState createState() => _UpdateProfileState();
  }

  class _UpdateProfileState extends State<UpdateProfile> {


    @override
    Widget build(BuildContext context) {
      TextEditingController name=TextEditingController();
      TextEditingController email=TextEditingController();
      TextEditingController password=TextEditingController();
      TextEditingController password_check=TextEditingController();

      User user=FirebaseAuth.instance.currentUser;

       changePawword()async{


           await user.updatePassword(password.text.toString());
           FirebaseAuth.instance.signOut();
           Get.offAll(ControlView());
       }

      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      return Scaffold(
        body:Container(
          child:Form(
            key: _formKey,
            child: Column(
              children: [


                SizedBox(
                    height:70
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    /*border: InputBorder.none,*/
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'ادخل كلمة المرور الجديدة',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(
                    height:30
                ),
                TextFormField(
                  controller: password_check,
                  obscureText: true,
                  decoration: InputDecoration(
                    /*border: InputBorder.none,*/
                    fillColor: Colors.white,
                    filled: true,
                    hintText: ' ادخل كلمة المرور مرة اخري',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),

                SizedBox(height: 40),
                Container(
                  width:120,
                  child: CustomButton(
                    onPressed: () {

                     // _formKey.currentState.save();
                    //  if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(password.toString());

                      if(password_check.text.toString()!=password.text.toString()){
                        Get.snackbar('Error', 'password not match ',
                            snackPosition: SnackPosition.BOTTOM,
                            //backgroundColor: Colors.green,
                            colorText: Colors.black);
                      }

                      else{
                        changePawword();
                      }
                         print("update");
                    //  }
                    },
                    text: "تعديل",
                  ),
                ),
              ],
            ),
          )
        ),

      );
    }
  }
