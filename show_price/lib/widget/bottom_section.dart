import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

class BottomSectionWidget extends StatelessWidget {
  bool isFavorite;
  VoidCallback onLikeTap;
  VoidCallback onRefreshTap;
  BottomSectionWidget({
    required this.isFavorite,
    required this.onLikeTap,
    required this.onRefreshTap,
  });

  @override
  Widget build(BuildContext context) {
    final finalWith = MediaQuery.of(context).size.width;
    final finalHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
      child: FadeInUp(
        duration: Duration(seconds: 1),
        child: Container(
          width: finalWith,
          height: finalHeight / 3,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                delay: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apple Watch , Phone And...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: onLikeTap,
                      icon: isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 30,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: finalWith / 1.3,
                height: finalHeight / 10,
                child: FadeInUp(
                  delay: Duration(seconds: 1),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FadeInUp(
                delay: Duration(milliseconds: 1500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: onRefreshTap,
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
