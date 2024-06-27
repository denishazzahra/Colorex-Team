import 'package:colorex/questionpage/question1.dart';
import 'package:colorex/widget/costum_background2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/costum_button.dart';
import 'question2.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  int currentQuestion = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 1,
            ),
            SvgPicture.asset(vectorColorex, height: 24),
            const SizedBox(
              width: 51,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              const Column(
                children: [
                  SizedBox(
                    height: 156,
                  ),
                  MyBackground2(),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: currentQuestion / 2,
                          backgroundColor: const Color(0xFFe9e9e9),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).cardColor),
                        ),
                        const SizedBox(height: 12),
                        IconButton(
                          onPressed: () {
                            previousPage();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFFA1A1A1),
                          ),
                          iconSize: 24,
                          splashRadius: 24,
                          visualDensity: VisualDensity.compact,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Row(
                      children: [
                        Text(
                          currentQuestion == 1
                              ? "Informasi Dasar"
                              : "Preferensi Warna",
                          style: const TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 32),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          currentQuestion == 1
                              ? const Question1()
                              : const Question2(),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyCostumButtton1(
                                buttonColor: Theme.of(context).cardColor,
                                buttonText: 'Next',
                                func: () {
                                  nextPage();
                                },
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void nextPage() {
    if (currentQuestion == 1) {
      setState(() {
        currentQuestion += 1;
      });
    } else {}
  }

  void previousPage() {
    if (currentQuestion == 1) {
      Navigator.pop(context);
    } else {
      setState(() {
        currentQuestion -= 1;
      });
    }
  }
}
