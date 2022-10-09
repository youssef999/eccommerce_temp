
import 'package:ecommerce/view/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoOrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        toolbarHeight: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 120),
              Container(
                  height: 270,
                  width: 330,
                  child: Image.asset('assets/order histor.png')),
              Container(
                  // child: Text("No order yet",
                  //     style: TextStyle(
                  //         color: Colors.black87,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w800)),
                  ),
              SizedBox(height: 60),
              Container(
                height: 50,
                width: 270,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    child: Text(
                      "Order now",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Get.off(MainPage());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
