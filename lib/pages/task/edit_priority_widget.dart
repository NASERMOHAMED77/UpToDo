
import 'package:firee/core/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditTaskPriorityWidget extends StatelessWidget {
  const EditTaskPriorityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/flag.svg',
          width: 30,
          color: Colors.white.withOpacity(.8),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Task Priority :',
          style: TextStyles().subTitleStyle1.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(.8)),
        ),
        const Spacer(),
        Expanded(
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          Text(
                            'Task Priority',
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
                          children: [
                            Expanded(
                              child: GridView.builder(
                                  itemCount: 10,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        color: const Color(0xff272727),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/flag.svg'),
                                            Text(
                                              (index + 1).toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 48,
                                      width: 100,
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(.44)),
                                      )),
                                ),
                                SizedBox(
                                  height: 48,
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Save",
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
              child: const Text(
                'Default',
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
