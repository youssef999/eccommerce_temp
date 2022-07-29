

 import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String  text;
  final String  imageName;
  final Function  onPressed;


  CustomButtonSocial({
    this.text,
    this.imageName,
    this.onPressed,
 });

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(12),
        color:Colors.grey.shade50,
      ),
      child: FlatButton(
          onPressed:onPressed,
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10),
          ),
          child:Row(
            children: [
              Container(
                  width:40,
                  child: Image.asset(imageName)),
              SizedBox(
                  width:50
              ),
              Custom_Text(
                text:text,
              ),

            ],
          )
      ),
    );
  }
}
