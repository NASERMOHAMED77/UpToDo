
import 'package:firee/core/theme/constant.dart';
import 'package:firee/pages/category/category.dart';
import 'package:firee/pages/task/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditTaskCategory extends StatelessWidget {
  const EditTaskCategory({
    super.key,
    required this.widget,
  });

  final TaskPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/tag.svg',
          width: 30,
          color: Colors.white.withOpacity(.8),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Task Category :',
          style: TextStyles().subTitleStyle1.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(.8)),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        Text(
                          'Choose Category',
                          style: TextStyles()
                              .subTitleStyle1
                              .copyWith(color: Colors.white),
                        ),
                        const Divider()
                      ],
                    ),
                    backgroundColor: ThemeColors.third,
                    content: SizedBox(
                      height: 300,
                      width: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryPage()));
                                  },
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xff272727),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Create New',
                                  style: TextStyles().subTitleStyle1.copyWith(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          // ColorsListView(),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(.22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/icons/mortarboard 1.svg',
                  width: 30,
                ),
                Text(
                  widget.note[0]['category'],
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
