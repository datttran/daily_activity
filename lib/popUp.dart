import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import 'globals.dart';

class PopWorking extends StatefulWidget {
  @override
  _PopState createState() => _PopState();
}

class _PopState extends State<PopWorking> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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

                      totalWorkingTimeDaily = totalWorkingTimeDaily + workingTime;

                      workingTime = Duration(seconds: 0);
                      totalBreakingTimeDaily = totalBreakingTimeDaily + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('Break', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FlutterRingtonePlayer.stop();

                      Navigator.pop(context);
                      begin = Duration(seconds: 20);
                      strike = strike + 1;
                      workingTime = workingTime + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('Sprint', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class PopBreak extends StatefulWidget {
  @override
  _PopBState createState() => _PopBState();
}

class _PopBState extends State<PopBreak> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.white,
              width: double.infinity,
              child: Center(child: Text('Time to get back to work!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FlutterRingtonePlayer.stop();

                      Navigator.pop(context);
                      begin = Duration(seconds: 20);
                      workingTime = workingTime + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('Sprint', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      fastTime = fastTime + 1;
                      print(strike);

                      FlutterRingtonePlayer.stop();

                      Navigator.pop(context);
                      begin = Duration(seconds: 20) * fastTime;
                      workingTime = workingTime + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('Faster!!!', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class PopOnFire extends StatefulWidget {
  @override
  _PopFState createState() => _PopFState();
}

class _PopFState extends State<PopOnFire> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              color: Colors.white,
              width: double.infinity,
              child: Center(child: Text("You're on Fire!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FlutterRingtonePlayer.stop();

                      Navigator.pop(context);
                      begin = Duration(seconds: 5);
                      totalWorkingTimeDaily = totalWorkingTimeDaily + workingTime;

                      workingTime = Duration(seconds: 0);
                      totalBreakingTimeDaily = totalBreakingTimeDaily + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('Break', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      fastTime = fastTime + 1;
                      print(strike);

                      FlutterRingtonePlayer.stop();

                      Navigator.pop(context);
                      begin = Duration(seconds: 20) * fastTime;
                      workingTime = workingTime + begin;
                    },
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: Center(child: Text('More!!!', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 30))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
