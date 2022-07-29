

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

import 'custom_text.dart';

class CustomFormField extends StatelessWidget {

  final String text;
  final String hint;
  final Function onSave;
  final Function validator;
  final TextEditingController controller;
  final Color color;
  CustomFormField({this.text,
    this.hint,
    this.onSave,
    this.controller,
    this.validator,
    this.color,
  }
      ) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Column(
            children:[
              Custom_Text(
                  text:text,fontSize: 14,color:Colors.grey[600]
              ),

              TextFormField(

                onSaved: onSave,
                validator:validator ,
                controller: controller,
                textAlign:TextAlign.end,
                decoration: InputDecoration(
                  hintText:hint,
                  hintStyle: TextStyle(color:Colors.grey),
                  fillColor:Colors.white,

                ),
              )
            ]
        )
    );
  }
}
