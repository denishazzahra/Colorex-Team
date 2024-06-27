import 'package:colorex/widget/costum_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../questionpage/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  final DateTime today = DateTime.now();
  final List<String> genders = ["Perempuan", "Laki-laki"];
  final List<String> skinUndertones = ["Warm", "Neutral", "Cool"];
  final List<String> eyeColors = [
    "Cokelat tua",
    "Cokelat muda",
    "Hijau",
    "Biru",
    "Lainnya"
  ];
  List<dynamic> answers = List.generate(5, (index) => '');
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  late DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    answers[0] = answers[0] == '' ? userDataProvider.displayName : answers[0];
    answers[3] = answers[3] == '' ? 'Warm' : answers[3];
    answers[4] = answers[4] == '' ? 'Cokelat tua' : answers[4];
    nameController.text = answers[0];
    selectedDate = parsedDate(birthdayController.text);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    splashRadius: 24,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Profile User",
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  label("Nama"),
                  textBox(
                      nameController, '', false, false, null, 0, updateAnswer),

                  label("Gender"),
                  dropdown(genders, genderController, 1, updateAnswer),
                  label("Tanggal Lahir"),
                  textBox(
                      birthdayController,
                      'DD/MM/YYYY',
                      true,
                      false,
                      () => _selectDate(context),
                      2,
                      updateAnswer), // Fixing onTap
                  label("Undertone"),
                  buttonGroupContainer(
                      skinUndertones, answers[3], 'Undertone', 3, updateAnswer),
                  label("Warna Mata"),
                  buttonGroupContainer(
                      eyeColors, answers[4], 'Eye', 4, updateAnswer),
                ],
              ),
              const SizedBox(height: 24),
              MyCostumButtton1(
                buttonColor: Theme.of(context).cardColor,
                buttonText: 'Simpan',
                textColor: Colors.white,
                func: () {},
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
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
        selectedDate = picked;
        updateAnswer(birthdayController.text, 2);
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

  void updateAnswer(dynamic value, dynamic index) {
    setState(() {
      if (value == 1) {
        answers[value] = index;
      } else {
        answers[index] = value;
      }

      print(answers);
    });
  }
}
