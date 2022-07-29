//
// import 'package:ecommerce/view/home/controll_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//         'assets/luban.mp4')
//       ..initialize().then((_) {
//         _controller.play();
//         print("doooone");
//          new Future.delayed(new Duration(seconds:5), ()
//         {
//           print("xxxx");
//           Get.off(ControlView());
//
//         });
//
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//
//       });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//       Scaffold(
//         body:Container(
//           color:Colors.grey[300],
//           child:Column(
//             children: [
//           Container(
//           padding: const EdgeInsets.only(top:140,bottom:50),
//           child: Center(
//             child: Container(
//               color:Colors.red,
//         //    height:510,
//               width:900,
//               height:410,
//               child: AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: <Widget>[
//                     VideoPlayer(_controller,
//
//
//                     ),
//
//                     //ControlsOverlay(controller: _controller),
//                   //  VideoProgressIndicator(_controller, allowScrubbing: true),
//                   ],
//                 ),
//               ),
//             ),
//           ) ),
//             ],
//           )
//         )
//     );
//   }
//
//
// }
