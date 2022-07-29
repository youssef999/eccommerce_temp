
import 'package:ecommerce/helper/local_storage_data.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:ecommerce/viewmodel/notifications_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {

     Get.lazyPut(() => AuthViewModel());
     //Get.lazyPut(() => NotificationsController());
     Get.lazyPut(() => ControlViewModel());
     Get.lazyPut(() => HomeViewModel());
     Get.lazyPut(() => CartViewModel());
     Get.lazyPut(() => LocalStorageData());
  }

}