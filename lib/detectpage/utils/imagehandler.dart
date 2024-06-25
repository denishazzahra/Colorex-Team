// ignore_for_file: file_names
import 'package:image/image.dart';

Image resize(Image source) {
  return copyResize(source, width: 128, height: 128);
}