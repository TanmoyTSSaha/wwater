import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wwater/services/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFireBaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBaseUser(user!));
  }

//Codes for Signing in Anonymously
  Future SignInAnon() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      User user = userCredential.user!;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Codes for Logging out.
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
