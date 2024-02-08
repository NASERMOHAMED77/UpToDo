// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_final_fields, unused_field, unnecessary_null_comparison
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:firee/core/theme/constant.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController categoryController = TextEditingController();
  late IconData myObject;
  var id;
  int? color;
  String? icon;
  int currentIndex = 0;
  List<int> kColors = const [
    (0xffC9CC41),
    (0xff66CC41),
    (0xff4181CC),
    (0xff41A2CC),
    (0xffCC8441),
    (0xff9741CC),
    (0xffCC4173),
    (0xfFF28585),
    (0xfFE0CCBE),
    (0xfFD04848),
    (0xfF492E87),
  ];
  @override
  void initState() {
    super.initState();
    id = Random().nextInt(15);
    setState(() {});
  }

  static List<String> icons = [
    'https://www.svgrepo.com/show/527753/home.svg',
    'https://www.svgrepo.com/show/525653/bag.svg',
    'https://www.svgrepo.com/show/500449/university.svg',
    'https://www.svgrepo.com/show/486919/work-case.svg',
    'https://www.svgrepo.com/show/489305/gym.svg',
    'https://www.svgrepo.com/show/522194/movie-recorder.svg',
    'https://www.svgrepo.com/show/525945/health.svg',
    'https://www.svgrepo.com/show/532708/music.svg',
    'https://www.svgrepo.com/show/501997/illustrationmajor.svg',
  ];
  TextEditingController _categorycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Create new category',
              style: TextStyles().titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Category name :',
              style: TextStyles().subTitleStyle1,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: categoryController,
              decoration: const InputDecoration(hintText: 'Category name'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Category icon :',
              style: TextStyles().subTitleStyle1,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                pickIconMethod(context);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.white.withOpacity(.22))),
              child: const Text(
                "Create Category",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Category color :',
              style: TextStyles().subTitleStyle1,
            ),
            const SizedBox(
              height: 10,
            ),
            pickColor(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 170,
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white.withOpacity(.44)),
                      )),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (categoryController.text.trim() == null ||
                          color == null) {
                      } else {
                        FirebaseFirestore.instance
                            .collection('category')
                            .doc(id.toString())
                            .set({
                          'category': categoryController.text.trim(),
                          'category_color': color,
                          'category_icon': icon,
                        }).then((value) {
                          var snackBar = SnackBar(
                              content: Text('Category Created Successfully'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    child: const Text(
                      "Create Category",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox pickColor() {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
                color = kColors[currentIndex];
                print(color);
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> pickIconMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ThemeColors.primary,
          title: const Text(
            'Pick an icon',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: Wrap(
            spacing: 5,
            children: <Widget>[
              for (var icon in icons)
                GestureDetector(
                  onTap: () {
                    this.icon = icon;
                    setState(() {});
                  },
                  child: SvgPicture.network(
                    icon,
                    width: 40,
                    color: Colors.white,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final int color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(color),
            ),
          )
        : CircleAvatar(
            radius: 15,
            backgroundColor: Color(color),
          );
  }
}
