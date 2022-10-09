import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/services/firestore_user.dart';
import 'package:ecommerce/view/home/main_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:get_storage/get_storage.dart';



class AuthViewModel extends GetxController {

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email, password, name, phone, codeV, code;
  String country, city, details, mobile, brand_name, cat;
  var verificationId;
  Rx<User> _user = Rx<User>();
  get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }





  void signInWithEmailAndPassword() async {
    final box = GetStorage();

    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          setUser(UserModel.fromJson(value.data()));
          print("Userr = " + _user.toString());
        });
      });

      box.write('email', email);
      box.write('pass', password);
      box.write('name', email);


      Get.offAll(MainPage());


    } catch (e) {
      Get.snackbar("Error login Acoount", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithEmailAndPasswordasAguest() async {
    final box = GetStorage();
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: 'test@gmail.com', password: '123456')
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          setUser(UserModel.fromJson(value.data()));
          print("Userr = " + _user.toString());
        });
      });

      box.write('email', email);
      box.write('pass', password);
      box.write('name', email);

      final box_country = box.read('country') ?? "x";

      Get.offAll(MainPage());
      // if(box_country=='x'){
      //   Get.offAll(CountryView());
      // }
      // else{
      //   Get.offAll(ControlView());
      // }

    } catch (e) {
      Get.snackbar("Error login Acoount", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    final box = GetStorage();
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) async {
        //saveUser(user);
        final box1 = box.write('email', email);
        final box2 = box.write('pass', password);
        final box3 = box.write('name', name);
      });

      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      final box_country = box.read('country') ?? "x";
      Get.offAll(MainPage());
      if (box_country == 'x') {
        // Get.offAll(CountryView());
      } else {
        Get.offAll(MainPage());
      }
    } catch (e) {
      Get.snackbar("Error login Acoount", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithPhoneAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        //saveUser(user);
      });

      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
      });
      Get.offAll(MainPage());
    } catch (e) {
      Get.snackbar("Error login Acoount", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          print("ppp" + phoneAuthCredential.toString());
        },
        verificationFailed: (verificationFailed) async {
          print("ppp" + verificationFailed.toString());
        },
        codeSent: (verficationId, resendingToken) async {
          this.verificationId = verficationId;
          update();
          print("sss=" + verficationId);
        },
        codeAutoRetrievalTimeout: (verificationId) async {});

    //Get.to(VerifyOtp());
  }

  Future sendCodeToFireBase(String code) async {
    if (this.verificationId != null) {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);

      await _auth
          .signInWithCredential(credential)
          .then((value) {
            Get.to(MainPage());
          })
          .whenComplete(() {})
          .onError((error, stackTrace) {
            print("error");
          });
    }
  }

  void ResetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        Get.to(MainPage());
        Get.snackbar('تم',
            'ارسلنا لك رابط علي الايميل تستطيع اعادة كلمة المرور من خلاله',
            backgroundColor: Colors.lightGreen,
            colorText: Colors.white,
            duration: Duration(seconds: 10));
      });
    } on FirebaseAuthException catch (e) {
      print("PPP" + e.code);
      // print("eeee="+e.message);

      Get.snackbar('!!!!!', 'تاكد من ان هذا الايميل صحيح و مسجل داخل Luban',
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
          duration: Duration(seconds: 10));
// show the snackbar here
    }
    //   _auth.sendPasswordResetEmail(email: email);
  }

  // Future<void> saveUser(UserCredential user) async {
  //   UserModel userModel = UserModel(
  //     user.user!.uid,
  //     user.user!.email,
  //     name == null ? user.user.displayName : name,
  //     " ",
  //   );
  //   await FireStoreUser().addUserToFireStore(userModel);
  //   setUser(userModel);
  // }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  ownerSendRequest() async {
    if (name != "" &&
        email != "" &&
        country != "" &&
        city != null &&
        cat != "" &&
        mobile != "" &&
        details != "") {
      FirebaseFirestore.instance.collection('send_requests').doc().set({
        'brand_name': brand_name,
        'brand_email': email,
        'country': country,
        'city': city,
        'category': cat,
        'mobile': mobile,
        'details': details
      });

      Get.offAll(MainPage());

      Get.snackbar('تم ارسال طلبك بنجاح ',
          ' انتظر ردنا علي الايميل او هاتفك خلال الايام القادمة ',
          colorText: Colors.white, backgroundColor: Colors.deepOrange);
    } else {
      Get.snackbar(' خطا', 'تاكد من ادخال جميع البيانات بشكل صحيح',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
