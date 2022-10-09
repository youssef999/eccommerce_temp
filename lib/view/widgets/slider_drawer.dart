import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({Key key}) : super(key: key);

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {


  @override
  Widget build(BuildContext context) {
    final box=GetStorage();
    String name=box.read('name')??"";
    String email=box.read('email')??"";
    return Container(
      color: Colors.pink[500],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: AssetImage("assets/profile.jpg"))),
          ),
          // Text(
          //   "$name",
          //   style: TextStyle(color: Colors.white, fontSize: 20),
          // ),
          Text(
            "$email",
            style: TextStyle(color: Colors.grey.shade200, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
