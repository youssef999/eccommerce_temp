



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/notification/notification_home.dart';
import 'package:ecommerce/notification/onesignal.dart';
import 'package:ecommerce/notification/test_notofication.dart';
import 'package:ecommerce/view/brands/brands_view.dart';
import 'package:ecommerce/view/brands/brands_view2.dart';
import 'package:ecommerce/view/cart/cart_view.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/check/all_orders_view.dart';
import 'package:ecommerce/view/check/noorders_view.dart';
import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/owner/owner_check.dart';
import 'package:ecommerce/view/owner/owner_code.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:ecommerce/view/profile/change_country.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math show pi;
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';



class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  List<CollapsibleItem> _items;
  String  _headline;
  NetworkImage _avatarImg =
  NetworkImage('https://www.w3schools.com/howto/img_avatar.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'الرئيسية',
          isSelected: true,
          icon: Icons.home,
          onPressed: ()
          {
             Get.offAll(ControlView());
          }
      ),

      CollapsibleItem(
          text: ' الاقسام ',
          icon: Icons.category_sharp,
    onPressed: ()  async {

             Get.to( CategoryView());
          }
      ),

      // CollapsibleItem(
      //     text: ' المتاجر ',
      //     icon: Icons.shop_outlined,
      //     onPressed: ()  async {
      //       Get.to(PostsScreen());
      //      // Get.to(BrandsView());
      //
      //     }
      // ),

      // CollapsibleItem(
      //     text: '  طلباتي   ',
      //     icon: Icons.note,
      //     onPressed: ()  async {
      //       final box = GetStorage();
      //       final box_name=box.read('email');
      //       final box_order=box.read('ordernum1')??"x";
      //       print("bbb"+box_name);
      //       if(box_order=='x'){
      //
      //         Get.to(NoOrdersView());
      //       }
      //       else{
      //
      //         Get.to(AllOrdersView(user:box_name,));
      //       }
      //     }
      // ),

      CollapsibleItem(
          text: ' سلة المشتريات  ',
          icon: Icons.add_shopping_cart_sharp,
          onPressed: ()  async {

            Get.to(CartView2());

          }
      ),


      // CollapsibleItem(
      //     text: 'صفحتي كتاجر ',
      //     icon: Icons.supervised_user_circle,
      //     onPressed: () {
      //
      //       final box = GetStorage();
      //       final box1= box.read('email')??'x';
      //       final box2= box.read('pass')??'x';
      //       final box3=box.read('code')??'x';
      //
      //       print("box1=="+box1);
      //       print("box3=="+box3);
      //       if(box3=='x'){
      //         Get.to(OwnerCodeView());
      //       }
      //       else{
      //         Get.to(OwnerHomeView(
      //             email:box1,
      //             pass:box2,
      //             code:box3
      //         ));
      //       }
      //     //  Get.to(OwnerCodeView());
      //        //  Get.to(OwnerCheck());
      //     }
      // ),
      //



      CollapsibleItem(
          text: ' notification  ',
          icon: Icons.map,
          onPressed: ()  async {
//home22();
            Get.to( OneSignalScreen());

          }
      ),




      CollapsibleItem(
          text: 'تسجيل خروج ',
          icon: Icons.logout,
          onPressed: ()   {
              signOut();
          }
      ),

    ];
  }

  Future<void> signOut() async {
    final LocalStorageData localStorageData = Get.find();
    final box = GetStorage();
    box.remove('country');
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImg,
        title: '',
        toggleTitle: "Luban",
        body: Container(),
      //  backgroundColor:  Colors.white,

        selectedTextColor: Colors.white,
        selectedIconBox:Colors.transparent,
        sidebarBoxShadow: [
          BoxShadow(
         color: Colors.white,
            blurRadius: 5,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
       // isCollapsed: false,
        textStyle: TextStyle(color:Colors.black,fontSize: 15,
            fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

/* Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }

  */
}
// class getCustomAppBar extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return
//       PreferredSize( preferredSize: Size.fromHeight(50),
//           child:Container(
//             decoration:BoxDecoration(
//                 gradient: LinearGradient(
//
//                 )
//             ),
//           )
//
//
//       );
//   }
//
// }