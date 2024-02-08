
// ignore: must_be_immutable
import 'package:firee/core/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnFilledElvatedButton extends StatelessWidget {
  UnFilledElvatedButton({
    super.key,
    required this.svg,
    required this.text,
  });
  String svg;
  String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ThemeColors.primary),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  side: BorderSide(color: ThemeColors.secondary)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svg),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyles().subTitleStyle1.copyWith(
                    color: Colors.white.withOpacity(.50), fontSize: 16),
              ),
            ],
          )),
    );
  }
}
