import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectm/firebase_options.dart';
import 'package:projectm/states/main_home.dart';
import 'package:projectm/utility/app_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainHome(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.appColor),
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppConstant.appColor, foregroundColor: Colors.white),


      ),
    );
  }
}
