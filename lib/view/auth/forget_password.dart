import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Forgot Password"),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Get.off(LoginView());
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Custom_Text(
                  text: "Forget Password",
                  fontSize: 30,
                ),
                SizedBox(height: 50),
                CustomTextFormField(
                    text: "Email",
                    obs: false,
                    hint: "Enter your Email",
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("error");
                      }
                    }),
                SizedBox(height: 50),
                CustomButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.ResetPassword();
                    }
                  },
                  text: "Reset Password",
                ),
                SizedBox(height: 20),
              ])),
        ));
  }
}
