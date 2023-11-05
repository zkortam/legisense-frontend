import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyApu5qeU3ygNYsvVve282JklOiYl3osM44",
            authDomain: "legisenseappofficial.firebaseapp.com",
            projectId: "legisenseappofficial",
            storageBucket: "legisenseappofficial.appspot.com",
            messagingSenderId: "255140374343",
            appId: "1:255140374343:web:284ce2aa59a30dcf29ce62"));
  } else {
    await Firebase.initializeApp();
  }
}
