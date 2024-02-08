// ignore: must_be_immutable
import 'package:firee/core/theme/constant.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody(
      {super.key,
      required this.email,
      required this.pass,
      required this.onpressed});
  TextEditingController email;
  TextEditingController pass;
  Function onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .39,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyles().subTitleStyle1,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'this must\'nt be Empty';
              }
            },
            controller: email,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Enter your Username',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Password',
            style: TextStyles().subTitleStyle1,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'this must\'nt be Empty';
              } else if (value.length < 8) {
                return 'this must\'nt less than 8 characters';
              }
            },
            controller: pass,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: '* * * * * * * * * *',
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  onpressed();
                },
                child: Text(
                  'Login',
                  style: TextStyles().titleStyle.copyWith(
                      color: Colors.white.withOpacity(.50), fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
