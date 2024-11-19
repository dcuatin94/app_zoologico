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
    apiKey: 'AIzaSyDEc-vOwvl4yeu090cMSNky1jHCa8mWcnw',
    appId: '1:952462237457:web:f43ae3d66f6c10a67176b0',
    messagingSenderId: '952462237457',
    projectId: 'loginzoo-6e1ec',
    authDomain: 'loginzoo-6e1ec.firebaseapp.com',
    storageBucket: 'loginzoo-6e1ec.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcsFHyD8F50nmt9tXMBsFPFUvh1JWuif4',
    appId: '1:952462237457:android:c35e9369dbc7d9427176b0',
    messagingSenderId: '952462237457',
    projectId: 'loginzoo-6e1ec',
    storageBucket: 'loginzoo-6e1ec.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIQVoSp5FgQjDuog1D42LRfg2AW3SZVCU',
    appId: '1:952462237457:ios:00e25e4f4fb3ed0a7176b0',
    messagingSenderId: '952462237457',
    projectId: 'loginzoo-6e1ec',
    storageBucket: 'loginzoo-6e1ec.firebasestorage.app',
    iosBundleId: 'com.example.appZoologico',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIQVoSp5FgQjDuog1D42LRfg2AW3SZVCU',
    appId: '1:952462237457:ios:00e25e4f4fb3ed0a7176b0',
    messagingSenderId: '952462237457',
    projectId: 'loginzoo-6e1ec',
    storageBucket: 'loginzoo-6e1ec.firebasestorage.app',
    iosBundleId: 'com.example.appZoologico',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEc-vOwvl4yeu090cMSNky1jHCa8mWcnw',
    appId: '1:952462237457:web:9c436925d3cbe9237176b0',
    messagingSenderId: '952462237457',
    projectId: 'loginzoo-6e1ec',
    authDomain: 'loginzoo-6e1ec.firebaseapp.com',
    storageBucket: 'loginzoo-6e1ec.firebasestorage.app',
  );
}
