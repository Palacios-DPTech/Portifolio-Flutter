import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  double switchWidth = 75.0;
  double switchHeight = 25.0;

  Duration animationDuration = Duration(milliseconds: 300);
  Duration animationDurationThumb = Duration(milliseconds: 250);

  bool isWb = true;

  void onTapSwitch() {
    setState(() {
      isWb = !isWb;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor.withOpacity(0),
      body: Align( alignment: Alignment(1.0105, -1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTapSwitch,
              child: Container(
                width: switchWidth,
                height: switchHeight,
                child: Stack(
                  children: [
                    // WEB BACKGROUND
                    AnimatedPositioned(
                      duration: animationDuration,
                      width: isWb ? switchWidth : 0,
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: switchWidth,
                        height: switchHeight,
                        child: Ink.image(
                          image: AssetImage("images/bgw1.png"),
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ),

                    // WEB ICON
                    AnimatedPositioned(
                      duration: animationDuration,
                      top: -6,
                      bottom: -6,
                      left: isWb ? 2 : (switchWidth - switchHeight),
                      child: AnimatedOpacity(
                        opacity: isWb ? 1 : 0,
                        duration: animationDurationThumb,
                        child: Container(
                          child: Image.asset("images/wbw.png"),
                        ),
                      ),
                    ),

                    // MOBILE BACKGROUND
                    AnimatedPositioned(
                      duration: animationDuration,
                      width: isWb ? 0 : switchWidth,
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: switchWidth,
                        height: switchHeight,
                        child: Ink.image(
                          image: AssetImage("images/bgm.png"),
                          fit: BoxFit.fill,
                        ),
                        decoration: BoxDecoration(),
                      ),
                    ),

                    // MOBILE ICON
                    AnimatedPositioned(
                      duration: animationDuration,
                      top: -1,
                      bottom: -1,
                      left: isWb ? 0 : (switchWidth - switchHeight),
                      child: AnimatedOpacity(
                        opacity: isWb ? 0 : 1,
                        duration: animationDurationThumb,
                        child: Container(
                          child: Image.asset("images/mbw.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
