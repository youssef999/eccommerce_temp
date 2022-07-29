



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';


class OwnerProductsView extends StatefulWidget {

  String  email;
  OwnerProductsView({this.email});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<OwnerProductsView> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  String lg = '';
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();


  @override
  void initState() {


    final box = GetStorage();
    final box_country=box.read('country')??'x';

    if(box_country=='امارات'){
      lg ='د.ا';
    }
    if(box_country=='البحرين'){
      lg='د.ب';
    }
    if(box_country=='قطر'){
      lg='ر.ق';
    }
    if(box_country=='سلطنة عمان'){
      lg='ر.ع';
    }

    if(box_country=='كويت'){
      lg='د.ك';
    }
    if(box_country=='السعودية'){

      lg='ر.س' ;
    }
    if(box_country=='x'){
      lg='ر.س' ;
    }
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    num price;
    final box_country=box.read('country');
    //Get.lazyPut(() => HomeViewModel());
    final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        backgroundColor: Colors.white,
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
        body:
        Container(
          color: Colors.white,
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),


                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('products')
                       .where('brandemail',isEqualTo:widget.email)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');

                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot posts = snapshot.data.docs[index];

                                  // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)


                                  return Column(
                                    children: <Widget>[
                                      GetBuilder<HomeViewModel>(
                                          init: Get.find(),
                                          builder: (controller) =>
                                              Container(
                                                padding: EdgeInsets.only(left:30,right:30,top:11),
                                                height: 230,
                                                color:Colors.white10,
                                                width: MediaQuery.of(context).size.width / 0.8,
                                                child: InkWell(
                                                  child: Column(
                                                    children: [
                                                      Card(
                                                        //  elevation:30,
                                                        child:
                                                        Column(
                                                          children: [
                                                            Container(
                                                              width:310,
                                                              height:110,
                                                              //backgroundImage: (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                                              child:
                                                              Image.network(posts.data()['image'],
                                                                  fit:BoxFit.fill
                                                              ),

                                                            ),
                                                            SizedBox(
                                                                height:3
                                                            ),

                                                            Container(
                                                              padding: EdgeInsets.only(left:120),
                                                              child: ListTile(
                                                                title: Text(posts.data()['name'],style:TextStyle(fontSize:18),maxLines:2,),
                                                                leading:Text(posts.data()['cat'].toString(),style:TextStyle(fontSize:15,color:Colors.green),),
                                                              )
                                                              //ListTile(
                                                                // leading:  Column(
                                                                //   children: [
                                                                //     Text(posts.data()['name'],style:TextStyle(fontSize:22),),
                                                                //     //    Text(posts.data()['cat'],style:TextStyle(fontSize:13,color:Colors.green),),
                                                                //   ],
                                                                // ),
                                                                // title:Container(
                                                                //     width:70,
                                                                //     height:40,
                                                                //     child: CircleAvatar(
                                                                //       radius:30,
                                                                //       backgroundImage: NetworkImage( posts.data()['image']),
                                                                //     )),


                                                                // Image.network(posts.data()['image'])),
                                                                //Text(posts.data()['name'],
                                                                //   style:TextStyle(color:Colors.red,fontSize:21,fontWeight:FontWeight.w700),),

                                                                //     trailing: Text(" " + posts.data()['class'],style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w500),),
                                                             // ),
                                                            ),



                                                          ],
                                                        ),
                                                      ),
                                                      if(box_country=='السعودية')
                                                        Row(
                                                          children: [

                                                            SizedBox(
                                                                width:2
                                                            ),

                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),),


                                                            SizedBox(
                                                                width:2
                                                            ),
                                                            Text((posts.data()['price']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),
                                                            ),

                                                          ],
                                                        ),

                                                      if(box_country=='قطر')
                                                        Row(
                                                          children: [


                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)

                                                            ,

                                                            SizedBox(
                                                                width:2
                                                            ),
                                                            Text((posts.data()['priceQ']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),
                                                            ),

                                                          ],
                                                        ),


                                                      if(box_country=='كويت')
                                                        Row(
                                                          children: [




                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)

                                                            , SizedBox(
                                                                width:2
                                                            ),

                                                            Text((posts.data()['priceQw']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),

                                                            ),


                                                          ],
                                                        ),

                                                      if(box_country=='سلطنة عمان')
                                                        Row(
                                                          children: [



                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
                                                            , SizedBox(
                                                                width:2
                                                            ),
                                                            Text((posts.data()['priceAm']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),

                                                            ),

                                                          ],
                                                        ),

                                                      if(box_country=='البحرين')
                                                        Row(
                                                          children: [



                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
                                                            ,SizedBox(
                                                                width:2
                                                            ),

                                                            Text((posts.data()['priceBh']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),

                                                            ),

                                                          ],
                                                        ),



                                                      if(box_country=='الكويت')
                                                        Row(
                                                          children: [



                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)
                                                            , SizedBox(
                                                                width:2
                                                            ),
                                                            Text((posts.data()['priceQw']).toString(),
                                                              style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                  fontWeight:FontWeight.bold),

                                                            ),


                                                          ],
                                                        ),
                                                      if(box_country=='امارات')
                                                        Row(
                                                          children: [
                                                            Text(lg,style:TextStyle(color:Colors.green,fontWeight:FontWeight.w600),)

                                                            , SizedBox(
                                                                width:2
                                                            ),
                                                            Text((posts.data()['priceAmar']).toString(),
                                                                style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                                    fontWeight:FontWeight.bold)),

                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                  onTap: () {

                                                  },
                                                ),
                                              )

                                      ),
                                      //  Container(
                                      //    padding: EdgeInsets.only(left:180),
                                      //    child: ListTile(
                                      //      // leading: Image.network(posts.data()['img']),
                                      //      title: Text(posts.data()['name'],
                                      //        style:TextStyle(color:Colors.red,fontSize:21,fontWeight:FontWeight.w700),),
                                      //      subtitle: Container(
                                      //          height:30,
                                      //          child: Text(""  + posts.data()['cat'],style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w500),)),
                                      // //     trailing: Text(" " + posts.data()['class'],style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w500),),
                                      //    ),
                                      //  ),
                                    ],
                                  );
                                });
                        }
                      }),
                ),
                //),
                //  ]),
              ] ),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }
