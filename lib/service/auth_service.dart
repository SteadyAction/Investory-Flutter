import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();
  static final instance = AuthService._();

  String? get userId { return currentUser?.uid; }

  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }

  bool get isSignedIn {
    return currentUser != null;
  }

  bool get isGuest {
    return currentUser?.isAnonymous ?? true;
  }

  Future<void> anonymouslySignIn() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> deleteAccount() async {
    await FirebaseAuth.instance.currentUser?.delete();
  }

  Future<String?> getIdToken() async {
    return FirebaseAuth.instance.currentUser?.getIdToken();
  }
}