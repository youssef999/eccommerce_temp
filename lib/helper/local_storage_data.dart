

 import 'dart:convert';

import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{


  UserModel get userModel => _userModel;
  UserModel  _userModel;
 // final LocalStorageData localStorageData=Get.find();
  Future<UserModel> get getUser async{
    try{
        UserModel userModel=await getUserData();

             return userModel;
    }catch(e){
      print(e.toString());
      return userModel ;
    }
  }

  
  getUserData() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
  var value=  await prefs.getString(CACHED_USER_DATA);
  return UserModel.fromJson(json.decode(value));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA,json.encode(userModel.toJson()));
  }


   void deleteUser()async{
     SharedPreferences prefs=await SharedPreferences.getInstance();
     await prefs.clear();

   }

//   void getCurrentUser() async{
//     await localStorageData.getUser.then((value){
// _userModel=value;
//     });
//     update();
//   }



}