import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colorex/widget/costum_button.dart';

import 'package:colorex/widget/costum_background2.dart';

import '../../questionpage/questionpage.dart';

class MySpringResultPage extends StatelessWidget {
  const MySpringResultPage({super.key});
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  final String outfitLink =
      "https://firebasestorage.googleapis.com/v0/b/colorex-37fd5.appspot.com/o/content%2Foutfit%2FAutumn%20Outfit.png?alt=media&token=b2a082fc-2cf5-45bd-8493-cd25f024d468";

  final List<int> autumnOutfit = const [
    0xffeee7dd,
    0xff5d544c,
    0xff00451e,
    0xff1a2624,
  ];

  final List<int> springPalette1 = const [
    0xffFEF8D6, // Dark Brown
    0xffFECC00, // Light Yellow
    0xffFE8200, // Yellow
    0xff009B93, // Bright Orange
    0xff068E39, // Olive
    0xffEE9C77, // Light Coral
    0xffEB5037, // Coral
    0xffE30046, // Red
    0xff927150, // Orange
    0xff6C5589, // Dark Brown
  ];

  // , // 1. Teal
  // , // 2. Green
  // , // 3. Purple
  // , // 4. Brown
  // , // 5. Red
  // , // 6. Coral
  // , // 7. Light Peach
  // , // 8. Yellow
  // , // 9. Orange
  // , // 10. Bright Yellow
  // , // 11. Cream

  final List<int> autumnPalette2 = const [
    0xffa0131c,
    0xff4d3216,
    0xffde4f19,
    0xffd39b21,
    0xff85723a,
    0xff314520,
    0xff0d6f72,
    0xff085173,
    0xff45295a,
    0xff452e42,
  ];

  final List<int> autumnPalette3 = const [
    0xffd4b579,
    0xffd6967c,
    0xffdb7082,
    0xffe19c55,
    0xff82292e,
    0xff94ba91,
    0xff11a27e,
    0xff12839c,
    0xff5292ae,
    0xff535d90,
  ];

  final List<int> autumnPalette4 = const [
    0xffefe3c9,
    0xffc5b486,
    0xffa19fa2,
    0xff6a6f72,
    0xff19516c,
    0xff85723a,
    0xff5c391d,
    0xff5c391d,
    0xff402d1c,
    0xff212f0e,
  ];

  Widget myColorCube(int colorCode) {
    return Expanded(
      child: Container(
          height: 50,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Color(colorCode),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ))),
    );
  }

  List<Widget> createColors(List<int> colorsCode) {
    List<Widget> result = [];

    for (int colorCode in colorsCode) {
      result.add(myColorCube(colorCode));
    }

    return result;
  }

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
      // ignore: prefer_const_constructors
      body: ListView(
        children: [
          Stack(
            children: [
              const Column(
                children: [
                  SizedBox(
                    height: 66,
                  ),
                  MyBackground2(),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 48),
                    child: Row(
                      children: [
                        Text(
                          "Hasil Analisis\nPersonal Colour",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            children: [
                              Text("Your Season is ",
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                  ))
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Spring",
                            style: TextStyle(
                              fontFamily: 'LeagueSpartan',
                              fontSize: 72,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 18),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children:
                                    createColors(springPalette1.sublist(0, 5)),
                              ),
                              Row(
                                children:
                                    createColors(springPalette1.sublist(5, 10)),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                      overflow: TextOverflow.clip,
                                      text: const TextSpan(
                                        style: TextStyle(
                                            color: Colors
                                                .black, // Default text color
                                            fontSize: 12.0,
                                            fontFamily:
                                                "LeagueSpartan" // Default font size
                                            ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                'Kamu cocok banget dengan palet warna ',
                                          ),
                                          TextSpan(
                                            text: 'Spring',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '. Saat kamu bercermin, yang pertama kali menarik perhatian adalah keceriaan yang bersinar dari wajahmu. Kulit, rambut, dan matamu memiliki nuansa cerah yang mirip dengan bunga-bunga yang baru mekar di musim semi.',
                                          ),
                                          TextSpan(
                                            text: "\n\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                'Warna-warna kamu itu segar dan hidup, seperti hari yang cerah dan penuh sinar matahari. Fitur-fitur wajahmu saling melengkapi dan menciptakan harmoni yang indah. Karena warnanya yang begitu terang dan energik, penampilanmu selalu terlihat ceria dan penuh semangat. Kontras yang diciptakan antara fitur-fitur wajahmu sangat seimbang dan memberikan kesan yang memukau.',
                                          ),
                                          TextSpan(
                                            text: "\n\n\n",
                                          ),
                                          TextSpan(
                                            text:
                                                'Penampilanmu memancarkan energi positif dan semangat, membuat setiap orang yang melihatmu merasakan kebahagiaan musim semi. Nuansa yang kamu miliki memberikan kesan alami dan menyegarkan, seolah-olah kamu selalu dikelilingi oleh keindahan alam yang sedang mekar.',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   height: 24,
                              // ),
                              // const Row(
                              //   children: [
                              //     Text(
                              //       "Fashion Recomendation",
                              //       style: TextStyle(
                              //           color:
                              //               Colors.black, // Default text color
                              //           fontSize: 15.0,
                              //           fontFamily:
                              //               "LeagueSpartan" // Default font size
                              //           ),
                              //     ),
                              //   ],
                              // ),
                              // Stack(
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: [
                              //         Container(
                              //           padding: const EdgeInsets.symmetric(vertical: 24),
                              //           height: 250,
                              //           width: 100,
                              //           child: Column(
                              //             children: [
                              //               const SizedBox(height: 24,),
                              //               ...createColors(autumnOutfit)
                              //             ],
                              //           ),
                              //         ),
                              //         const SizedBox(
                              //           width: 6,
                              //         )
                              //       ],
                              //     ),
                              //     Row(
                              //       children: [
                              //         Expanded(
                              //           child: Image.network(
                              //             outfitLink,
                              //             fit: BoxFit.fitWidth,
                              //           ),
                              //         ),
                              //         const SizedBox(
                              //           width: 36,
                              //         )
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 24,
                              // ),
                              // const Row(
                              //   children: [
                              //     Text(
                              //       "Warm",
                              //       style: TextStyle(
                              //         color:
                              //             Colors.black, // Default text color
                              //         fontSize: 15.0,
                              //         fontFamily:
                              //             "LeagueSpartan" // Default font size
                              //         ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette2.sublist(0, 5)),
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette2.sublist(5, 10)),
                              // ),
                              // const SizedBox(
                              //   height: 24,
                              // ),
                              // const Row(
                              //   children: [
                              //     Text(
                              //       "Cool",
                              //       style: TextStyle(
                              //         color:
                              //             Colors.black, // Default text color
                              //         fontSize: 15.0,
                              //         fontFamily:
                              //             "LeagueSpartan" // Default font size
                              //         ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette3.sublist(0, 5)),
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette3.sublist(5, 10)),
                              // ),
                              // const SizedBox(
                              //   height: 24,
                              // ),
                              // const Row(
                              //   children: [
                              //     Text(
                              //       "Neutral",
                              //       style: TextStyle(
                              //         color:
                              //             Colors.black, // Default text color
                              //         fontSize: 15.0,
                              //         fontFamily:
                              //             "LeagueSpartan" // Default font size
                              //         ),
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette4.sublist(0, 5)),
                              // ),
                              // Row(
                              //   children:
                              //       createColors(autumnPalette4.sublist(5, 10)),
                              // ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: MyCostumButtton1(
                                      buttonColor:
                                          Theme.of(context).primaryColor,
                                      buttonText: "Continue",
                                      func: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const QuestionPage()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
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
}
