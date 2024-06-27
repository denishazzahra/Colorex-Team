import 'package:flutter/material.dart';

import '../questionpage/questionpage.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('assets/img/qrcode.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuestionPage()));
                },
                child: const Text('Konfirmasi Pembayaran'),
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
