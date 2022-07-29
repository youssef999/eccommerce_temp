//
// import 'package:ecommerce/view/auth/login_view.dart';
// import 'package:ecommerce/view/widgets/custom_button.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/view/widgets/custom_textformfield.dart';
// import 'package:ecommerce/viewmodel/auth_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'otp_screen.dart';
//
//
//   class AuthView extends GetWidget<AuthViewModel> {
//
//
//      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
//               Get.off(LoginView());
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
//                   text: "Sign Up",
//                   fontSize: 30,
//                 ),
//
//                 SizedBox(height: 7),
//                 SizedBox(height: 20),
//                 CustomTextFormField(
//                     text: "Name",
//                     hint: "Pesa",
//                     onSave: (value) {
//                       controller.name = value;
//                     },
//                     validator: (value) {
//                       if (value == null) {
//                         print("error");
//                       }
//                     }),
//                 SizedBox(height: 20),
//                 // CustomTextFormField(
//                 //     text: "E_mail",
//                 //     hint: "dev@yahoo.com",
//                 //     onSave: (value) {
//                 //       controller.email = value;
//                 //     },
//                 //     validator: (value) {
//                 //       if (value == null) {
//                 //         print("error");
//                 //       }
//                 //     }),
//                 CustomTextFormField(
//                     text: "Phone",
//                     hint: "01**********",
//                     onSave: (value) {
//                       controller.phone = value;
//                     },
//                     validator: (value) {
//                       if (value == null) {
//                         print("error");
//                       }
//                     }),
//                 SizedBox(height: 20),
//                 CustomTextFormField(
//                     text: "Password",
//                     hint: "************",
//                     onSave: (value) {
//                       controller.password = value;
//                     },
//                     validator: (value) {
//                       if (value == null) {
//                         print("error");
//                       }
//                     }),
//                 SizedBox(height: 20),
//                 // CustomButton(
//                 //   onPressed: () {
//                 //     _formKey.currentState!.save();
//                 //     if (_formKey.currentState!.validate()) {
//                 //       // controller.verifyPhoneNumber();
//                 //      // controller.createAccountWithEmailAndPassword();
//                 //
//                 //       Get.to(OTPScreen(
//                 //         controller.phone
//                 //       ));
//                 //     }
//                 //   },
//                 //   text: "Sign Up",
//                 // ),
//                 SizedBox(height: 20),
//               ])),
//         ));
//   }
// }
