import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_check.dart';
import 'package:ecommerce/view/widgets/custom_formfield.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'checkout_screen2.dart';


class AdressScreen extends StatefulWidget {
  //List<>String name;
  num total;
  List<CartProductModel>  cartmodel;
  double lat,long;
  //String address;
  AdressScreen({this.total,this.cartmodel,this.lat,this.long});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
 // String brand_email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {


    // TODO: implement initState
    print("total"+widget.total.toString());
    print("total"+widget.cartmodel.toString());
    print("total"+widget.lat.toString());
    print("total"+widget.long.toString());
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController address3= TextEditingController();

    final box = GetStorage();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              height: 30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.62
                      ),
                      SizedBox(
                          width: 5
                      ),
                    ],
                  ))),
        ),
        body: GetBuilder<AddressViewModel>(
          init:AddressViewModel(),
          builder:(controller)=>
              SingleChildScrollView(
                child: Directionality(
                  textDirection:TextDirection.rtl,
                  child: Container(
                      child:  Form(
                        key: _formKey,
                        child: Column(
                        //  crossAxisAlignment:CrossAxisAlignment.baseline,
                            children:[

                              SizedBox(
                                  height:30
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child:

                                    CustomFormField(
                                        controller:controller.country,
                                        hint: 'الدولة ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {

                                          controller.country.text= value;
                                      //    print("ttt ="+controller.country.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {

                                            return ("ادخل الدولة ");
                                          }
                                        }
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.city,
                                        hint: 'المدينة ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.city.text= value;
                                          print("ttt ="+controller.city.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {

                                            return (" ادخل المدينة ");
                                          }
                                        }
                                    ),
                                  ),

                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.address,
                                        hint: 'عنوان الشارع  ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.address.text= value;
                                        //  print("ttt ="+controller.address.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {

                                          return ("ادخل العنوان  ");
                                          }
                                        }
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.apartment,
                                        hint: 'رقم المبني   ',
                                        text:'',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.apartment .text= value;
                                        },
                                        // validator: (value) {
                                        //   if (value == null|| value=='' ){
                                        //     return ("Enter apartment ");
                                        //   }
                                        // }
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller: controller.floor,
                                        hint: 'رقم الشقة  ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          print("lll= "+value);
                                          controller.floor.text= value;
                                        },
                                        validator: (value) {
                                          if (value == null|| value=='') {

                                            return ("ادخل رقم الشقة  ");
                                          }
                                        }
                                    ),
                                  ),

                                  Directionality(
                                    textDirection:TextDirection.ltr,
                                    child: Row(
                                      children: [

                                        SizedBox(
                                          width:40
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:28.0),
                                        child: DropdownButton<String>(
                                        value: controller.dropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.green,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            controller.dropdownValue = newValue;
                                            print(controller.dropdownValue);
                                          });
                                        },
                                        items: <String>['+20']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    ),
                                      ),
                                        SizedBox(
                                            width:11
                                        ),
                                        Container(
                                         // padding:EdgeInsets.only(left:30),
                                          width:250,
                                          child: CustomFormField(
                                              controller:controller.mobile,
                                              hint: 'رقم الجوال',
                                              text:'',
                                              color:Colors.black,
                                              onSave: (value) {
                                                controller.mobile.text= value;
                                              },
                                              validator: (value) {
                                                if (value == null || value==''|| value.length<7|| value.length>15) {

                                                  return (" ادخل رقم بشكل صحيح");
                                                }
                                              }
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:20
                              ),
                              Container(
                                child: RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                   // print("brand"+brandname);
                                    //print("emmmaill="+brand_email);
                                    //print(cartmodel[3].name);
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      print("add2222");
                                      print("cont" + controller.address.toString());
                                      controller.addAddress();
                                      print("add1111");
                                      box.write('Adress_details1',
                                        controller.address.text.toString(),);
                                      box.write('Adress_details2', controller.apartment.text.toString(),);
                                      box.write('Adress_details3', controller.floor.text.toString(),);
                                      box.write('Adress_details4', controller.dropdownValue+controller.mobile.text.toString(),);
                                      box.write('Adress_country', controller.country.text.toString(),);
                                      box.write('Adress_city', controller.city.text.toString(),);
                                      box.write('Lat', widget.lat,);
                                      box.write('Long',widget.long);
                                       //Get.to(AddressCheck());
                                      Get.to( CheckOutScreen2(
                                          controller.country.text.toString(),
                                          controller.city.text.toString(),
                                          controller.address.text.toString(),
                                          controller.apartment.text.toString(),
                                          controller.floor.text.toString(),
                                          controller.dropdownValue+controller.mobile.text.toString(),
                                          widget.total,
                                          widget.cartmodel,
                                          //brand_email,
                                        //  brandname,
                                          widget.lat,
                                          widget.long
                                      ));
                                    }

                                    else{
                                      Get.snackbar('حدث خطا', 'ادخلت بيانات بطريقة خاطئة');
                                    }
                                  },
                                  child:Text("تاكيد الطلب",style:TextStyle(
                                      color:Colors.white,
                                      fontSize:22),),
                                ),
                              )
                            ]
                        ),
                      )
                  ),
                ),
              ),
        )
    );
  }
}