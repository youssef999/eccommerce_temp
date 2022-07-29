

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


 class OneSignalScreen extends StatefulWidget {
   const OneSignalScreen ({Key key}) : super(key: key);

  @override
  State<OneSignalScreen> createState() => _OneSignalState();
}


class _OneSignalState extends State<OneSignalScreen> {
  String subtitle = '';
  String content = '';
  String data = '';

   @override
  void initState() {

     super.initState();

     OneSignal.shared.setNotificationReceivedHandler((OSNotification notification) {
       setState(() {
         subtitle = notification.payload.subtitle;
         content = notification.payload.body;
         data = notification.payload.additionalData['data'];
       });
     });

     OneSignal.shared
         .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
       print('Notification Opened');
     });

     OneSignal.shared.getPermissionSubscriptionState().then((state) {
       print('state: $state');
       // DocumentReference ref = FirebaseFirestore.instance
       //     .collection('users')
       //     .doc(FirebaseAuth.instance.currentUser.uid);
       //
       // ref.update({
       //   'osUserID': '${state.subscriptionStatus.userId}',
       // });
     });




  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
          children: [
            Text(subtitle??""),
            Text(content??""),
            Text(data??""),
            RaisedButton(onPressed: (){

               _sendNotification();
            })
          ],

       ),

     );
   }

  _sendNotification() async {

    var deviceState = await OneSignal.shared.getPermissionSubscriptionState();
    var userID = deviceState.subscriptionStatus.userId;
     print("kkk");
    OneSignal.shared.postNotification(OSCreateNotification(
      additionalData: {
        'data': 'this is our data',
      },
      subtitle: 'Flutter in depth',
      playerIds: [userID],
      //['56ZK68nccxeqXaJl0Qgvba9cfTQ2'],
      content: 'New series lessons ',
    ));
  }
}
