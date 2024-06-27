import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../questionpage/questionpage.dart';
import '../widget/costum_button.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset('assets/img/qrcode.jpg'),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: MyCostumButtton1(
                    buttonColor: Theme.of(context).primaryColor,
                    buttonText: "Confirm",
                    func: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionPage()));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

// Navigator.pop(context);
//       switch (_output![0]['label']) {
//         case 'Summer':
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const MySummerResultPage();
//           }));
//           break;
//         case 'Spring':
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const MySpringResultPage();
//           }));
//           break;
//         case 'Autumn':
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const MyAutumnResultPage();
//           }));
//           break;
//         case 'Winter':
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return const MyWinterResultPage();
//           }));
//           break;
//         default:
//           const Text("HELLO");
//       }
