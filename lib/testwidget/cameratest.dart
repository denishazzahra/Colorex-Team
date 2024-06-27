// import 'dart:ffi';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

// class CameraPreviewWidget extends StatefulWidget {
//   const CameraPreviewWidget({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
// }

// class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
//   final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
//   final String vectorValid = "assets/svg/detect_valid.svg";
//   final String vectorInValid = "assets/svg/detect_invalid.svg";
//   final String vectorNothing = "assets/svg/no_detect.svg";
//   late CameraController controller;
//   late List<CameraDescription> cameras;
//   bool _loadCamera = false;
//   bool _faceDetected = false;

//   @override
//   void initState() {
//     _setupCamera();
//     super.initState();
//   }
  
//   void _setupCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(cameras[1], ResolutionPreset.medium);
//     await controller.initialize();
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _loadCamera = true;
//     });
//   }


//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const SizedBox(
//                 width: 1,
//               ),
//               SvgPicture.asset(vectorColorex, height: 24),
//               const SizedBox(
//                 width: 51,
//               )
//             ],
//           ),
//         ),
//         body: Container(
//           child: _loadCamera
//               ? Center(
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.width *
//                         controller.value.aspectRatio,
//                     child: AspectRatio(
//                       aspectRatio: 1 / controller.value.aspectRatio,
//                       child: CameraPreview(
//                         controller,
//                         child: Center(
//                             child: SvgPicture.asset(
//                                 _faceDetected ? vectorInValid : vectorNothing,
//                                 width:
//                                     MediaQuery.of(context).size.width * 0.6)),
//                       ),
//                     ),
//                   ),
//                 )
//               : const Center(child: CircularProgressIndicator()),
//         ));
//   }
// }


// // void _startStreaming() {
// //     controller.startImageStream((CameraImage image) async {
// //       // Convert CameraImage to bytes
// //       final Uint8List bytes = _concatenatePlanes(image.planes);
// //       final InputImage inputImage = InputImage.fromBytes(
// //         bytes: bytes,
// //         metadata: InputImageMetadata(
// //           size: Size.infinite,
// //           rotation: InputImageRotation.rotation0deg,
// //           format: InputImageFormat.bgra8888,
// //           bytesPerRow: 4,
// //         )
// //       );

// //       FaceDetector faceDetector = FaceDetector(options: FaceDetectorOptions());
// //       final List<Face> faces = await faceDetector.processImage(inputImage);
// //       await faceDetector.close();
// //     });
// //   }

// //   Uint8List _concatenatePlanes(List<Plane> planes) {
// //     final WriteBuffer allBytes = WriteBuffer();
// //     for (Plane plane in planes) {
// //       allBytes.putUint8List(plane.bytes);
// //     }
// //     return allBytes.done().buffer.asUint8List();
// //   }

// //   Future<void> fullCycle() async {
// //     controller.startImageStream((image) async {
// //       bool detected = ;
// //       if (detected && !_faceDetected) {
// //         if (kDebugMode) {
// //           print("there is a face detected");
// //         }
// //         setState(() {
// //           _faceDetected = detected;
// //         });
// //       }
// //       if (!detected && _faceDetected) {
// //         if (kDebugMode) {
// //           print("there is no face detected");
// //         }
// //         setState(() {
// //           _faceDetected = !detected;
// //         });
// //       }
// //     });
// //   }

// //   Future<bool> isFaceDetected(InputImage inputImage) async {
// //     FaceDetector faceDetector = FaceDetector(options: FaceDetectorOptions());
// //     final List<Face> faces = await faceDetector.processImage(inputImage);
// //     await faceDetector.close();
// //     return faces.isNotEmpty;
// //   }
