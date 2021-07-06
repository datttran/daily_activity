import 'package:daily_activity/constants.dart';
import 'package:daily_activity/workingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import 'responsive.dart';

//CONSTANTS
double bHeight = height * 4;
double bWidth = width * 30;
bool knownUser = false;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

AnimationController _controller;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Color(0xff08080A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          knownUser == false
              ? Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              height: height * 7,
                              width: width * 60,
                            ),
                            SizedBox(
                              height: height * 5,
                            ),
                            Text(
                              dateFormat[2] + ' ' + dateFormat[1] + ',' '\n${dateFormat[3]}',
                              style: TextStyle(color: Colors.white, fontSize: height * 5, fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 2),
                          child: Text(
                            dateFormat[0],
                            style: TextStyle(color: Colors.black, fontSize: height * 5, fontFamily: 'Roboto'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          height: height * 3,
                          width: width * 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 2),
                          child: user != 'Unknown'
                              ? Text(
                                  'Hello, ' + user,
                                  style: TextStyle(color: Colors.black, fontSize: height * 2, fontFamily: 'Roboto'),
                                )
                              : Text(
                                  'Hi there!',
                                  style: TextStyle(color: Colors.black, fontSize: height * 2, fontFamily: 'Roboto'),
                                ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.white,
                              height: height * 7,
                              width: width * 60,
                            ),
                            SizedBox(
                              height: height * 3,
                            ),
                            Center(
                              child: Container(
                                width: width * 60,
                                child: Text(
                                  'Please enter your name: ',
                                  style: TextStyle(color: Colors.white, fontSize: height * 5, fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0),
                          child: Center(
                            child: Container(
                              width: width * 55,
                              height: height * 7,
                              child: Marquee(
                                text: 'Hello, stranger',
                                blankSpace: 230,
                                velocity: 50,
                                style: TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: height * 5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 10,
                    ),
                    Container(
                      color: Colors.white,
                      height: height * 3,
                      width: width * 60,
                      child: TextField(
                        onChanged: (value) {
                          user = value;
                        },
                        textCapitalization: TextCapitalization.characters,
                        decoration: InputDecoration(hintText: ' Your name here', hintStyle: TextStyle(color: Colors.black54, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
          knownUser == false
              ? Center(
                  child: GestureDetector(
                    onTapDown: (details) {
                      if (user == 'Unknown') {
                        /*showCupertinoModalPopup(context: context, builder: (BuildContext context) => AddUser()).then((value) {
                    _controller.reverse();
                    SystemChrome.restoreSystemUIOverlays();
                  });*/

                        setState(() {
                          knownUser = true;
                        });
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return WorkingPage();
                        }));
                      }

                      _controller.forward();
                    },
                    onTapUp: (details) {
                      _controller.reverse();
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                          height: bHeight,
                          width: bWidth,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [Color(0xff8054EF).withOpacity(1), Color(0xff5D2BF5).withOpacity(1)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Start Working',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                )
              : Center(
                  child: GestureDetector(
                    onTapDown: (details) {
                      if (user != "Unknown") {
                        setState(() {
                          knownUser = false;
                          user = user;
                        });

                        _controller.forward();
                      }
                    },
                    onTapUp: (details) {
                      _controller.reverse();
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: Container(
                          height: bHeight,
                          width: bWidth,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [Color(0xff8054EF).withOpacity(1), Color(0xff5D2BF5).withOpacity(1)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
