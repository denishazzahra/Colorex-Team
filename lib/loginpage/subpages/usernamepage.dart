import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:colorex/widget/costum_button.dart';
import 'package:colorex/widget/costum_textfield.dart';
import 'package:colorex/model/user.dart';
import 'package:colorex/utils/users.dart';

import 'package:provider/provider.dart';

class MyUserNamePage extends StatefulWidget {
  const MyUserNamePage({super.key});

  @override
  MyUserNamePageState createState() => MyUserNamePageState();
}

class MyUserNamePageState extends State<MyUserNamePage> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  // state
  final TextEditingController _userNameController = TextEditingController();
  // ignore: unused_field
  // ignore: unused_field
  final String _error = '';

  // state update
  Future<void> _submitData(MyUserData userDataProvider) async {
    userDataProvider.userName = _userNameController.text;
    Map<String, dynamic> data = userDataProvider.toMap();
    await addUserData(data, userDataProvider.userID!);
  }

  //build
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 1,
              ),
              SvgPicture.asset(vectorColorex, height: 24),
              const SizedBox(
                width: 51,
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Submit!!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' your username',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 24,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                MyCostumTextFieldGeneral(
                  textFieldColor: Colors.white,
                  textFieldText: 'username',
                  textController: _userNameController,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(height: 12),
                MyCostumButtton1(
                  buttonColor: Theme.of(context).cardColor,
                  buttonText: 'Finish',
                  textColor: Colors.white,
                  func: () {
                    _submitData(userDataProvider);
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                ),
                if (_error.isNotEmpty)
                  Text(_error, style: const TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ));
  }
}
