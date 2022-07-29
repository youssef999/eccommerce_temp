
// ignore_for_file: unused_import
//import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/view/splash.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_player/video_player.dart';
import 'notification/test_notofication.dart';
import 'viewmodel/cart_viewmodel.dart';
import 'view/home/controll_view.dart';
import 'helper/binding.dart';


// de0be5de-85b0-4fc2-906f-e54e34321515
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init('de0be5de-85b0-4fc2-906f-e54e34321515', iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  },
  );


  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);
  Get.put(ControlViewModel());
  Get.put(CartViewModel());
  await GetStorage.init();
  runApp(MyApp());

}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  VideoPlayerController  _controller;
  @override
  void initState() {
    super.initState();
    // getMessages(){
    //
    //   FirebaseMessaging fcm=FirebaseMessaging;
    //
    //
    //
    //   // fcm.configure(onBackgroundMessage: (Map<String, dynamic> message) async {
    //   //   print("onBackgroundMessage: $message");
    //   //   return;
    //   // }, onMessage: (Map<String, dynamic> message) async {
    //   //   print("onMessage: $message");
    //   //
    //   //   return;
    //   // }, onLaunch: (Map<String, dynamic> message) async {
    //   //   print("onLaunch: $message");
    //   //   return;
    //   // }, onResume: (Map<String, dynamic> message) async {
    //   //   print("onResume: $message");
    //   //   return;
    //   // });
    //   //
    //   //
    //   //
    //   // fcm.configure(onMessage: (message) async {
    //   //   print("msg="+message.toString());
    //   //
    //   // },);
    //
    //
    //
    //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //     RemoteNotification? notification = message.notification;
    //     AndroidNotification? android = message.notification?.android;
    //
    //     // if (notification != null && android != null) {
    //     //   flutterLocalNotificationsPlugin.show(
    //     //       notification.hashCode,
    //     //       notification.title,
    //     //       notification.body,
    //     //       NotificationDetails(
    //     //         android: AndroidNotificationDetails(
    //     //           channel.id,
    //     //           channel.name,
    //     //           channel.description,
    //     //           // TODO add a proper drawable resource to android, for now using
    //     //           //      one that already exists in example app.
    //     //           icon: 'launch_background',
    //     //         ),
    //     //       ));
    //     // }
    //   });
    //   //print(firebaseMessaging.getToken());
    //
    // }
    // _controller = VideoPlayerController.asset(
    //     'assets/ecom.png')
    //   ..initialize().then((_) {
    //     _controller.play();
    //     print("doooone");
        new Future.delayed(new Duration(seconds:5), ()
        {
          print("xxxx");
         // Get.off(notification_test ());
         Get.off(ControlView());

        });
    //
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Binding(),
  debugShowCheckedModeBanner:false,
      home:
      Scaffold(
        backgroundColor: Colors.grey[200],
        //HexColor("#ffE6E3E3"),
          body:Container(
            height:1000,
           // padding:EdgeInsets.only(top:260),
          color:Colors.white,
            //    height:510,
           //   width:900,
           // height:700,
            child:
            Container(
               // width:440,
                child: Image.asset('assets/sp3.png'))
          )
      )
    );
  }
}
//mvvm ----> model View viewModel

