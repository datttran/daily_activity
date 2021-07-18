import 'package:daily_activity/globals.dart';
import 'package:daily_activity/popUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:rive/rive.dart';

//
Duration duration = Duration(seconds: 10);
Duration end = Duration.zero;
Color pauseColor = Colors.black;
Icon pauseIcon = Icon(Icons.pause);

class WorkingPage extends StatefulWidget {
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {
  List<Duration> wTimer = [begin, end];

  bool clock_running = true;
  bool result;

  @override
  void initState() {
    super.initState();
    print('new state');
  }

  endEvent() {
    FlutterRingtonePlayer.play(
      android: AndroidSounds.notification,
      ios: IosSounds.glass,
      looping: true, // Android only - API >= 28
      volume: 1, // Android only - API >= 28
      asAlarm: true, // Android only - all APIs
    );
    /*showDialog(
        context: context,
        builder: (BuildContext context) => Material(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.white,
                      width: double.infinity,
                      child: Center(child: Text('Complete', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              FlutterRingtonePlayer.stop();

                              Navigator.pop(context);
                              begin = Duration(seconds: 5);
                            },
                            child: Container(
                              height: 100,
                              color: Colors.white,
                              child: Center(child: Text('Break', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            color: Colors.white,
                            child: Center(child: Text('Sprint', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )).then((value) => print(value));*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(top: 150),
            width: double.infinity,
            child: Visibility(
              visible: workingTime.inSeconds / 20 > 0,
              child: Column(
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.center,
                    widthFactor: .2 * (workingTime.inSeconds / 20).round() > 1 ? 0.9 : .2 * (workingTime.inSeconds / 20).round(),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Strike x ' + (workingTime.inSeconds / 20).round().toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  TweenAnimationBuilder<Duration>(
                      key: UniqueKey(),
                      duration: begin,
                      tween: Tween(begin: begin, end: end),
                      onEnd: () async {
                        endEvent();
                        if (begin.inSeconds == 20) {
                          if ((workingTime.inSeconds / 20).round() > 3) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PopOnFire())).then((value) => setState(() {}));
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PopWorking())).then((value) => setState(() {}));
                          }
                        } else if (begin.inSeconds > 20) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PopOnFire())).then((value) => setState(() {}));
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PopBreak())).then((value) => setState(() {}));
                        }
                      },
                      builder: (BuildContext context, Duration value, Widget child) {
                        final minutes = value.inMinutes;
                        final seconds = value.inSeconds % 60;
                        return Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text('$minutes:$seconds', textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                            IconButton(
                              onPressed: () {
                                if (clock_running) {
                                  setState(() {
                                    end = Duration(seconds: value.inSeconds);
                                    pauseColor = Colors.deepPurpleAccent;
                                    pauseIcon = Icon(Icons.play_arrow);
                                  });
                                  begin = Duration(seconds: value.inSeconds);
                                  clock_running = false;
                                } else {
                                  setState(() {
                                    end = Duration.zero;
                                    pauseColor = Colors.black;
                                    pauseIcon = Icon(Icons.pause);
                                  });
                                  clock_running = true;
                                }
                              },
                              icon: pauseIcon,
                              color: pauseColor,
                            )
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
          Container(
              child: RiveAnimation.network(
            'https://public.rive.app/community/runtime-files/451-838-flame-loading-bar.riv',
            animations: ['Flame preview'],
          )),
        ]));
  }
}
