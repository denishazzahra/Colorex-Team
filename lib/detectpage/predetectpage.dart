// import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'dart:async';
import 'rulespage.dart';
// import 'detectpage.dart';
import 'package:colorex/widget/costum_button.dart';

class MyPreDetectPage extends StatefulWidget {
  const MyPreDetectPage({super.key});
  @override
  MyPreDetectState createState() => MyPreDetectState();
}

class MyPreDetectState extends State<MyPreDetectPage> {
//  var _modelLoaded =  false;
//   File? _imageFile;
  // // ignore: unused_field
  // List? _output;

  final String vectorOlo = 'lib/splashpage/assets/Frame_Olo.svg';
  final String vectorColorex = 'lib/splashpage/assets/Vector_Colorex.svg';
  // final FirebaseStorage _storage = FirebaseStorage.instance;

  // Future<void> compressAndUploadFile(File file) async {
  //   XFile? compressedFile = await (FlutterImageCompress.compressAndGetFile(
  //     file.path,
  //     '${file.path}_compressed.jpg', // Change the extension if necessary
  //     quality: 60, // Adjust the quality as needed (0 to 100)
  //   ));
  //   File imageFile = File(compressedFile!.path);
  //   Reference ref = _storage
  //       .ref()
  //       .child('dataset/${DateTime.now().millisecondsSinceEpoch}');
  //   ref.putFile(imageFile);
  // }

  // Future<void> _loadModel() async {
  //   await Tflite.loadModel(
  //       model: "assets/Model/model.tflite", labels: "assets/Model/label.txt");
  //   setState(() {
  //     _modelLoaded = true;
  //   });
  // }

  // Future<void> _getImageFromCamera() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });
  //     compressAndUploadFile(_imageFile!);
  //     classifyImage(_imageFile!);
  //   } else {
  //     return;
  //   }
  // }

  // Future<void> classifyImage(File imageFile) async {
  //   var output = await Tflite.runModelOnImage(
  //     path: imageFile.path,
  //     numResults: 5,
  //     threshold: 0.5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //   setState(() {
  //     _output = output;
  //   });
  //   if (mounted) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => MyResultPage(
  //                   output: '${output![0]['label']}',
  //                   image: _imageFile!,
  //                 )));
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _loadModel();
  // }

  @override
  Widget build(context) {
    return Center(
      child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    const Spacer(
                      flex: 4,
                    ),
                    SvgPicture.asset(
                      vectorOlo,
                      height: 200,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    const Text('Let\'s find your',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'LeagueSpartan',
                          color: Colors.black,
                        )),
                    const Text(
                      'Personal Color!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'LeagueSpartan',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text('Reflect on yourself, then get on',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'LeagueSpartan',
                          color: Colors.black54,
                        )),
                    const Text(
                      'your perfect as a person',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'LeagueSpartan',
                        color: Colors.black54,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    MyCostumButtton1(
                        buttonColor: Theme.of(context).primaryColor,
                        buttonText: 'Continue',
                        func: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const MyDetectRulesPage();
                          }));
                        }),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ))
    );
  }

  // @override
  // void dispose() {
  //   Tflite.close();
  //   super.dispose();
  // }
}


// class MyPreDetectPage extends StatelessWidget {
//   const MyPreDetectPage({super.key});

//   final String vectorOlo = 'lib/splashpage/assets/Frame_Olo.svg';
//   final String vectorColorex = 'lib/splashpage/assets/Vector_Colorex.svg';

//   @override
//   Widget build(context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//         children: [
//           const Spacer(
//             flex: 3,
//           ),
//           SvgPicture.asset(
//             vectorOlo,
//             height: 200,
//           ),
//           const Spacer(),
//           SvgPicture.asset(
//             vectorColorex,
//             height: 30,
//           ),
//           const Spacer(),
//           Text(
//             'Find your Persona!',
//             style:
//                 TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, '/home');
//               },
//               child: const Text(
//                 'Continue',
//                 style: TextStyle(
//                   fontSize: 12,
//                 ),
//               )),
//           const Spacer(
//             flex: 2,
//           ),
//           const MyResultPage(output: 'hello')
//         ],
//       ),
//       ) 
//     );
//   }
// }