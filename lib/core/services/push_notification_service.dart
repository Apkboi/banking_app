import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class PushNotificationService {
  PushNotificationService._();

 static  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future<void> initialize() async {


      _fcm.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true);

    if (!kIsWeb) {
      // channel = const AndroidNotificationChannel(
      //     'high_importance_channel', // id
      //     'High Importance Notifications', // title
      //     description:
      //         'This channel is used for important notifications.', // description
      //     importance: Importance.high,
      //     playSound: true);

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      // await flutterLocalNotificationsPlugin
      //     .resolvePlatformSpecificImplementation<
      //     AndroidFlutterLocalNotificationsPlugin>()
      //     ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    log((await getDeviceToken()).toString());

    FirebaseMessaging.onMessage.listen((event) {

      log(' message received ${event.data.toString()}');

    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(' In app message received');
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {

        // log('A new getInitialMessage event was published!: ${message.data}');
        // DeepLinkData? payloadNotification = _decodeNotificationData(message);
        // // FlutterToast.showToast(msg: '$payloadNotification');
        // if (payloadNotification != null) {
        //   injector<DeepLinkCubit>().saveRecentNotification(payloadNotification);
        //   // DeeplinkAnalyticEvents()
        //     .appOpenedFromPushNotification(type: payloadNotification.type??'');
        // }
      }
    });
  }
  static Future<String?> getDeviceToken() async {
    return await _fcm.getToken();
  }
}
