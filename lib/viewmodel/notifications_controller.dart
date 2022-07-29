//
//   import 'package:ecommerce/view/check/noorders_view.dart';
// import 'package:get/get.dart';
//   import 'package:awesome_notifications/awesome_notifications.dart';
//
// class NotificationsController extends GetxController{
//
//
//    void sendNotification(){
//
//      AwesomeNotifications().isNotificationAllowed().then( (isAllowed){
//
//         if(!isAllowed){
//           AwesomeNotifications().requestPermissionToSendNotifications();
//         }
//      });
//
//      AwesomeNotifications().createNotification(content:NotificationContent
//        (id: 1, channelKey:'test_channel',title: 'hh',
//        body: 'hh',
//        // icon: 'assets/acx3.jpg',
//      ));
//
//      AwesomeNotifications().actionStream.listen((action){
//        print("aaaaccccttiiiion"+action.toString());
//        Get.to(NoOrdersView());
//      });
//    }
//
//
// }