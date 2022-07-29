

 import 'package:ecommerce/viewmodel/auth_view_model.dart';
 import 'package:flutter/material.dart';
 import 'package:get/get.dart';

 class SecondScreen extends StatelessWidget {

  AuthViewModel viewModel=Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [

          Obx(()
            =>Text('$viewModel.counter.value}'),
          ),
        /*  GetX<AuthViewModel>(
              init:AuthViewModel(),
             builder:(value)=>Text('${value.counter.value}'),
            ),*/

             RaisedButton(
                  onPressed: (){
                   // viewModel.increment();
                  },
              child:Text("Increment"),

          ),
        ],
      ),

    );
  }
}
