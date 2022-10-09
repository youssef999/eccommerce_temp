import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final bool obs;
  final Function validator;
  final TextEditingController controller;
  final Color color;
  CustomTextFormField({
    this.text,
    this.hint,
    this.onSave,
    this.obs,
    this.controller,
    this.validator,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Custom_Text(text: text, fontSize: 14, color: Colors.grey[600]),
      TextFormField(
        onSaved: onSave,
        validator: validator,
        //    textDirection:TextDirection.rtl,
        obscureText: obs,
        controller: controller,
        // textAlign:TextAlign.end,

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
        ),
      )
    ]));
  }
}
