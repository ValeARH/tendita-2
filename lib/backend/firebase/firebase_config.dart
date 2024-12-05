import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBEvsrv8Bqm5XMa-SAlYlOrbt6oQ55lG6I",
            authDomain: "nombredeproyecto-d9136.firebaseapp.com",
            projectId: "nombredeproyecto-d9136",
            storageBucket: "nombredeproyecto-d9136.appspot.com",
            messagingSenderId: "943966691829",
            appId: "1:943966691829:web:b48da025eee97a986b40bc"));
  } else {
    await Firebase.initializeApp();
  }
}
