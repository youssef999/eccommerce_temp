//
//
//
// import 'package:ecommerce/view/home/controll_view.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// class ChangeCountry extends StatefulWidget {
//
//
//   @override
//   State<ChangeCountry> createState() => _CountryViewState();
// }
//
// class _CountryViewState extends State<ChangeCountry> {
//
//   String ? _value='';
//
//   @override
//   Widget build(BuildContext context) {
//
//     String x;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   // Colors.white,
//                   Colors.white,
//                   //Colors.lightBlueAccent,
//
//                   // Colors.lightBlueAccent,
//                   Colors.white,
//                 ])),
//             height: 30,
//             child: Center(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                         width: 188
//                     ),
//                     Container(
//                       width:57,
//                       child: Image.asset("assets/wh3.jpeg",
//                           fit:BoxFit.cover
//                       ),
//                     ),
//                     SizedBox(
//                         width: 5
//                     ),
//
//                   ],
//                 ))),
//       ),
//       body:
//
//       Directionality(
//         textDirection:TextDirection.rtl,
//         child: Container(
//             child:Center(
//               child: Column(
//                 //  mainAxisAlignment:MainAxisAlignment.center,
//                 crossAxisAlignment:CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                     //  SizedBox(width:MediaQuery.of(context).size.width * 0.60),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: ' عمان ',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         value:'سلطنة عمان',
//                         activeColor: Colors.green,
//
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//                           setState(() {
//                             _value=value!;
//
//                           });
//
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                     //  SizedBox(width:MediaQuery.of(context).size.width * 0.60),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: 'الكويت ',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         value:'الكويت',
//                         activeColor: Colors.green,
//
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//                           setState(() {
//                             _value=value;
//                           });
//
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                    //   SizedBox(width:MediaQuery.of(context).size.width * 0.67),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: 'امارات',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         value:'امارات',
//                         activeColor: Colors.green,
//
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//
//                           setState(() {
//                             _value=value;
//                           });
//
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                    ///   SizedBox(width:MediaQuery.of(context).size.width * 0.60),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: 'السعودية',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         activeColor: Colors.green,
//
//                         value:'السعودية',
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//
//                           setState(() {
//                             _value=value;
//                           });
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                     //  SizedBox(width:MediaQuery.of(context).size.width * 0.65),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: 'البحرين',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         activeColor: Colors.green,
//
//                         value:'البحرين',
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//
//                           setState(() {
//                             _value=value;
//                           });
//
//                         },
//                       ),
//
//
//                     ],
//                   ),
//
//                   SizedBox(
//                       height:20
//                   ),
//                   Row(
//                     children: [
//                   //    SizedBox(width:MediaQuery.of(context).size.width * 0.67),
//                       Container(
//                         width:70,
//                         child: Custom_Text(
//                           text: 'قطر',
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(width:22),
//                       Radio(
//                         activeColor: Colors.green,
//
//                         value:'قطر',
//                         groupValue:_value,
//                         onChanged:(value){
//                           print("val ==="+value.toString());
//
//                           setState(() {
//                             _value=value;
//                           });
//
//                           //  Get.offAll(ControlView());
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                   SizedBox(
//                       height:12
//                   ),
//
//
//
//                   RaisedButton(
//                       color: HexColor("#ff68682A"),
//                       child:Text("انتقل للرئيسية ",
//                         style:TextStyle(
//                             color:Colors.white,
//                             fontSize:18,
//                             fontWeight:FontWeight.w700
//                         ),
//                       ),
//                       onPressed:(){
//
//                         final box = GetStorage();
//                         final box_country=box.write('country',_value);
//                         print("tt"+_value);
//                         Get.offAll(ControlView());
//                       })
//                 ],
//               ),
//             )
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //  onPressed:(){
// //                       final box = GetStorage();
// //                       final box_country=box.write('country',_value);
// //                       print("tt"+_value);
// //                       Get.offAll(ControlView());
// //                     })