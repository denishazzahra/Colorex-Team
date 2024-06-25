import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

import 'homepage/homepage.dart';
import 'pages/detectpage.dart';
import 'pages/profilepage.dart';
import 'loginpage/mainlogin.dart';
import 'loginpage/subpages/loginpage.dart';
import 'loginpage/subpages/signuppage.dart';

import 'model/user.dart';
import 'model/post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FaceCamera.initialize();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyUserData()),
        ChangeNotifierProvider(create: (context) => MyPostDataManager())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(244, 230, 11, 1.0),
        cardColor: const Color.fromRGBO(0, 147, 92, 1.0),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(244, 230, 11, 1.0)),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w400),
          titleMedium: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 18,
              fontWeight: FontWeight.w500),
          titleLarge: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 20,
              fontWeight: FontWeight.w700),
          labelLarge: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 20,
              fontWeight: FontWeight.w500),
          labelMedium: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w600),
          labelSmall: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontFamily: 'LeagueSpartan',
              fontSize: 12,
              fontWeight: FontWeight.w800),
        ),
        primaryTextTheme: GoogleFonts.leagueSpartanTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const MySplashScreen(),
        '/login': (context) => const MyLoginPage(),
        '/signup': (context) => const MySignUpPage(),
        '/home': (context) => const MyHomePage(),
        '/detect': (context) => const MyDetectPage(),
        '/profile': (context) => const MyProfilePage(),
      },
    );
  }
}
