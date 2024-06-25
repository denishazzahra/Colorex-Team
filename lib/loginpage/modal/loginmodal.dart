import 'package:colorex/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:colorex/widget/costum_button.dart';
import 'package:colorex/utils/users.dart';
import 'package:provider/provider.dart';

class MyLogInModal extends StatelessWidget {
  const MyLogInModal({super.key});

  Future<void> fetchData(MyUserData userDataProvider, User user) async {
    Map<String, dynamic>? data = await getDataFromFirestore('User', user.uid);

    if (data != null) {
      userDataProvider.loadUserData(data);
    } else {
      // Handle document not found or error fetching data
    }
  }

  void logInWithGoogle(
      BuildContext context, MyUserData userDataProvider) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      FirebaseAuth _auth = FirebaseAuth.instance;
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (kDebugMode) {
          print('User logged in with Google: ${user.displayName}');
        }

        fetchData(userDataProvider, user);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
        // You can navigate to a new screen or perform other actions here
      } else {
        if (kDebugMode) {
          print('Sign in unsuccessful.');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error logging in with Google: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);

    return Center(
        child: Column(
      children: [
        const SizedBox(
          height: 36,
        ),
        Text(
          'Log In',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 24,
        ),
        MyCostumButttonGoogle(
          buttonColor: Colors.white,
          buttonText: 'Log In with Google',
          func: () {
            logInWithGoogle(context, userDataProvider);
          },
        ),
        const SizedBox(
          height: 12,
        ),
        MyCostumButtton1(
          buttonColor: Colors.white,
          buttonText: 'Log In with Apple',
          func: () {},
        ),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Log In with Email',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    ));
  }
}
