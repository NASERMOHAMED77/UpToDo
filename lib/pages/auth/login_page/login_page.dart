import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firee/core/theme/constant.dart';
import 'package:firee/core/utils/local_shared_pref.dart';
import 'package:firee/pages/auth/login_page/login_widget/login_body_widget.dart';
import 'package:firee/pages/auth/login_page/login_widget/unFilled_button_widget.dart';
import 'package:firee/pages/auth/register_page/register_page.dart';
import 'package:firee/pages/home/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List users = [];
  @override
  void initState() {
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        users.add(element);
        setState(() {});
      }
    });
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //avoid overflowed
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              Text(
                'Login',
                style: TextStyles().titleStyle,
              ),
              LoginPageBody(
                onpressed: () {
                  if (_key.currentState!.validate()) {
                    if (users
                                .where((element) =>
                                    element['name'] ==
                                    emailController.text.trim())
                                .toList()[0]['name'] ==
                            emailController.text.trim() &&
                        users
                                .where((element) =>
                                    element['password'] ==
                                    passController.text.trim())
                                .toList()[0]['password'] ==
                            passController.text.trim()) {
                      CacheLocal.insertDataIntoCache(
                              key: 'token', value: emailController.text.trim())
                          .then((value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      });
                    } else {
                      var snackBar = const SnackBar(
                          content: Text('name or password wrong'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                email: emailController,
                pass: passController,
              ),
              Stack(
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Positioned(
                    bottom: 2,
                    right: MediaQuery.of(context).size.width * .45,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: ThemeColors.primary,
                        radius: 10,
                        child: const Text(
                          'or',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  UnFilledElvatedButton(
                    svg: 'assets/icons/google.svg',
                    text: 'Login with Google',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  UnFilledElvatedButton(
                    svg: 'assets/icons/apple1.svg',
                    text: 'Login with Apple',
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                },
                child: Center(
                  child: Text('Don’t have an account? Register',
                      style:
                          TextStyles().subTitleStyle1.copyWith(fontSize: 15)),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
