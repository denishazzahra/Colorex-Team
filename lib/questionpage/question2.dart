import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import 'widgets/widgets.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  final List<String> colors = [
    "Hitam",
    "Putih",
    "Abu muda",
    "Abu tua",
    "Merah terang",
    "Merah gelap",
    "Oranye",
    "Kuning",
    "Hijau muda",
    "Hijau tua",
    "Biru muda",
    "Biru tua",
    "Ungu muda",
    "Ungu tua",
    "Pink pastel",
    "Pink tua",
    "Peach",
    "Cokelat tua",
    "Cokelat muda",
  ];
  TextEditingController hijabController = TextEditingController();
  late GetStorage storage;
  late List<dynamic> answers;
  final List<int> values = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    String username = userDataProvider.userID!;
    storage = GetStorage(username);
    answers = storage.read('question2')?.map((item) {
          if (item is List) return List<bool>.from(item);
          if (item is int) return item;
          if (item is String) return item;
          return item;
        })?.toList() ??
        [
          List<bool>.filled(colors.length, false),
          List<bool>.filled(colors.length, false),
          List<bool>.filled(colors.length, false),
          '',
          1,
          1,
          1,
        ];
    hijabController.text = answers[3];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label('Warna yang Disukai'),
        checkBoxGroupContainer(0, colors, answers[0], updateChanges),
        label('Warna yang Cocok Untuk Anda'),
        checkBoxGroupContainer(1, colors, answers[1], updateChanges),
        label('Warna yang Anda Hindari'),
        checkBoxGroupContainer(2, colors, answers[2], updateChanges),
        label('Apakah Anda Berhijab?'),
        dropdown(['Ya', 'Tidak'], hijabController, 3, updateChanges),
        label('Preferensi Kecerahan Warna Pakaian'),
        buttonContainer(4, values, answers[4], 'Gelap', 'Cerah', updateChanges),
        label('Preferensi Motif pakaian'),
        buttonContainer(5, values, answers[5], 'Polos', 'Motif', updateChanges),
        label('Preferensi Keterbukaan Pakaian'),
        buttonContainer(
            6, values, answers[6], 'Tertutup', 'Terbuka', updateChanges),
      ],
    );
  }

  Widget buttonContainer(
      int selectIndex,
      List<dynamic> options,
      dynamic selectedValue,
      String leftLabel,
      String rightLabel,
      Function update) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 3), // Shadow offset (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Divider(thickness: 5),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: options.asMap().values.map((item) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white, // White background
                          shape: BoxShape
                              .circle, // Circle shape for the radio button
                        ),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Radio<int>(
                            value: item,
                            groupValue: selectedValue,
                            splashRadius: 12,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) {
                              update(selectIndex, value);
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.selected)) {
                                return const Color.fromRGBO(0, 147, 92, 1.0);
                              }
                              return Colors.grey;
                            }),
                          ),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                label(leftLabel),
                label(rightLabel),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateChanges(int selectIndex, dynamic index) {
    setState(() {
      if (selectIndex < 3) {
        answers[selectIndex][index] = !answers[selectIndex][index];
      } else {
        answers[selectIndex] = index;
      }
      storage.write('question2', answers);
    });
  }
}
