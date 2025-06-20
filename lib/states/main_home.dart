import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectm/states/sign_in_page.dart';
import 'package:projectm/states/sign_up_page.dart';
import 'package:projectm/utility/app_controller.dart';
import 'package:projectm/utility/app_dialog.dart';
import 'package:projectm/widgets/widget_button.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>['หน้าหลัก', 'การจอง', 'แพ็คเกจ', 'บัญชี'];

  var iconDatas = <IconData>[
    Icons.home,
    Icons.calendar_today,
    Icons.dashboard,
    Icons.person,
  ];

  var bodys = <Widget>[
    Text('bodyHome'),
    Text('bodyReceive'),
    Text('bodyPackage'),
    Text('bodyProfile'),
  ];

  List<BottomNavigationBarItem> items = [];

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < bodys.length; i++) {
      items.add(
        BottomNavigationBarItem(icon: Icon(iconDatas[i]), label: titles[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: Text('MainHome')),

        body: bodys[appController.indexBody.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: appController.indexBody.value,
          type: BottomNavigationBarType.fixed,
          items: items,
          onTap: (value) {
            if ((value == 1) || (value == 3)) {
              var user = FirebaseAuth.instance.currentUser;

              if (user == null) {
                //ไม่ได้ Login อยู่

                AppDialog().normalDialog(
                  content: Text('ฟีเจอร์ ตรงนี่ ต้องลงชื่อเข้าใช้งาน'),
                  title: Text('Cannot Working'),
                  firstButton: WidgetButton(text: 'SignIn', onPressed: () {

                    Get.back();

                    Get.to(SignInPage());

                  }),
                  secondButton: WidgetButton(text: 'SignUp', onPressed: () {

                    Get.back();

                    Get.to(SignUpPage());


                  }),
                );
              } else {
                // Login อยู่
                appController.indexBody.value = value;
              }
            } else {
              appController.indexBody.value = value;
            }
          },
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
        ),
      );
    });
  }
}
