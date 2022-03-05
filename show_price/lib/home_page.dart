import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../widget/bottom_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/////////////////////////////////////
//@CodeWithFlexz on Instagram
//
//AmirBayat0 on Github
//Programming with Flexz on Youtube
/////////////////////////////////////
  bool isFavorite = false;
  bool isAnimate = true;
  //
  @override
  Widget build(BuildContext context) {
    final finalWith = MediaQuery.of(context).size.width;
    final finalHeight = MediaQuery.of(context).size.height;
    //
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        body: Container(
          width: finalWith,
          height: finalHeight,
          //
          child: Stack(
            children: [
              FadeInUp(
                child: Container(
                    width: finalWith,
                    height: finalHeight / 1.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/1.jpg"),
                            fit: BoxFit.fitHeight)),
                            //
                    child: Stack(
                      children: [
                        RoundedPositionedWidget(
                          isAnimate: isAnimate,
                          content: "Apple Watch\n      \$849",
                          left: 20,
                          top: 230,
                          right: null,
                        ),
                        RoundedPositionedWidget(
                            isAnimate: isAnimate,
                            top: 345,
                            left: 60,
                            right: null,
                            content: "iPhone 6s \n     \$100"),
                        RoundedPositionedWidget(
                            isAnimate: isAnimate,
                            top: 300,
                            left: null,
                            right: 50,
                            content: "JBL Tune \n    \$379"),
                        RoundedPositionedWidget(
                            isAnimate: isAnimate,
                            top: 120,
                            left: null,
                            right: 60,
                            content: "MacBook Pro \n      \$1.399"),
                      ],
                    )),
              ),
              //
              BottomSectionWidget(
                isFavorite: isFavorite,
                onLikeTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                onRefreshTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MyAppBar Widget Components
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  double kToolbarHeight = 50;
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: FadeInDown(
          delay: Duration(milliseconds: 400),
          child: Text(
            "@CodeWithFlexz",
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

// Positioned Widget Components
class RoundedPositionedWidget extends StatelessWidget {
  double top;
  double? left;
  double? right;
  String content;

  final bool isAnimate;
  RoundedPositionedWidget(
      {required this.isAnimate,
      required this.top,
      required this.left,
      required this.right,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Tooltip(
        padding: EdgeInsets.all(10),
        textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        message: content,
        child: AvatarGlow(
          child: Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
          animate: isAnimate,
          endRadius: 30,
          duration: Duration(seconds: 5),
          glowColor: Color.fromARGB(255, 9, 136, 240),
        ),
      ),
    );
  }
}
