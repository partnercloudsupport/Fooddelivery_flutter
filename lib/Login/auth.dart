import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImpl {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password,String name);

  Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();
}

class Auth implements AuthImpl {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print(user.uid);
    return user.uid;
  }

  Future<String> signUp(String email, String password,String name) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user.uid);
    return user.uid;
  }

 /* update(String displayName,String email,String uuid) {
  Firestore.instance.collection('users').document().setData({
  'name': displayName,
  'uid': uuid,
  'email': email,
  'isEmailVerified': false, // will also be false
   });
  }*/

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
