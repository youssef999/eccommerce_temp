import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/services/database/cart_database_helper2.dart';
import 'package:ecommerce/view/check/last_view.dart';
import 'package:ecommerce/view/check/order_status.dart';
import 'package:ecommerce/view/check/order_status2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CheckOutViewModel extends GetxController {
  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  DeleteProducts2(CartProductModel cartProductModel, String productId) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.Delete(cartProductModel);
    print("delete Done");
//    _cartProductModel.add(cartProductModel);
    _totalPrice = 0;
    _cartProductModel = [];
    update();
  }


  void checkout(
      String country,String city,
      String address, String apartment, String floor, String mobile,
      num total, List<CartProductModel> order, num sub_total,
      String brand_email,String brand, String notes,double lat,double long,

      )
  async {
    String  pr, pr1, pr2, pr3, pr4, pr5, pr6, pr7, pr8, pr9, pr10;
    int  q, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    String order_id;
  String  color,color2,color3,color4,color5,color6,color7,color8,color9,color10;
  String  size,size2,size3,size4,size5,size6,size7,size8,size9,size10;
    
    DateTime now = DateTime.now();

    String time = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

    Timestamp time2 = Timestamp.fromDate(now);



    print("add6666");

    for (int i = 0; i <= order.length; i++) {
      pr = order[0].name ?? "";

      q = order[0].quantity ?? 0;
      if (order.length == 1) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;
        color=order[0].color ?? "";
        size=order[0].size ?? "";
        pr1 = "";
        pr2 = "";
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q2 = 0;
        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }
      if (order.length == 2) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;

        color=order[0].color ?? "";
        size=order[0].size ?? "";


        print("222222222");
        pr1 = order[1].name;
        q1 = order[1].quantity;

        color2=order[1].color ?? "";
        size2=order[1].size ?? "";





        pr2 = "";
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        //  q1 = 0;
        q2 = 0;
        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 3) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;
        color=order[0].color ?? "";
        size=order[0].size ?? "";
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        color2=order[1].color ?? "";
        size2=order[1].size ?? "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        color3=order[2].color ?? "";
        size3=order[2].size ?? "";
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";


        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 4) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;

        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";


        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }


      if (order.length == 5) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";

        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;

        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 6) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;


        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        color6=order[5].color ?? "";
        size6=order[5].size ?? "";

        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 7) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";

        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;


        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        color6=order[5].color ?? "";
        size6=order[5].size ?? "";

        color7=order[6].color ?? "";
        size7=order[6].size ?? "";

        update();
      }

      if (order.length == 8) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";

        pr8 = "";
        pr9 = "";
        pr10 = "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;


        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        color6=order[5].color ?? "";
        size6=order[5].size ?? "";

        color7=order[6].color ?? "";
        size7=order[6].size ?? "";

        color8=order[7].color ?? "";
        size8=order[7].size ?? "";



        update();
      }

      if (order.length == 9) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";
        pr8 = order[8].name ?? "";

        pr9 = '';
        pr10 = '';
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = order[8].quantity ?? 0;


        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        color6=order[5].color ?? "";
        size6=order[5].size ?? "";

        color7=order[6].color ?? "";
        size7=order[6].size ?? "";

        color8=order[7].color ?? "";
        size8=order[7].size ?? "";

        color9=order[8].color ?? "";
        size9=order[8].size ?? "";


        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 10) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";
        pr8 = order[8].name ?? "";
        pr9 = order[9].name ?? "";
        pr10 = "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = order[8].quantity ?? 0;
        q9 = order[9].quantity ?? 0;


        color2=order[1].color ?? "";
        size2=order[1].size ?? "";

        color3=order[2].color ?? "";
        size3=order[2].size ?? "";

        color4=order[3].color ?? "";
        size4=order[3].size ?? "";

        color5=order[4].color ?? "";
        size5=order[4].size ?? "";

        color6=order[5].color ?? "";
        size6=order[5].size ?? "";

        color7=order[6].color ?? "";
        size7=order[6].size ?? "";

        color8=order[7].color ?? "";
        size8=order[7].size ?? "";

        color9=order[8].color ?? "";
        size9=order[8].size ?? "";

        color10=order[9].color ?? "";
        size10=order[9].size ?? "";





        q10 = 0;
        update();
      }



    }

    print("orderL=" + order.length.toString());

  //  print("ppp=" + pr3);

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.email;




    if (order.length == 1) {



      print("addd: " + address[0]);
      var random = new Random();
      var x = random.nextInt(110);
      print('x=' + x.toString());
      var x2 = random.nextInt(430);
      print('x=' + x.toString());
      var x3 = random.nextInt(1200);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
         'color': color.toString(),
        'size': size.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'ord 1': pr + " x " + q.toString(),
        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'notes':notes,
        'total_amount': sub_total,
         'brand_email':brand_email,
         'brand':brand,
         'lat':lat,
          'long':long,
        'order_id': x.toString() +
              x2.toString()+
            x3.toString()
            // x3.toString() + x2.toString()
            // + x.toString()
      });
      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 2) {
      var random = new Random();
      var x = random.nextInt(1500);
      print('x=' + x.toString());
      var x2 = random.nextInt(90);
      print('x=' + x.toString());
      var x3 = random.nextInt(760);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
           'lat':lat,
          'long':long,
        'notes':notes,
        'username': uid,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),


        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),





        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_id': x3.toString() +
            x.toString()+
            x2.toString()
      });
      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 3) {
      var random = new Random();
      var x = random.nextInt(100);
      print('x=' + x.toString());
      var x2 = random.nextInt(40);
      print('x=' + x.toString());
      var x3 = random.nextInt(9);
      print('x=' + x.toString());
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
           'lat':lat,
          'long':long,
        'notes':notes,
        'username': uid,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),


        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_status': 'pending',
        'order_id': x2.toString() +
            x3.toString()+
            x.toString()
      });
      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 4) {
      var random = new Random();
      var x = random.nextInt(100);
      print('x=' + x.toString());
      var x2 = random.nextInt(920);
      print('x=' + x.toString());
      var x3 = random.nextInt(760);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
        'notes':notes,
        'username': uid,
   'lat':lat,
          'long':long,
        'ord 1': pr +  " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),



        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_status': 'pending',
        'order_id': x2.toString() +
            x2.toString()+
            x3.toString()
      });

      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 5) {
      var random = new Random();
      var x = random.nextInt(700);
      print('x=' + x.toString());
      var x2 = random.nextInt(400);
      print('x=' + x.toString());
      var x3 = random.nextInt(600);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
        'notes':notes,
        'username': uid,
           'lat':lat,
          'long':long,
        'ord 1': pr +  " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4 + " x " + q4.toString(),


        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),





        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_id': x3.toString() +
            x.toString()+
            x3.toString()
      });

      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 6) {
      var random = new Random();
      var x = random.nextInt(190);
      print('x=' + x.toString());
      var x2 = random.nextInt(600);
      print('x=' + x.toString());
      var x3 = random.nextInt(800);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
           'lat':lat,
          'long':long,
        'username': uid,
        'notes':notes,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4 + " x " + q4.toString(),
        'ord 6': pr5 + " x " + q5.toString(),




        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),


        'color6': color6.toString(),
        'size6': size6.toString(),




        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_id': x.toString() +
            x2.toString()+
            x3.toString()
      });

      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 7) {
      var random = new Random();
      var x = random.nextInt(100);
      print('x=' + x.toString());
      var x2 = random.nextInt(400);
      print('x=' + x.toString());
      var x3 = random.nextInt(970);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'notes':notes,
           'lat':lat,
          'long':long,
        'brand_email':brand_email,
        'brand':brand,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4 + " x " + q4.toString(),
        'ord 6': pr5 + " x  " + q5.toString(),
        'ord 7': pr6 + " x " + q6.toString(),


        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),


        'color6': color6.toString(),
        'size6': size6.toString(),

        'color7': color7.toString(),
        'size7': size7.toString(),





        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_id': x2.toString() +
            x2.toString()+
            x2.toString()
      });
      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 8) {
      var random = new Random();
      var x = random.nextInt(2100);
      print('x=' + x.toString());
      var x2 = random.nextInt(40);
      print('x=' + x.toString());
      var x3 = random.nextInt(760);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'brand':brand,
        'username': uid,
        'notes':notes,
           'lat':lat,
          'long':long,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4+ " x " + q4.toString(),
        'ord 6': pr5 + " x  " + q5.toString(),
        'ord 7': pr6 + " x " + q6.toString(),
        'ord 8': pr7 + " x " + q7.toString(),



        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),


        'color6': color6.toString(),
        'size6': size6.toString(),

        'color7': color7.toString(),
        'size7': size7.toString(),

        'color8': color7.toString(),
        'size8': size7.toString(),





        'order_status': 'pending',
        'time': time,
         'time2':time2,
          'x':'x',
        'total_amount': sub_total,
        'order_id': x.toString() +
            x3.toString()+
            x3.toString()
      });

      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 9) {
      var random = new Random();
      var x = random.nextInt(700);
      print('x=' + x.toString());
      var x2 = random.nextInt(12);
      print('x=' + x.toString());
      var x3 = random.nextInt(900);
      print('x=' + x.toString());
      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'notes':notes,
        'brand_email':brand_email,
        'brand':brand,
           'lat':lat,
          'long':long,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4 + " x " + q4.toString(),
        'ord 6': pr5 + " x  " + q5.toString(),
        'ord 7': pr6 + " x " + q6.toString(),
        'ord 8': pr7 + " x " + q7.toString(),
        'ord 9': pr8 + " x " + q8.toString(),




        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),


        'color6': color6.toString(),
        'size6': size6.toString(),

        'color7': color7.toString(),
        'size7': size7.toString(),

        'color8': color7.toString(),
        'size8': size7.toString(),

        'color9': color8.toString(),
        'size9': size8.toString(),











        'order_status': 'pending',
          'x':'x',
        'time': time,
         'time2':time2,
        'total_amount': sub_total,
        'order_id': x2.toString() +
            x3.toString()+
            x3.toString()
        //order.toList(),//order[i].name,
      });

      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }

    if (order.length == 10) {
      var random = new Random();
      var x = random.nextInt(100);
      print('x=' + x.toString());
      var x2 = random.nextInt(400);
      print('x=' + x.toString());
      var x3 = random.nextInt(900);
      print('x=' + x.toString());

      await FirebaseFirestore.instance
          .collection('orders_checkout')
          .doc()
          .set({
        'country':country.toString(),
        'city':city.toString(),
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'notes':notes,
        'brand_email':brand_email,
        'brand':brand,
           'lat':lat,
          'long':long,
        'ord 1': pr + " x " + q.toString(),
        'ord 2': pr1 + " x " + q1.toString(),
        'ord 3': pr2 + " x " + q2.toString(),
        'ord 4': pr3 + " x " + q3.toString(),
        'ord 5': pr4 + " x " + q4.toString(),
        'ord 6': pr5 + " x  " + q5.toString(),
        'ord 7': pr6 + " x " + q6.toString(),
        'ord 8': pr7 + " x " + q7.toString(),
        'ord 9': pr8 + " x " + q8.toString(),
        'ord 10': pr9 + " x " + q9.toString(),
        'ord 11': pr10 + " x " + q10.toString(),

        'color1': color.toString(),
        'size1': size.toString(),

        'color2': color2.toString(),
        'size2': size2.toString(),

        'color3': color3.toString(),
        'size3': size3.toString(),

        'color4': color4.toString(),
        'size4': size4.toString(),

        'color5': color5.toString(),
        'size5': size5.toString(),


        'color6': color6.toString(),
        'size6': size6.toString(),

        'color7': color7.toString(),
        'size7': size7.toString(),

        'color8': color7.toString(),
        'size8': size7.toString(),

        'color9': color8.toString(),
        'size9': size8.toString(),


        'color10': color9.toString(),
        'size10': size9.toString(),



        'order_status': 'pending',
         'x':'x',
        'time': time,
         'time2':time2,
        'total_amount': sub_total,
        'order_id': x3.toString() +
            x2.toString()+
            x.toString()
        // mobile[2] +
            // mobile[8]
        //order.toList(),//order[i].name,
      });
      order_id =  x.toString() +
          x2.toString()+
          x2.toString() +
          x3.toString() + x2.toString()
          + x.toString();
    }
    print("uid=" + uid.toString());
    print("time =" + time.toString());
    final box = GetStorage();
    final box_order=box.write('ordernum1','nummmm');


    //Get.offAll(OrderStatusView2(order_id: order_id,cartmodel:_cartProductModel));
  //  print("order_idddd"+order_id);

    Get.offAll(LastView());
    // Get.offAll(OrderStatus(
    //   order_id: order_id,
    //   cartmodel: _cartProductModel,
    // ));

    print("add999");

  }
}
