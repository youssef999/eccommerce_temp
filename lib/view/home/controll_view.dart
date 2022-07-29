import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/phone_auth/login.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/login_view.dart';



class ControlView extends StatelessWidget {
  int  id;
  ControlView({this.id});

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: Get.find(),
              //ControlViewModel(),
              builder: (controller) => Scaffold(
                body: //HomeView(),
                controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/home1.jpg',
                    fit: BoxFit.contain, width: 30),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Category"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/cat.jfif',
                    fit: BoxFit.contain, width: 30),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Cart"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/m2.png',
                    fit: BoxFit.contain, width: 30),
              )),



          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Account"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/m1.png',
                    fit: BoxFit.contain, width: 30),
              ))
        ],
        currentIndex: controller.navigotorValue,
        onTap: (index) {

          //   Get.find<AuthViewModel>().user==null
          // print("emmm = "+ controller. _user);
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: primaryColor,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
