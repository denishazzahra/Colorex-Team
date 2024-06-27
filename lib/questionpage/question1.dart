import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import 'widgets/widgets.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  final List<String> genders = ["Perempuan", "Laki-laki"];
  final List<String> hairColors = [
    "Hitam",
    "Cokelat tua",
    "Cokelat muda",
    "Merah",
    "Blonde",
    "Lainnya"
  ];
  final List<String> eyeColors = [
    "Cokelat tua",
    "Cokelat muda",
    "Hijau",
    "Biru",
    "Lainnya"
  ];
  final List<String> skinColors = [
    "Putih pucat",
    "Putih hangat",
    "Kuning langsat",
    "Sawo Matang",
    "Cokelat"
  ];
  final List<String> skinUndertones = ["Warm", "Neutral", "Cool"];
  final List<String> bodyTypes = [
    "Pear",
    "Hourglass",
    "Rectangle",
    "Inverted triangle",
    "Apple"
  ];
  final List<String> styles = ["Kasual", "Formal", "Elegan", "Sporty"];
  final DateTime today = DateTime.now();
  late DateTime selectedDate;
  late GetStorage storage;
  late List<dynamic> answers;
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  late String selectedSkinUndertone;
  late String selectedBodyType;
  late String selectedSkinColor;
  late String selectedEyeColor;
  late String selectedHairColor;
  late String selectedStyle;

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    String username = userDataProvider.userID!;
    storage = GetStorage(username);
    answers = storage.hasData('question1')
        ? storage.read('question1')
        : List<String>.filled(10, '');
    selectedSkinUndertone = answers[6].isNotEmpty ? answers[6] : 'Warm';
    selectedBodyType = answers[8].isNotEmpty ? answers[8] : 'Pear';
    selectedSkinColor = answers[5].isNotEmpty ? answers[5] : 'Putih pucat';
    selectedEyeColor = answers[4].isNotEmpty ? answers[4] : 'Cokelat tua';
    selectedHairColor = answers[3].isNotEmpty ? answers[3] : 'Hitam';
    selectedStyle = answers[9].isNotEmpty ? answers[9] : 'Kasual';
    nameController.text = answers[0];
    genderController.text = answers[1];
    birthdayController.text = answers[2];
    heightController.text = answers[7];
    selectedDate = parsedDate(birthdayController.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label("Nama"),
        textBox(nameController, '', false, false, null, 0, updateChanges),
        label("Gender"),
        dropdown(genders, genderController, 1, updateChanges),
        label("Tanggal Lahir"),
        textBox(birthdayController, 'DD/MM/YYYY', true, false,
            () => _selectDate(context), 2, updateChanges), // Fixing onTap
        label("Warna Rambut Saat Ini"),
        buttonGroupContainer(
            hairColors, selectedHairColor, 'Hair', 3, updateChanges),
        label("Warna Mata"),
        buttonGroupContainer(
            eyeColors, selectedEyeColor, 'Eye', 4, updateChanges),
        label("Warna Kulit Wajah"),
        buttonGroupContainer(
            skinColors, selectedSkinColor, 'Skin', 5, updateChanges),
        label("Undertone Kulit"),
        buttonGroupContainer(skinUndertones, selectedSkinUndertone, 'Skintone',
            6, updateChanges),
        label("Tinggi Badan"),
        textBox(heightController, '', false, true, null, 7, updateChanges),
        label("Bentuk Tubuh"),
        buttonGroupContainer(
            bodyTypes, selectedBodyType, 'Body', 8, updateChanges),
        label("Gaya Berpakaian"),
        buttonGroupContainer(styles, selectedStyle, 'Style', 9, updateChanges),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1930),
      lastDate: today,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                Theme.of(context).cardColor, // Header background color
            dividerColor: Colors.white,
            // accentColor: Colors.black, // Text color of selected date
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).cardColor, // Selected date color
              onPrimary: Colors.white, // Text color on selected date
              surface: Colors.white, // Background color
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the picker
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != today) {
      // Handle the selected date (picked)
      setState(() {
        birthdayController.text = formattedDate(picked);
        updateChanges(birthdayController.text, 2);
        selectedDate = picked;
      });
    }
  }

  String formattedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  DateTime parsedDate(String date) {
    try {
      return DateFormat('dd/MM/yyyy').parse(date);
    } catch (e) {
      return DateTime.now();
    }
  }

  void updateChanges(String answer, int index) {
    setState(() {
      if (index == 1) {
        genderController.text = answer;
      } else if (index == 6) {
        selectedSkinUndertone = answer;
      } else if (index == 8) {
        selectedBodyType = answer;
      } else if (index == 3) {
        selectedHairColor = answer;
      } else if (index == 4) {
        selectedEyeColor = answer;
      } else if (index == 5) {
        selectedSkinColor = answer;
      } else if (index == 9) {
        selectedStyle = answer;
      }
      answers[index] = answer;
      storage.write('question1', answers);
    });
  }
}
