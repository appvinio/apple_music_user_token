
import 'dart:async';

import 'package:flutter/services.dart';

class AppleUserToken {
  static const MethodChannel _channel =
      const MethodChannel('apple_user_token');

  static Future<String> userToken(String developerToken) async {
    final String token = await _channel.invokeMethod('getAppleMusicUserToken', developerToken);
    return token;
  }
}
