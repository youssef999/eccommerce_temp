import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  UserModel  _userModel;

  final LocalStorageData localStorageData = Get.find();

  Future<void> signOut() async {

    final box = GetStorage();
    box.remove('country');
    box.remove('name');
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }
}
