// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAtQ87gdQ20vtib0I8-zx55HTWC4t85Jn4',
    appId: '1:1070017514685:web:1322d9e132024aa6be7bd4',
    messagingSenderId: '1070017514685',
    projectId: 'chat-app-bce9a',
    authDomain: 'chat-app-bce9a.firebaseapp.com',
    storageBucket: 'chat-app-bce9a.appspot.com',
    measurementId: 'G-338QSPBRR5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv1A6o_8Ladwh2bn5G6sYQThjqZnwsalI',
    appId: '1:1070017514685:android:9c6b1df1b307d037be7bd4',
    messagingSenderId: '1070017514685',
    projectId: 'chat-app-bce9a',
    storageBucket: 'chat-app-bce9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgLv55B0e2j-O68NbdRfFI_HmOL1zIh3M',
    appId: '1:1070017514685:ios:2523df6e9aca8c8abe7bd4',
    messagingSenderId: '1070017514685',
    projectId: 'chat-app-bce9a',
    storageBucket: 'chat-app-bce9a.appspot.com',
    iosClientId: '1070017514685-8n7f4psq95vcb6tmqvik64leu6ce4qh0.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgLv55B0e2j-O68NbdRfFI_HmOL1zIh3M',
    appId: '1:1070017514685:ios:8fdfe163b22742a2be7bd4',
    messagingSenderId: '1070017514685',
    projectId: 'chat-app-bce9a',
    storageBucket: 'chat-app-bce9a.appspot.com',
    iosClientId: '1070017514685-45mekjm9fa2c6o4st23nsvel0uff7lv1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
