import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("Sign up"),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Get.off(LoginView());
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Custom_Text(
                    text: "Register your account",
                    fontSize: 30,
                  ),
                  SizedBox(height: 50),
                  CustomTextFormField(
                      text: "Name",
                      obs: false,
                      hint: "Enter your name",
                      onSave: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: 20),
                  // CustomTextFormField(
                  //     text: "E_mail",
                  //     hint: "dev@yahoo.com",
                  //     onSave: (value) {
                  //       controller.email = value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  CustomTextFormField(
                      text: "Email",
                      hint: "Enter your email",
                      obs: false,
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: 20),
                  CustomTextFormField(
                      text: "Password",
                      hint: "Enter your Password",
                      obs: true,
                      onSave: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: 80),

                  CustomButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        // controller.verifyPhoneNumber();
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    text: "Sign up",
                  ),
                  SizedBox(height: 20),
                ])),
          ),
        ));
  }
}
