
import 'package:ecommerce/view/home/main_home.dart';
import 'package:ecommerce/view/locale/locale.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:video_player/video_player.dart';
import 'viewmodel/cart_viewmodel.dart';
import 'helper/binding.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init(
    'de0be5de-85b0-4fc2-906f-e54e34321515',
    iOSSettings: {
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
  VideoPlayerController ? _controller;
  @override
  void initState() {
    super.initState();

    new Future.delayed(
        new Duration(
          seconds: 5,
        ), () {
      print("xxxx");
      // Get.off(notification_test ());
      Get.off(MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: Get.deviceLocale,
        translations: MyLocale(),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[200],
            body: Container(
                height: 1000,
                color: Colors.white,
                child: Container(
                  // width:440,
                  child: Image.asset('assets/splash.jpg'),
                ))));
  }
}
//mvvm ----> model View viewModel

