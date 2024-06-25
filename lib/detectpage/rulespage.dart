import 'dart:io';
//import 'dart:math';

import 'package:colorex/widget/costum_background2.dart';
import 'package:colorex/widget/costum_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:face_camera/face_camera.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'resultpage/autumnresult.dart';
import 'resultpage/winterresult.dart';
import 'resultpage/springresult.dart';
import 'resultpage/summerresult.dart';


class MyDetectRulesPage extends StatefulWidget {
  const MyDetectRulesPage({super.key});

  @override
  State<MyDetectRulesPage> createState() => _MyDetectRulesPageState();
}

class _MyDetectRulesPageState extends State<MyDetectRulesPage> {
  File? _capturedImage;
  List? _output;
  var _modelLoaded = false;
  var _takePhoto = false;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";

  Future<void> compressAndUploadFile(File file) async {
    XFile? compressedFile = await (FlutterImageCompress.compressAndGetFile(
      file.path,
      '${file.path}_compressed.jpg', // Change the extension if necessary
      quality: 60, // Adjust the quality as needed (0 to 100)
    ));
    File imageFile = File(compressedFile!.path);
    Reference ref = _storage
        .ref()
        .child('dataset/${DateTime.now().millisecondsSinceEpoch}');
    ref.putFile(imageFile);
  }

  Future<void> classifyImage(File imageFile) async {
    var output = await Tflite.runModelOnImage(
      path: imageFile.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
    });
    if (mounted) {
      Navigator.pop(context);
      switch (_output![0]['label']) {
        case 'Summer':
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MySummerResultPage();
          }));
          break;
        case 'Spring':
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MySpringResultPage();
          }));
          break;
        case 'Autumn':
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MyAutumnResultPage();
          }));
          break;
        case 'Winter':
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MyWinterResultPage();
          }));
          break;
        default:
          const Text("HELLO");
      }
    }
  }

  Future<void> _loadModel() async {
    await Tflite.loadModel(
        model: "assets/Model/model.tflite", labels: "assets/Model/label.txt");
    setState(() {
      _modelLoaded = true;
    });
  }

  void _letsPhoto() {
    setState(() {
      _takePhoto = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 1,
              ),
              SvgPicture.asset(vectorColorex, height: 24),
              const SizedBox(
                width: 51,
              )
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        body: _modelLoaded
            ? _takePhoto
                ? Builder(builder: (context) {
                    // if (_capturedImage != null) {
                    //   return Center(
                    //     child: Stack(
                    //       alignment: Alignment.bottomCenter,
                    //       children: [
                    //         Image.file(
                    //           _capturedImage!,
                    //           width: double.maxFinite,
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //         ElevatedButton(
                    //             onPressed: () =>
                    //                 setState(() => _capturedImage = null),
                    //             child: const Text(
                    //               'Capture Again',
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.w700),
                    //             ))
                    //       ],
                    //     ),
                    //   );
                    // }
                    return SmartFaceCamera(
                        autoCapture: true,
                        defaultCameraLens: CameraLens.front,
                        onCapture: (File? image) {
                          setState(() => _capturedImage = image);
                          compressAndUploadFile(_capturedImage!);
                          classifyImage(_capturedImage!);
                        },
                        onFaceDetected: (Face? face) {
                          //Do something
                        },
                        messageBuilder: (context, face) {
                          if (face == null) {
                            return _message('Place your face in the camera');
                          }
                          if (!face.wellPositioned) {
                            return _message('Center your face in the square');
                          }
                          return const SizedBox.shrink();
                        });
                  })
                : Center(
                    child: MyRulesPage(
                      func: _letsPhoto,
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

Widget _message(String msg) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
      child: Text(msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 14, 
              height: 1.5, 
              fontWeight: FontWeight.w400
            ),
          ),
    );

class MyRulesPage extends StatelessWidget {
  const MyRulesPage({
    super.key,
    required this.func,
  });
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const MyBackground2(),
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 300,
              ),
            )
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height - 100,
              ),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Rules",
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 28, 
                        height: 1.5, 
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1.  ",
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 18, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Patikan kamu berada di tempat yang terang",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2.  ",
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 18, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Pastikan wajahmu tidak tertutup oleh kacamata, rambut atau aksesoris lainnya",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3.  ",
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 18, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Mohon untuk tidak bergerak saat pengambilan foto wajah",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MyCostumButtton1(
                  buttonColor: Colors.white,
                  buttonText: "Continue",
                  func: func
              ),
              const SizedBox(height: 24,)
            ],
          ),
        ),
      ],
    );
  }
}
