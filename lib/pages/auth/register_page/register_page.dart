// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firee/core/utils/local_shared_pref.dart';
import 'package:firee/models/note_model.dart';
import 'package:firee/models/user_model.dart';
import 'package:firee/pages/auth/login_page/login_widget/unFilled_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/constant.dart';
import '../login_page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _passwordConfirmcontroller = TextEditingController();
  final _key = GlobalKey<FormState>();
  List users = [];
  @override
  void initState() {
    FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        users.add(element);
        print(users);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
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
                  'Register',
                  style: TextStyles().titleStyle,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyles().subTitleStyle1,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (users
                                  .where((element) =>
                                      element['name'] == value.toString())
                                  .toList()
                                  .length >=
                              1) {
                            return 'This username is used';
                          } else {}
                        },
                        controller: _usernamecontroller,
                        decoration: const InputDecoration(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Password',
                        style: TextStyles().subTitleStyle1,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _passwordcontroller,
                        decoration: const InputDecoration(
                          hintText: '* * * * * * * * * *',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyles().subTitleStyle1,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == _passwordcontroller.text.trim()) {
                            if (value!.length > 7) {
                            } else {
                              return 'This password less than 8';
                            }
                          } else {
                            return 'This password is\'t matched';
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        controller: _passwordConfirmcontroller,
                        decoration: const InputDecoration(
                          hintText: '* * * * * * * * * *',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              UserModel userModel = UserModel(
                                  name: _usernamecontroller.text.trim(),
                                  password:
                                      _passwordConfirmcontroller.text.trim(),
                                  id: 1);
                              if (_key.currentState!.validate()) {
                                NoteModel noteModel = NoteModel(
                                    category: '',
                                    category_color: '',
                                    category_icon: '',
                                    time: '',
                                    title: '',
                                    date: '',
                                    description: '',
                                    completed: false,
                                    id: 0,
                                    priorty: 0);
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(_usernamecontroller.text.trim())
                                    .set(userModel.toMap())
                                    .then((value) {
                                  var snackBar = SnackBar(
                                      content:
                                          Text('Account Created Successfully'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });

                                CacheLocal.insertDataIntoCache(
                                    key: 'token',
                                    value: _usernamecontroller.text.trim());

                                print('done');
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyles().titleStyle.copyWith(
                                  color: Colors.white.withOpacity(.50),
                                  fontSize: 16),
                            )),
                      )
                    ],
                  ),
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
                            builder: (context) => const LoginPage()));
                  },
                  child: Center(
                    child: Text('Already have an account? Login',
                        style:
                            TextStyles().subTitleStyle1.copyWith(fontSize: 15)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
