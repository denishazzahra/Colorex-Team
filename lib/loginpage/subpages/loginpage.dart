import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:colorex/utils/users.dart';
import 'package:colorex/model/user.dart';

import 'package:colorex/widget/costum_textfield.dart';
import 'package:colorex/widget/costum_button.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  MyLoginPageState createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";

  // state
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _error = '';

  Future<void> fetchData(MyUserData userDataProvider, User user) async {
    Map<String, dynamic>? data = await getDataFromFirestore('User', user.uid);

    if (data != null) {
      if (kDebugMode) {
        print('data retrieved $data');
      }
      userDataProvider.loadUserData(data);
    } else {
      // Handle document not found or error fetching data
    }
  }

  // state update
  Future<void> _login(MyUserData userDataProvider) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = userCredential.user;
      if (mounted) {
        fetchData(userDataProvider, user!);
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
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
                    Text(
                      'Welcome back! ',
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 24,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
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
                    _login(userDataProvider);
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
