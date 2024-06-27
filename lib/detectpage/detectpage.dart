import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:colorex/widget/costum_button.dart';

class MyResultPage extends StatelessWidget {
  const MyResultPage({super.key, required this.output, required this.image});
  final File image;
  final String output;

  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  final List<int> winterPallete1 = const [
    0xff131413,
    0xff890c58,
    0xffaa0061,
    0xffce0037,
    0xffe3006d,
    0xffda1884,
  ];
  final List<int> winterPallete2 = const [
    0xff484a51,
    0xff004b87,
    0xff0057b8,
    0xff0072ce,
    0xff0086d6,
    0xff0082ba
  ];
  final List<int> springPallete1 = const [
    0xffffa38b,
    0xfffdaa63,
    0xffff8f1c,
    0xffff8200,
    0xffa6631b,
    0xffb46a55,
  ];
  final List<int> springPallete2 = const [
    0xff6dcdb8,
    0xff2dccd3,
    0xff00a499,
    0xff009f4d,
    0xff6cc24a,
    0xff74aa50
  ];
  final List<int> summerPallete1 = const [
    0xff003057,
    0xff484a51,
    0xff006f62,
    0xff007681,
    0xffef60a3,
    0xffe31c79,
  ];
  final List<int> summerPallete2 = const [
    0xff7965b2,
    0xff0077c8,
    0xff57728b,
    0xff71c5e8,
    0xff00a9e0,
    0xff00b0b9
  ];
  final List<int> autumnPallete1 = const [
    0xff205c40,
    0xff046a38,
    0xff00778b,
    0xff009f4d,
    0xff00bfb3,
    0xff6bcaba,
  ];
  final List<int> autumnPallete2 = const [
    0xff5c462b,
    0xff9a3324,
    0xff7c4d3a,
    0xff9d4815,
    0xff946037,
    0xffa6631b
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
  Widget build(context) {
    List<int>? color1;
    List<int>? color2;

    switch (output) {
      case 'Autumn':
        color1 = autumnPallete1;
        color2 = autumnPallete2;
        break;
      case 'Winter':
        color1 = winterPallete1;
        color2 = winterPallete2;
        break;
      case 'Spring':
        color1 = springPallete1;
        color2 = springPallete2;
        break;
      case 'Summer':
        color1 = summerPallete1;
        color2 = summerPallete2;
        break;
    }

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.white,
        child: Center(
            child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              'Your Persona',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'LeagueSpartan',
                color: Colors.black,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image(
                  image: FileImage(image),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              '#$output',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                fontFamily: 'LeagueSpartan',
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: createColors(color1!),
            ),
            Row(
              children: createColors(color2!),
            ),
            const SizedBox(
              height: 24,
            ),
            MyCostumButtton1(
              buttonColor: Theme.of(context).primaryColor, 
              buttonText: 'Continue', 
              func: () {},
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        )),
      ),
    );
  }
}
