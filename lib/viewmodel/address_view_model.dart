

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViewModel extends GetxController{


  TextEditingController address= TextEditingController();
  TextEditingController apartment= TextEditingController();
  TextEditingController floor= TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController  country= TextEditingController();
  TextEditingController city= TextEditingController();
  TextEditingController codeController= TextEditingController();
  String dropdownValue = '+20';
  bool check=true;
  // TextEditingController floor= TextEditingController();
  // TextEditingController mobile = TextEditingController();


  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => address.clear());
    WidgetsBinding.instance.addPostFrameCallback((_) => apartment.clear());
    super.onInit();
  }


   void addAddress() async{

     print("add6666");
     await FirebaseFirestore.instance.collection('address').doc()
         .set({
       'address': address.text.toString(),
       'apartment': apartment.text.toString(),
       'floor': floor.text.toString(),
       'mobile':mobile.text.toString(),
       'username':'z',

     }
     );
     print("add999");
    }


    void promoCode(){


    if(check == true){

      if(codeController.text.toString() == "1234"){

        print("xxxx");



      }

    }

    }



}