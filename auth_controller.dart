import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  static FirebaseAuth firebase = FirebaseAuth.instance;

  static var userStream;

  static Future<User> register(String email, String password) async {
    try {
      UserCredential userCredential = await firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> login(String email, String password) async {
    try {
      UserCredential userCredential = await firebase.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<void> logout() async {
    firebase.signOut();
  }

  static Stream<User> get ustream => firebase.authStateChanges();
}
