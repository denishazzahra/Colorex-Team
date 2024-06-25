import 'dart:io';
import 'package:flutter/material.dart';
import 'package:face_camera/face_camera.dart';

class CameraTesting2 extends StatefulWidget {
  const CameraTesting2({super.key});

  @override
  State<CameraTesting2> createState() => _CameraTesting2State();
}

class _CameraTesting2State extends State<CameraTesting2> {
  File? _capturedImage;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_capturedImage != null) {
        return Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.file(
                _capturedImage!,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
              ElevatedButton(
                  onPressed: () => setState(() => _capturedImage = null),
                  child: const Text(
                    'Capture Again',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ))
            ],
          ),
        );
      }
      return SmartFaceCamera(
          autoCapture: true,
          defaultCameraLens: CameraLens.front,
          onCapture: (File? image) {
            setState(() => _capturedImage = image);
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
    });
  }
}

Widget _message(String msg) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
      child: Text(msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
    );
