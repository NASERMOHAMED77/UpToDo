import 'package:firee/pages/auth/start_page/start_page.dart';
import 'package:firee/pages/auth/frist_open/model/frist_open_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstOpenScreen extends StatefulWidget {
  const FirstOpenScreen({super.key});

  @override
  State<FirstOpenScreen> createState() => _FirstOpenScreenState();
}

class _FirstOpenScreenState extends State<FirstOpenScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<FirstOpenModel> contents = <FirstOpenModel>[
      FirstOpenModel(
        image: 'assets/icons/onbording1.svg',
        text: 'Manage your tasks',
        description:
            'You can easily manage all of your daily tasks in DoMe for free',
      ),
      FirstOpenModel(
          image: 'assets/icons/onbording3.svg',
          text: 'Create daily routine',
          description:
              'In Uptodo  you can create your personalized routine to stay productive'),
      FirstOpenModel(
          image: 'assets/icons/onbording2.svg',
          text: 'Orgonaize your tasks',
          description:
              'You can organize your daily tasks by adding your tasks into separate categories'),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SvgPicture.asset(
                        contents[index].image,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            contents[index].text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 35),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              contents[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.80),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
          ),
          FristOpenBottom(
              controller: _controller,
              currentIndex: currentIndex,
              contents: contents)
        ]),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}

class FristOpenBottom extends StatelessWidget {
  const FristOpenBottom({
    super.key,
    required PageController controller,
    required this.currentIndex,
    required this.contents,
  }) : _controller = controller;

  final PageController _controller;
  final int currentIndex;
  final List<FirstOpenModel> contents;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              _controller.previousPage(
                duration: const Duration(milliseconds: 150),
                curve: Curves.bounceInOut,
              );
            },
            child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 90,
                child: Text(
                  'Back',
                  style: TextStyle(color: Colors.white.withOpacity(.44)),
                )),
          ),
          SizedBox(
            height: 48,
            width: currentIndex == contents.length - 1 ? 150 : 90,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StartPage(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.bounceInOut,
                );
              },
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
