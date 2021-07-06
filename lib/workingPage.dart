import 'package:daily_activity/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

var wPosition = <int>[1];

class WorkingPage extends StatefulWidget {
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Duration _duration = Duration(minutes: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: wPosition.length,
            itemBuilder: (context, position) {
              return Center(
                child: Container(
                  color: Colors.white,
                  height: height * 7,
                  width: width * 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideCountdownClock(
                      duration: _duration * wPosition[position],
                      slideDirection: SlideDirection.Down,
                      separator: ":",
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      onDone: () {
                        print('Done');
                        wPosition = List.filled(wPosition.length, 0);
                        setState(() {
                          _duration = Duration(seconds: 10);

                          print(wPosition);
                          wPosition = <int>[...wPosition, 1];
                          print(wPosition);
                        });
                      },
                    ),
                  ),
                ),
              );
            }));
  }
}
