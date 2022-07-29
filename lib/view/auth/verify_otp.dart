//
//
//
//
//
// import 'package:ecommerce/view/auth/login_view.dart';
// import 'package:ecommerce/view/home/controll_view.dart';
// import 'package:ecommerce/view/widgets/custom_button.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/view/widgets/custom_textformfield.dart';
// import 'package:ecommerce/viewmodel/auth_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class VerifyOtp extends GetWidget<AuthViewModel> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           leading: GestureDetector(
//             child: Icon(Icons.arrow_back, color: Colors.black),
//             onTap: () {
//                    Get.to(ControlView());
//             },
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
//           child: Form(
//               key: _formKey,
//               child: Column(children: <Widget>[
//
//                 Custom_Text(
//                   text: "Verify Otp",
//                   fontSize: 30,
//                 ),
//
//                 SizedBox(height: 7),
//                 SizedBox(height: 20),
//                 CustomTextFormField(
//                     text: "Enter the Code",
//                     hint: "",
//                     onSave: (value) {
//                       controller.codeV = value;
//                     },
//                     validator: (value) {
//                       if (value == null) {
//                         print("error");
//                       }
//                       if(value.length!=6){
//                         return 'wrong';
//                       }
//                     }),
//
//                 SizedBox(height: 20),
//                 Column(
//                   children: [
//                     CustomButton(
//                       onPressed: () {
//                         _formKey.currentState.save();
//                         if (_formKey.currentState.validate()) {
//                           controller.sendCodeToFireBase(controller.codeV);
//                         }
//                       },
//                       text: "Send Code",
//                     ),
//                     SizedBox(
//                       height:20
//                     ),
//                     InkWell(
//                       child: Custom_Text(
//                          text: 'Resend Code',
//                       ),
//                       onTap:(){
//
//                       },
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20),
//               ])),
//         ));
//   }
// }
