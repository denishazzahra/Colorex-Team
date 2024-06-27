import 'package:flutter/material.dart';

class MyBackground1 extends StatelessWidget {
  const MyBackground1({super.key});
  final String vectorRect1 = "lib/homepage/asset/svg/Vector_Rectangle1.svg";
  final String vectorRect2 = "lib/homepage/asset/svg/Vector_Rectangle2.svg";
  final String vectorRect3 = "lib/homepage/asset/svg/Vector_Rectangle3.svg";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            ClipPath(
                clipper: SineWaveClipper2(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  color: Colors.black,
                )),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipPath(
                clipper: SineWaveClipper3(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2.6,
                  color: Theme.of(context).cardColor,
                )),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipPath(
                clipper: SineWaveClipper1(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  color: Theme.of(context).primaryColor,
                )),
          ],
        ),
      ],
    ));
  }
}

class SineWaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 1149;
    final double yScaling = size.height / 590;
    path.lineTo(1149 * xScaling, 1.84869 * yScaling);
    path.cubicTo(
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      607.472 * yScaling,
      1149 * xScaling,
      607.472 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      607.472 * yScaling,
      0 * xScaling,
      607.472 * yScaling,
      0 * xScaling,
      607.472 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      607.472 * yScaling,
      0 * xScaling,
      181.036 * yScaling,
      0 * xScaling,
      181.036 * yScaling,
    );
    path.cubicTo(
      144.611 * xScaling,
      173.96 * yScaling,
      309.925 * xScaling,
      148.48 * yScaling,
      490.703 * xScaling,
      91.5904 * yScaling,
    );
    path.cubicTo(
      745.849 * xScaling,
      11.2974 * yScaling,
      970.191 * xScaling,
      -6.42756 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SineWaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 1149;
    final double yScaling = size.height / 618;
    path.lineTo(1149 * xScaling, 1.84869 * yScaling);
    path.cubicTo(
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      589.024 * yScaling,
      1149 * xScaling,
      589.024 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      589.024 * yScaling,
      0 * xScaling,
      589.024 * yScaling,
      0 * xScaling,
      589.024 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      589.024 * yScaling,
      0 * xScaling,
      181.036 * yScaling,
      0 * xScaling,
      181.036 * yScaling,
    );
    path.cubicTo(
      144.611 * xScaling,
      173.96 * yScaling,
      309.925 * xScaling,
      148.48 * yScaling,
      490.703 * xScaling,
      91.5904 * yScaling,
    );
    path.cubicTo(
      745.849 * xScaling,
      11.2974 * yScaling,
      970.191 * xScaling,
      -6.42756 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
      1149 * xScaling,
      1.84869 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SineWaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 1149;
    final double yScaling = size.height / 445;
    path.lineTo(0 * xScaling, 444.337 * yScaling);
    path.cubicTo(
      0 * xScaling,
      444.337 * yScaling,
      0 * xScaling,
      0 * yScaling,
      0 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      53.3263 * xScaling,
      3.5055 * yScaling,
      108.318 * xScaling,
      7.78579 * yScaling,
      164.815 * xScaling,
      12.9557 * yScaling,
    );
    path.cubicTo(
      369.188 * xScaling,
      31.6571 * yScaling,
      553.852 * xScaling,
      38.7177 * yScaling,
      711.279 * xScaling,
      39.5719 * yScaling,
    );
    path.cubicTo(
      840.243 * xScaling,
      38.8703 * yScaling,
      987.538 * xScaling,
      33.9804 * yScaling,
      1149 * xScaling,
      21.8896 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      21.8896 * yScaling,
      1149 * xScaling,
      444.337 * yScaling,
      1149 * xScaling,
      444.337 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      444.337 * yScaling,
      149.444 * xScaling,
      444.337 * yScaling,
      149.444 * xScaling,
      444.337 * yScaling,
    );
    path.cubicTo(
      149.444 * xScaling,
      444.337 * yScaling,
      134.071 * xScaling,
      444.337 * yScaling,
      134.071 * xScaling,
      444.337 * yScaling,
    );
    path.cubicTo(
      134.071 * xScaling,
      444.337 * yScaling,
      0 * xScaling,
      444.337 * yScaling,
      0 * xScaling,
      444.337 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      444.337 * yScaling,
      0 * xScaling,
      444.337 * yScaling,
      0 * xScaling,
      444.337 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
