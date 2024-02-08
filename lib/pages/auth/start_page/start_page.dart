import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/auth/login_page/login_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              )),
          const SizedBox(
            height: 70,
          ),
          Column(
            children: [
              const Center(
                child: Text(
                  'Welcome to UpTodo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Please login to your account or create new account to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.75),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle().copyWith(
                          backgroundColor:
                              MaterialStatePropertyAll(ThemeColors.primary),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      color: ThemeColors.secondary)))),
                      child: const Text(
                        'CREATE ACCOUNT',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
          SizedBox(
            height: 70,
          )
        ])),
      ),
    );
  }
}
