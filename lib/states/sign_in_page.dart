import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:projectm/utility/app_service.dart';
import 'package:projectm/widgets/widget_button.dart';
import 'package:projectm/widgets/widget_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final keyForm = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ลงชื่อเข้าใช้งาน')),
      body: Form(
        key: keyForm,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            WidgetForm(
              hintText: 'Email :',
              controller: emailController,
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'กรุณากรอก Email ด้วย';
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: 16),

            WidgetForm(
              hintText: 'Password :',
              obscureText: true,
              controller: passwordController,
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'กรุณากรอก Password ด้วย';
                } else {
                  return null;
                }
              },
            ),

            SizedBox(height: 16),

            WidgetButton(
              text: 'ลงชื่อเข้าใช้งาน',
              onPressed: () async {
                if (keyForm.currentState!.validate()) {
                  await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                      .then((onValue) {
                        Get.back();

                        AppService().findCurrentLogin().whenComplete(() {
                          Get.snackbar(
                            'ลงชื่อเข้าใช้งาน Success',
                            'Welcome to mY App',
                          );
                        });
                      })
                      .catchError((onError) {
                        Get.snackbar(
                          onError.code,
                          onError.message,
                          backgroundColor: GFColors.DANGER,
                          colorText: GFColors.LIGHT,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      });
                }
              },
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
