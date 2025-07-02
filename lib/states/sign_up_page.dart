import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectm/models/user_model.dart';
import 'package:projectm/states/sign_in_page.dart';
import 'package:projectm/widgets/widget_button.dart';
import 'package:projectm/widgets/widget_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final keyForm = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('สมัครสมาชิค')),

      body: Form(
        key: keyForm,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            WidgetForm(
              controller: nameController,
              labelText: 'ชื่อ :',
              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'กรุณากรอก ชื่อ ด้วยคะ';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 16),

            WidgetForm(
              controller: emailController,
              labelText: 'Email :',

              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'กรุณากรอก Email ด้วยคะ';
                } else if (!(p0!.isEmail)) {
                  return 'กรุณากรอก Email Format';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 16),
            WidgetForm(
              controller: passwordController,
              labelText: 'Password :',

              validator: (p0) {
                if (p0?.isEmpty ?? true) {
                  return 'กรุณากรอก Password ด้วยคะ';
                } else if (p0!.length < 6) {
                  return 'จำนวนคำของ Password ต้องมากกว่า 6';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 16),
            WidgetButton(
              text: 'สมัครสมาชิค',

              onPressed: () async {
                if (keyForm.currentState!.validate()) {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                      .then((onValue) async {
                        UserModel model = UserModel(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          uid: onValue.user!.uid,
                        );

                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc(onValue.user!.uid)
                            .set(model.toMap())
                            .then((onValue)async{

                              await FirebaseAuth.instance.signOut();

                              Get.snackbar('สมัครสมาชิค Success', 'กรุณา ลงชื่อเข้่าใช้งาน');

                              Get.off(SignInPage());
                            });
                      })
                      .catchError((onError) {});
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
