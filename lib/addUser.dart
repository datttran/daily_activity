import 'dart:ui';

import 'package:daily_activity/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height * 9,
          ),
          Container(
            height: height * 85,
            width: width * 93.5,
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    width: width * 70,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              readOnly: true,
                              onTap: () {},
                              style: TextStyle(color: Color(0xffc5c5cb)),
                              //keyboardType: TextInputType.number,
                              onChanged: (value) {
                                //Do something with the user input.
                              },
                              decoration: InputDecoration(
                                hintText: 'Location',
                                hintStyle: TextStyle(color: Colors.white70.withOpacity(.2)),
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff8091ff), width: .5),
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff4d5cde), width: 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                ),
                              ),
                            ),
                            //loginBoxes[shareValue],
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
