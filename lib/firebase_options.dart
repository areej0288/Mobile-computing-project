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
    apiKey: 'AIzaSyCMC5nDw8QqachngwsxormaehsTy5O7Y4M',
    appId: '1:14556310002:web:d916b2960e1ac19acf236b',
    messagingSenderId: '14556310002',
    projectId: 'fitnestx-d475c',
    authDomain: 'fitnestx-d475c.firebaseapp.com',
    storageBucket: 'fitnestx-d475c.firebasestorage.app',
    measurementId: 'G-YW7KQ357BM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6DdsSQ-HkVNmj-aTTuKMazfJwxg-xPps',
    appId: '1:14556310002:android:da45c0effef1b790cf236b',
    messagingSenderId: '14556310002',
    projectId: 'fitnestx-d475c',
    storageBucket: 'fitnestx-d475c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRqA_VJQ00Y8ZFiach91-bGkbMSZ5l-U4',
    appId: '1:14556310002:ios:4921bb7c0b4b74aecf236b',
    messagingSenderId: '14556310002',
    projectId: 'fitnestx-d475c',
    storageBucket: 'fitnestx-d475c.firebasestorage.app',
    iosClientId:
        '14556310002-he66vr379rn8tccdhfivoa3h6u18pcds.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnestx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRqA_VJQ00Y8ZFiach91-bGkbMSZ5l-U4',
    appId: '1:14556310002:ios:4921bb7c0b4b74aecf236b',
    messagingSenderId: '14556310002',
    projectId: 'fitnestx-d475c',
    storageBucket: 'fitnestx-d475c.firebasestorage.app',
    iosClientId:
        '14556310002-he66vr379rn8tccdhfivoa3h6u18pcds.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnestx',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMC5nDw8QqachngwsxormaehsTy5O7Y4M',
    appId: '1:14556310002:web:d1174d693727cb6acf236b',
    messagingSenderId: '14556310002',
    projectId: 'fitnestx-d475c',
    authDomain: 'fitnestx-d475c.firebaseapp.com',
    storageBucket: 'fitnestx-d475c.firebasestorage.app',
    measurementId: 'G-5DBHPM92ZZ',
  );
}
