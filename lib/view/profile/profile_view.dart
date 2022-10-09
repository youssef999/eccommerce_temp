import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/check/all_orders_view.dart';
import 'package:ecommerce/view/check/noorders_view.dart';
import 'package:ecommerce/view/profile/update_profile.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.pink,
            toolbarHeight: 6,
          ),
          body: controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/profile.jpg')
                                        //NetworkImage(controller.userModel.pic)
                                        )),
                              ),
                              Column(children: [
                                // Custom_Text(
                                //   text: controller.userModel.email ?? '',
                                //   color: Colors.black,
                                // ),
                                // SizedBox(height: 10),
                                // Custom_Text(
                                //   text: controller.userModel.email ?? '',
                                // ),
                              ])
                            ],
                          )),
                        ),
                        SizedBox(height: 50),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              Get.to(UpdateProfile());
                            },
                            child: ListTile(
                                title: Custom_Text(
                                  text: "Change your password",
                                  fontSize: 16,
                                ),
                                leading: SvgPicture.asset(
                                  'assets/password-reset-icon.svg',
                                  width: 30,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.pinkAccent,
                                )),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            child: ListTile(
                                title: Custom_Text(
                                  text: "Language",
                                  fontSize: 16,
                                ),
                                leading: SvgPicture.asset(
                                  'assets/language-icon.svg',
                                  width: 30,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.pinkAccent,
                                )),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              final box = GetStorage();
                              final box_order = box.read('ordernum1') ?? "x";
                              if (box_order == 'x') {
                                Get.to(NoOrdersView());
                              } else {
                                print("order:::" + controller.userModel.email);
                                Get.to(AllOrdersView(
                                  user: controller.userModel.email,
                                ));
                              }
                            },
                            child: ListTile(
                                title: Custom_Text(
                                  text: "Order history",
                                  fontSize: 16,
                                ),
                                leading: SvgPicture.asset(
                                  'assets/my-orders-icon.svg',
                                  width: 30,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.pinkAccent,
                                )),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              controller.signOut();
                              Get.offAll(LoginView());
                            },
                            child: ListTile(
                                title: Custom_Text(
                                  text: "Log out",
                                  fontSize: 16,
                                ),
                                leading: SvgPicture.asset(
                                  'assets/logout-icon.svg',
                                  width: 27,
                                  color: Colors.black,
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.pinkAccent,
                                )),
                          ),
                        )
                      ],
                    ),
                  )),
                )),
    );
  }
}
