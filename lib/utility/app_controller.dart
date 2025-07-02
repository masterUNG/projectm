import 'package:get/get.dart';
import 'package:projectm/models/user_model.dart';

class AppController extends GetxController {

  RxInt indexBody = 0.obs;

  RxList<UserModel> currentUserModels = <UserModel>[].obs;
  
}