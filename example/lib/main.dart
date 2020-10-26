import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:apple_user_token/apple_user_token.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userToken = 'Unknown';

  @override
  void initState() {
    super.initState();
    initAppleMusicUserToken();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initAppleMusicUserToken() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AppleUserToken.userToken("<DEVELOPER TOKEN>");
    } on PlatformException catch (error) {
      platformVersion = error.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _userToken = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('User Token: $_userToken\n'),
        ),
      ),
    );
  }
}
