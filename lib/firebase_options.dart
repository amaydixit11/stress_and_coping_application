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
    apiKey: 'AIzaSyDcPMiTXf0G3JHg2mzORFk3zYUUgabAHnw',
    appId: '1:228340934484:web:685aa68a10fba7cf594ac1',
    messagingSenderId: '228340934484',
    projectId: 'stress-and-coping-application',
    authDomain: 'stress-and-coping-application.firebaseapp.com',
    storageBucket: 'stress-and-coping-application.appspot.com',
    measurementId: 'G-7C5WXW7PDG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBo-ykwUYACOmvdcfpbChtRkxTVgD609Es',
    appId: '1:228340934484:android:44658e024625bba0594ac1',
    messagingSenderId: '228340934484',
    projectId: 'stress-and-coping-application',
    storageBucket: 'stress-and-coping-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpHRADzbkr8jiW3ygHyusuoTXbZcMVYhU',
    appId: '1:228340934484:ios:a194691e3c7598b5594ac1',
    messagingSenderId: '228340934484',
    projectId: 'stress-and-coping-application',
    storageBucket: 'stress-and-coping-application.appspot.com',
    iosClientId:
        '228340934484-35sftlo8i9jjvbkqol9cm2ugnjrl5qi7.apps.googleusercontent.com',
    iosBundleId: 'com.example.stressAndCopingApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpHRADzbkr8jiW3ygHyusuoTXbZcMVYhU',
    appId: '1:228340934484:ios:a194691e3c7598b5594ac1',
    messagingSenderId: '228340934484',
    projectId: 'stress-and-coping-application',
    storageBucket: 'stress-and-coping-application.appspot.com',
    iosClientId:
        '228340934484-35sftlo8i9jjvbkqol9cm2ugnjrl5qi7.apps.googleusercontent.com',
    iosBundleId: 'com.example.stressAndCopingApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDcPMiTXf0G3JHg2mzORFk3zYUUgabAHnw',
    appId: '1:228340934484:web:61b58f7d650b658b594ac1',
    messagingSenderId: '228340934484',
    projectId: 'stress-and-coping-application',
    authDomain: 'stress-and-coping-application.firebaseapp.com',
    storageBucket: 'stress-and-coping-application.appspot.com',
    measurementId: 'G-3DB85T626S',
  );
}