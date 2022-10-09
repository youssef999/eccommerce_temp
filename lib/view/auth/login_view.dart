import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Sign in"),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
            child: ListView(
              children: [
                // Container(
                //     height:120,
                //     width:220,
                //     child:Image.asset('assets/E1.jpg',fit:BoxFit.fill,)
                // ),
                SizedBox(height: 30),
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Row(
                        children: [
                          Custom_Text(
                            text: "Welcome Back",
                            fontSize: 30,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Custom_Text(
                        text: "Sign in to Continue",
                        fontSize: 14,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(height: 70),
                      CustomTextFormField(
                          text: "Email",
                          hint: "Enter your Email",
                          obs: false,
                          onSave: (value) {
                            //   controller.email = value;
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: 30),

                      CustomTextFormField(
                          text: "Password",
                          hint: "Enter your password",
                          obs: true,
                          onSave: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: 15),
                      InkWell(
                        child: Custom_Text(
                          text: "Forget Password",
                          fontSize: 14,
                          color: Colors.pinkAccent,
                          alignment: Alignment.topRight,
                        ),
                        onTap: () {
                          Get.to(ForgetPasswordView());
                        },
                      ),
                      SizedBox(height: 120),
                      CustomButton(
                        onPressed: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            //controller.signInWithPhoneAndPassword();
                            controller.signInWithEmailAndPassword();
                          }
                        },
                        text: "Login",
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.pinkAccent),
                            ),
                          ),
                        ],
                      ),

                    ])),
              ],
            ),
          ),
        ));
  }
}
