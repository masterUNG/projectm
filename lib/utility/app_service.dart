import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projectm/models/user_model.dart';
import 'package:projectm/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> findCurrentLogin() async {
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var documentSnapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();
      UserModel model = UserModel.fromMap(documentSnapshot.data()!);

      appController.currentUserModels.add(model);
    }
  }
}
