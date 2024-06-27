import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'usernamepage.dart';
import 'package:colorex/widget/costum_button.dart';
import 'package:colorex/widget/costum_textfield.dart';
import 'package:colorex/model/user.dart';

import 'package:provider/provider.dart';

class MySignUpPage extends StatefulWidget {
  const MySignUpPage({super.key});

  @override
  MySignUpPageState createState() => MySignUpPageState();
}

class MySignUpPageState extends State<MySignUpPage> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  // state
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // ignore: unused_field
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _error = '';

  // state update
  Future<void> _signUp(MyUserData userDataProvider) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Signed up successfully
      User? user = userCredential.user;
      if (kDebugMode) {
        print('User signed up: ${user!.uid}');
      }
      userDataProvider.userID = user!.uid;
      userDataProvider.photoURL = _firstNameController.text.substring(0, 1);
      userDataProvider.displayName =
          "${_firstNameController.text} ${_lastNameController.text}";
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyUserNamePage()));
      }
      // You can redirect the user to another page or perform other actions here
    } catch (e) {
      // Handle errors here
      if (kDebugMode) {
        print('Sign up error: $e');
      }
      // You can display an error message to the user here
    }
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
        body: ListView(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' to save progress',
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
                      textFieldText: 'First name',
                      textController: _firstNameController,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MyCostumTextFieldGeneral(
                      textFieldColor: Colors.white,
                      textFieldText: 'Last name',
                      textController: _lastNameController,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MyCostumTextFieldGeneral(
                      textFieldColor: Colors.white,
                      textFieldText: 'Email Address',
                      textController: _emailController,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MyCostumTextFieldPassword(
                      textFieldColor: Colors.white,
                      textFieldText: 'Password',
                      textController: _passwordController,
                    ),
                    // TextField(
                    //   controller: _emailController,
                    //   decoration: const InputDecoration(labelText: 'Email'),
                    // ),
                    // const SizedBox(height: 12.0),
                    // TextField(
                    //   controller: _passwordController,
                    //   decoration: const InputDecoration(labelText: 'Password'),
                    //   obscureText: true,
                    // ),
                    // const SizedBox(height: 12.0),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '8+ character, 1 uppercase, 1 number',
                        ),
                        SizedBox(
                          width: 64,
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    MyCostumButtton1(
                      buttonColor: Theme.of(context).cardColor,
                      buttonText: 'Log In',
                      textColor: Colors.white,
                      func: () {
                        _signUp(userDataProvider);
                      },
                    ),
                    if (_error.isNotEmpty)
                      Text(_error, style: const TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
