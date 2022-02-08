import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'dart:async';

class ClockTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClockTimerState();
  }
}

class _ClockTimerState extends State<ClockTimer> {
  /// 初期値
  var _timeString = '00:00.00';

  /// 開始時間
  late DateTime _startTime;

  /// ローカルタイマー
  var _timer;
  var _isStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 190,
          ),
          Center(
            child: Text(_timeString,
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.w300)),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (_isStart)
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'ラップ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // primary: Color.fromRGBO(0, 0, 0, 0.8),
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'ラップ',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 0, 0, 0.8),
                      onPrimary: Colors.grey,
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
              Row(
                children: [
                  Text(
                    "●",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "●",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              if (_isStart)
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: _startTimer,
                    child: Text(
                      '停止',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(123, 5, 5, .7),
                      onPrimary: Colors.red,
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: _startTimer,
                    child: Text(
                      '開始',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(47, 108, 48, .7),
                      onPrimary: Colors.lightGreen,
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.green,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _isStart = !_isStart;
      if (_isStart) {
        _startTime = DateTime.now();
        _timer = Timer.periodic(Duration(milliseconds: 1), _onTimer);
      } else {
        _timer.cancel();
      }
    });
  }

  void _onTimer(Timer timer) {
    /// 現在時刻を取得
    var now = DateTime.now();

    /// 開始時刻と比較して差分を取得
    var diff = now.difference(_startTime).inSeconds;
    var milli = now.difference(_startTime).inMilliseconds;

    /// タイマーのロジック
    var mod = diff % (60 * 60);
    var minutes = (mod / 60).floor();
    var second = mod % 60;
    var millisecond = ((milli % 1000) / 10).floor();

    setState(() => {
          _timeString =
              """${_convertTwoDigits(minutes)}:${_convertTwoDigits(second)}.${_convertTwoDigits(millisecond) }"""
        });
  }

  String _convertTwoDigits(int number) {
    return number >= 10 ? "$number" : "0$number";
  }
}
