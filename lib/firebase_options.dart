// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDxeA5HYaMU1WxSP78vK3rOZrWMokllUn0',
    appId: '1:1019211197455:web:03caa6678b5720fc3f477a',
    messagingSenderId: '1019211197455',
    projectId: 'todo-application10',
    authDomain: 'todo-application10.firebaseapp.com',
    storageBucket: 'todo-application10.appspot.com',
    measurementId: 'G-46D6N53VRX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByroqwWMX646KQv5SR6SBzi5oX6kNbtCQ',
    appId: '1:1019211197455:android:8168281f1cf9d5293f477a',
    messagingSenderId: '1019211197455',
    projectId: 'todo-application10',
    storageBucket: 'todo-application10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBETyrDw10IcsvBQqGAnFOQpUc-Iz5fq0w',
    appId: '1:1019211197455:ios:7a27f27daa81cc6c3f477a',
    messagingSenderId: '1019211197455',
    projectId: 'todo-application10',
    storageBucket: 'todo-application10.appspot.com',
    iosBundleId: 'com.example.todoApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBETyrDw10IcsvBQqGAnFOQpUc-Iz5fq0w',
    appId: '1:1019211197455:ios:7a27f27daa81cc6c3f477a',
    messagingSenderId: '1019211197455',
    projectId: 'todo-application10',
    storageBucket: 'todo-application10.appspot.com',
    iosBundleId: 'com.example.todoApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxeA5HYaMU1WxSP78vK3rOZrWMokllUn0',
    appId: '1:1019211197455:web:cc423e3c6bc5df693f477a',
    messagingSenderId: '1019211197455',
    projectId: 'todo-application10',
    authDomain: 'todo-application10.firebaseapp.com',
    storageBucket: 'todo-application10.appspot.com',
    measurementId: 'G-TS12NLNTS0',
  );
}
