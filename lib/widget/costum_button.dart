import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCostumButtton1 extends StatelessWidget {
  const MyCostumButtton1({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.func,
    this.textColor,
    this.buttonWidth,
    this.buttonIcon,
    this.shadowColor,
  });
  final Color buttonColor;
  final String buttonText;
  final VoidCallback func;
  final Color? textColor;
  final double? buttonWidth;
  final Icon? buttonIcon;
  final Color? shadowColor;

  final double fontSize = 18;
  final double topPad = 12;
  final double bottomPad = 8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: func,
        child: Stack(
          children: [
            Positioned(
              top: 14,
              right: 6,
              child: FittedBox(
                child: Container(
                  width: (buttonWidth != null) ? buttonWidth! : 270,
                  decoration: BoxDecoration(
                    color: (shadowColor != null) ? shadowColor! : Colors.black,
                    borderRadius:
                        const BorderRadiusDirectional.all(Radius.circular(8)),
                  ),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: bottomPad, top: topPad),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: (textColor != null) ? textColor! : Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'LeagueSpartan',
                          fontSize: fontSize,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
                ),
              ),
            ),
            FittedBox(
              child: Container(
                width: (buttonWidth != null) ? buttonWidth! : 270,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(-0.4, -0.7))
                  ],
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: bottomPad, top: topPad),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: (textColor != null) ? textColor! : Colors.black,
                        decoration: TextDecoration.none,
                        fontFamily: 'LeagueSpartan',
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}

class MyCostumButttonGoogle extends StatelessWidget {
  const MyCostumButttonGoogle({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.func,
    this.textColor,
    this.buttonWidth,
    this.buttonIcon,
    this.shadowColor,
  });
  final Color buttonColor;
  final String buttonText;
  final VoidCallback func;
  final Color? textColor;
  final double? buttonWidth;
  final Icon? buttonIcon;
  final Color? shadowColor;

  final double fontSize = 18;
  final double topPad = 12;
  final double bottomPad = 8;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: func,
        child: Stack(
          children: [
            Positioned(
              top: 14,
              right: 6,
              child: Container(
                width: (buttonWidth != null) ? buttonWidth! : 270,
                decoration: BoxDecoration(
                  color: (shadowColor != null) ? shadowColor! : Colors.black,
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(8)),
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: bottomPad, top: topPad),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: (textColor != null) ? textColor! : Colors.black,
                        decoration: TextDecoration.none,
                        fontFamily: 'LeagueSpartan',
                        fontSize: fontSize,
                        fontWeight: FontWeight.w400),
                  ),
                )),
              ),
            ),
            Container(
              width: (buttonWidth != null) ? buttonWidth! : 270,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(-0.4, -0.7))
                ],
              ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(bottom: bottomPad, top: topPad),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      child: 
                        Image.asset(
                          'assets/img/g_logo.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(width: 6,),
                      Text(
                        buttonText,
                        style: TextStyle(
                            color: (textColor != null) ? textColor! : Colors.black,
                            decoration: TextDecoration.none,
                            fontFamily: 'LeagueSpartan',
                            fontSize: fontSize,
                            fontWeight: FontWeight.w400),
                      ),
                  ],
                ),
              )),
            ),
          ],
        ));
  }
}
