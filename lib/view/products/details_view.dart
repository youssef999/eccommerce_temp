//
//   import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'package:ecommerce/constants/const.dart';
// import 'package:ecommerce/model/cart_product_model.dart';
// import 'package:ecommerce/model/product_moidel.dart';
// import 'package:ecommerce/view/cart/saveOrder.dart';
// import 'package:ecommerce/view/widgets/custom_button.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../../viewmodel/cart_viewmodel.dart';
// import '../widgets/custom_text.dart';
//
// class DetailsView extends StatefulWidget {
//
//  ProductModel model;
//
//  DetailsView({this.model});
//
//   @override
//   State<DetailsView> createState() => _DetailsViewState();
// }
//
// class _DetailsViewState extends State<DetailsView> {
//  DateTime now = DateTime.now();
//
//  int index=0;
//  String lg = '';
//
//
//  @override
//  void initState() {
//
//
//    final box = GetStorage();
//    final box_country=box.read('country')??'x';
//
//    if(box_country=='امارات'){
//      lg ='';
//    }
//    if(box_country=='البحرين'){
//      lg='';
//    }
//    if(box_country=='قطر'){
//      lg='';
//    }
//    if(box_country=='سلطنة عمان'){
//      lg='ر.ع';
//    }
//
//    if(box_country=='كويت'){
//      lg='د.ك';
//    }
//    if(box_country=='السعودية'){
//
//      lg='ر.س' ;
//    }
//    if(box_country=='x'){
//      lg='ر.س' ;
//    }
//    super.initState();
//  }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     // Sqflite.devSetDebugModeOn(true);
//      WidgetsFlutterBinding.ensureInitialized();
//     return Scaffold(
//       body: GetBuilder<HomeViewModel>(
//         builder: (controller)=> Container(
//           child:Column(
//             children:[
//               SizedBox(
//                 height:30,
//               ),
//               Container(
//                   width:MediaQuery.of(context).size.width,
//                   height:180,
//                   child: Image.network(widget.model.image,fit:BoxFit.fitHeight)),
//               SizedBox(
//                   height:15
//               ),
//
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Container(
//                     padding:EdgeInsets.all(17),
//                     child: Column(
//                       children: [
//
//                         Custom_Text(
//                           text:widget.model.name.toString(),
//                           fontSize:26,
//                         ),
//
//                         SizedBox(
//                             height:15
//                         ),
//
//                         SizedBox(
//                           height:20,
//                         ),
//
//                         Custom_Text(
//                           text:'  '+widget.model.x.toString(),
//                           color:Colors.red,
//                           fontSize:18,
//                         ),
//
//                         SizedBox(
//                           height:20,
//                         ),
//
//                         Custom_Text(
//                           text:'تفاصيل  ',
//                           fontSize:18,
//                           color: HexColor("#ff68682A"),
//                         ),
//                         SizedBox(
//                           height:20,
//                         ),
//                         Text(
//                           widget.model.des,
//                           style:TextStyle(color:Colors.black,fontSize:16)
//                         ),
//                         SizedBox(
//                           height:20,
//                         ),
//
//
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(3.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Custom_Text(
//                           text:"السعر",
//                           fontSize:18,
//                           color:Colors.grey,
//                         ),
//                         Row(
//                           children: [
//
//                             SizedBox(
//                               width:5
//                             ),
//                             Custom_Text(
//                               text:lg,
//                               color: Colors.green,
//                               fontSize:18,
//
//                             ),
//                             SizedBox(
//                                 width:5
//                             ),
//                             Custom_Text(
//                               text:'  '+widget.model.price.toString(),
//                               color: Colors.green,
//                               fontSize:18,
//
//                             ),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                     SizedBox(
//                       width:55
//                     ),
//
//                    GetBuilder<CartViewModel>(
//                    init:CartViewModel(),
//                      builder:(controller)
//                      =>
//           Container(
//             width:130,
//             height:80,
//
//             child: CustomButton(
//                 text:' اضف',
//                 onPressed:(){
//                   print("ttt");
//                   print(widget.model.name);
//                   controller.addProduct2(
//                     CartProductModel
//                       (
//                       name:widget.model.name,image:widget.model.image,
//                       price:widget.model.price.toString(),quantity: 1,
//                        productId:widget.model.productId,
//                     ),
//                         widget.model.productId,
//
//                   );
//                 }
//             )),
//                    ),
//                   ],
//                 ),
//               ),
//             ]
//           )
//         ),
//       )
//     );
//   }
// }
