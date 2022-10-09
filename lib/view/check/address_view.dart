
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/widgets/custom_formfield.dart';
import 'package:ecommerce/viewmodel/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'checkout_screen2.dart';

class AdressScreen extends StatefulWidget {
  num total;
  List<CartProductModel> cartmodel;
  double lat, long;

  AdressScreen({this.total, this.cartmodel, this.lat, this.long});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    print("total" + widget.total.toString());
    print("total" + widget.cartmodel.toString());
    print("total" + widget.lat.toString());
    print("total" + widget.long.toString());
  }

  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.pink,
          toolbarHeight: 10,
        ),
        body: GetBuilder<AddressViewModel>(
          init: AddressViewModel(),
          builder: (controller) => SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  child: Form(
                key: _formKey,
                child: Column(
                    //  crossAxisAlignment:CrossAxisAlignment.baseline,
                    children: [
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 330,
                            child: CustomFormField(
                                controller: controller.country,
                                hint: 'Country',
                                text: '',
                                color: Colors.black,
                                onSave: (value) {
                                  controller.country.text = value;
                                  //    print("ttt ="+controller.country.toString());
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return ("Enter Your Country");
                                  }
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 330,
                            child: CustomFormField(
                                controller: controller.city,
                                hint: 'City',
                                text: '',
                                color: Colors.black,
                                onSave: (value) {
                                  controller.city.text = value;
                                  print("ttt =" + controller.city.toString());
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return ("Enter Your City");
                                  }
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 330,
                            child: CustomFormField(
                                controller: controller.address,
                                hint: 'Street',
                                text: '',
                                color: Colors.black,
                                onSave: (value) {
                                  controller.address.text = value;
                                  //  print("ttt ="+controller.address.toString());
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return ("Enter Your City");
                                  }
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 330,
                            child: CustomFormField(
                              controller: controller.apartment,
                              hint: 'Building Number',
                              text: '',
                              color: Colors.black,
                              onSave: (value) {
                                controller.apartment.text = value;
                              },
                              // validator: (value) {
                              //   if (value == null|| value=='' ){
                              //     return ("Enter apartment ");
                              //   }
                              // }
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            width: 330,
                            child: CustomFormField(
                                controller: controller.floor,
                                hint: 'Home Number',
                                text: '',
                                color: Colors.black,
                                onSave: (value) {
                                  print("lll= " + value);
                                  controller.floor.text = value;
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return ("Enter Your Home Number");
                                  }
                                }),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              children: [
                                SizedBox(width: 40),
                                Padding(
                                  padding: const EdgeInsets.only(top: 28.0),
                                  child: DropdownButton<String>(
                                    value: controller.dropdownValue,
                                    // icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
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
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(width: 11),
                                Container(
                                  // padding:EdgeInsets.only(left:30),
                                  width: 250,
                                  child: CustomFormField(
                                      controller: controller.mobile,
                                      hint: 'Phone Number',
                                      text: '',
                                      color: Colors.black,
                                      onSave: (value) {
                                        controller.mobile.text = value;
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value == '' ||
                                            value.length < 7 ||
                                            value.length > 15) {
                                          return ("Enter Correct Phone Number");
                                        }
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 90),
                      Container(
                        height: 50,
                        width: 270,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.pinkAccent,
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
                              box.write(
                                'Adress_details1',
                                controller.address.text.toString(),
                              );
                              box.write(
                                'Adress_details2',
                                controller.apartment.text.toString(),
                              );
                              box.write(
                                'Adress_details3',
                                controller.floor.text.toString(),
                              );
                              box.write(
                                'Adress_details4',
                                controller.dropdownValue +
                                    controller.mobile.text.toString(),
                              );
                              box.write(
                                'Adress_country',
                                controller.country.text.toString(),
                              );
                              box.write(
                                'Adress_city',
                                controller.city.text.toString(),
                              );
                              box.write(
                                'Lat',
                                widget.lat,
                              );
                              box.write('Long', widget.long);
                              //Get.to(AddressCheck());
                              Get.to(CheckOutScreen2(
                                  controller.country.text.toString(),
                                  controller.city.text.toString(),
                                  controller.address.text.toString(),
                                  controller.apartment.text.toString(),
                                  controller.floor.text.toString(),
                                  controller.dropdownValue +
                                      controller.mobile.text.toString(),
                                  widget.total,
                                  widget.cartmodel,
                                  //brand_email,
                                  //  brandname,
                                  widget.lat,
                                  widget.long));
                            } else {
                              Get.snackbar(
                                  'حدث خطا', 'ادخلت بيانات بطريقة خاطئة');
                            }
                          },
                          child: Text(
                            "Confirm Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
              )),
            ),
          ),
        ));
  }
}
