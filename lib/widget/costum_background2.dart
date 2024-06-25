import 'package:flutter/material.dart';

class MyBackground2 extends StatelessWidget {
  const MyBackground2({super.key});
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
            const SizedBox(
              height: 10,
            ),
            ClipPath(
                clipper: SineWaveClipper3(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2.3,
                  color: Theme.of(context).cardColor,
                )),
          ],
        ),
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
    final double xScaling = size.width / 1150;
    final double yScaling = size.height / 478;
    path.lineTo(1149.49 * xScaling, 73.5522 * yScaling);
    path.cubicTo(
      1149.49 * xScaling,
      73.5522 * yScaling,
      1149.49 * xScaling,
      477.145 * yScaling,
      1149.49 * xScaling,
      477.145 * yScaling,
    );
    path.cubicTo(
      1149.49 * xScaling,
      477.145 * yScaling,
      0.490234 * xScaling,
      477.145 * yScaling,
      0.490234 * xScaling,
      477.145 * yScaling,
    );
    path.cubicTo(
      0.490234 * xScaling,
      477.145 * yScaling,
      0.490234 * xScaling,
      0.122314 * yScaling,
      0.490234 * xScaling,
      0.122314 * yScaling,
    );
    path.cubicTo(
      39.5371 * xScaling,
      9.97803 * yScaling,
      79.3936 * xScaling,
      21.2268 * yScaling,
      120.003 * xScaling,
      34.0066 * yScaling,
    );
    path.cubicTo(
      597.164 * xScaling,
      184.167 * yScaling,
      970.279 * xScaling,
      122.988 * yScaling,
      1149.49 * xScaling,
      73.5522 * yScaling,
    );
    path.cubicTo(
      1149.49 * xScaling,
      73.5522 * yScaling,
      1149.49 * xScaling,
      73.5522 * yScaling,
      1149.49 * xScaling,
      73.5522 * yScaling,
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
    final double yScaling = size.height / 497;
    path.lineTo(1149 * xScaling, 73.4299 * yScaling);
    path.cubicTo(
      1149 * xScaling,
      73.4299 * yScaling,
      1149 * xScaling,
      496.122 * yScaling,
      1149 * xScaling,
      496.122 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      496.122 * yScaling,
      0 * xScaling,
      496.122 * yScaling,
      0 * xScaling,
      496.122 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      496.122 * yScaling,
      0 * xScaling,
      0 * yScaling,
      0 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      39.0469 * xScaling,
      9.85571 * yScaling,
      78.9033 * xScaling,
      21.1045 * yScaling,
      119.513 * xScaling,
      33.8843 * yScaling,
    );
    path.cubicTo(
      596.674 * xScaling,
      184.044 * yScaling,
      969.789 * xScaling,
      122.865 * yScaling,
      1149 * xScaling,
      73.4299 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      73.4299 * yScaling,
      1149 * xScaling,
      73.4299 * yScaling,
      1149 * xScaling,
      73.4299 * yScaling,
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
    final double yScaling = size.height / 461;
    path.lineTo(1149 * xScaling, 0 * yScaling);
    path.cubicTo(
      1149 * xScaling,
      0 * yScaling,
      1149 * xScaling,
      460.773 * yScaling,
      1149 * xScaling,
      460.773 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      460.773 * yScaling,
      0 * xScaling,
      460.773 * yScaling,
      0 * xScaling,
      460.773 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      460.773 * yScaling,
      0 * xScaling,
      26.8669 * yScaling,
      0 * xScaling,
      26.8669 * yScaling,
    );
    path.cubicTo(
      148.412 * xScaling,
      36.8472 * yScaling,
      284.532 * xScaling,
      41.0237 * yScaling,
      405.198 * xScaling,
      41.6787 * yScaling,
    );
    path.cubicTo(
      567.757 * xScaling,
      40.7944 * yScaling,
      758.441 * xScaling,
      33.4836 * yScaling,
      969.478 * xScaling,
      14.1189 * yScaling,
    );
    path.cubicTo(
      1026.94 * xScaling,
      8.8457 * yScaling,
      1082.9 * xScaling,
      4.46631 * yScaling,
      1137.19 * xScaling,
      0.867188 * yScaling,
    );
    path.cubicTo(
      1141.05 * xScaling,
      0.578369 * yScaling,
      1144.99 * xScaling,
      0.289062 * yScaling,
      1149 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      1149 * xScaling,
      0 * yScaling,
      1149 * xScaling,
      0 * yScaling,
      1149 * xScaling,
      0 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
