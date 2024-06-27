import 'package:flutter/material.dart';

class MyTempWidet extends StatelessWidget {
  const MyTempWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1)),
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xff131413),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff003057),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xffbf0d3e),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomLeft: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff963cbd),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xff007681),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomRight: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        const Text(
                          'Summer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1)),
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xff131413),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff131413),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xffce0037),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomLeft: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffc724b1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xff0072ce),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomRight: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        const Text(
                          'Winter',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1)),
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xff131413),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff5c462b),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xff9a3324),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomLeft: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffec5037),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(12),
                                                    ))),
                                          ),
                                          Expanded(
                                            child: Container(
                                                decoration: const BoxDecoration(
                                              color: Color(0xff00778b),
                                              // borderRadius: BorderRadius.only(
                                              //   bottomRight: Radius.circular(12),
                                              // )
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        const Text(
                          'Autumn',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1)),
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xff131413),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff963cbd),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xffec5037),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomLeft: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff9595d2),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(12),
                                                  ))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: const BoxDecoration(
                                            color: Color(0xff2dccd3),
                                            // borderRadius: BorderRadius.only(
                                            //   bottomRight: Radius.circular(12),
                                            // )
                                          )),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        const Text(
                          'Spring',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
