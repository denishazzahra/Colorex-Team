import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:colorex/widget/costum_button.dart';
import 'modal/loginmodal.dart';
import 'modal/signupmodal.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  final String vectorOlo = 'lib/splashpage/assets/Frame_Olo.svg';
  final String vectorColorex = 'lib/splashpage/assets/Vector_Colorex.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Spacer(
            flex: 8,
          ),
          SvgPicture.asset(
            vectorOlo,
            height: 200,
          ),
          const SizedBox(
            height: 24,
          ),
          SvgPicture.asset(
            vectorColorex,
            height: 30,
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Find your Persona!',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'LeagueSpartan'),
          ),
          const SizedBox(
            height: 12,
          ),
          MyCostumButtton1(
            buttonColor: Theme.of(context).primaryColor,
            buttonText: 'Let\'s get started',
            func: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const Wrap(
                      children: [MySignUpModal()],
                    );
                  });
            },
            // func: () {
            //   Navigator.of(context).pushNamed('/login');
            // },
          ),
          const SizedBox(
            height: 6,
          ),
          MyCostumButtton1(
            buttonColor: const Color.fromARGB(255, 207, 207, 207),
            buttonText: 'I already have an account',
            func: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const Wrap(
                      children: [MyLogInModal()],
                    );
                  });
            },
          ),
          const Spacer(
            flex: 3,
          ),
          const Text(
            'beta version',
            style: TextStyle(
              fontSize: 8,
              color: Colors.black,
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
