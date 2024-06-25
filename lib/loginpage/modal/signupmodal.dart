import 'package:colorex/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:colorex/widget/costum_button.dart';
import 'package:colorex/loginpage/subpages/usernamepage.dart';
import 'package:provider/provider.dart';

class MySignUpModal extends StatelessWidget {
  const MySignUpModal({super.key});

  void signUpWithGoogle(
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
      if (user != null && userCredential.additionalUserInfo!.isNewUser) {
        if (kDebugMode) {
          print('User signed up with Google: ${user.displayName}');
        }
        userDataProvider.displayName = user.displayName;
        userDataProvider.userID = user.uid;
        userDataProvider.photoURL = user.photoURL;
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyUserNamePage()));
      } else {
        if (kDebugMode) {
          print('User already exists or sign in unsuccessful.');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error signing up with Google: $error');
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
          'Sign Up',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 24,
        ),
        MyCostumButttonGoogle(
          buttonColor: Colors.white,
          buttonText: 'Continue with Google',
          func: () {
            signUpWithGoogle(context, userDataProvider);
          },
        ),
        const SizedBox(
          height: 12,
        ),
        MyCostumButtton1(
          buttonColor: Colors.white,
          buttonText: 'Continue with Apple',
          func: () {},
        ),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/signup');
          },
          child: Text(
            'Sign up with Email',
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
