/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth_Service {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlesignin = GoogleSignIn();

  void googlesignin() async {
    final GoogleSignInAccount googleuser = await _googlesignin.signIn();
    final GoogleSignInAuthentication authentication =
        await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );
    final User user =
        (await _firebaseAuth.signInWithCredential(credential).then((value) {
      print(value);
    }));
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> googleSignIn() async {
    // Sign in with Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Check if the user is null (canceled sign in)
    if (googleUser == null) {
      return null; // Sign in was aborted or failed
    }

    // Get authentication details from the sign-in
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create credential for Firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the credential
    final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

    // Return the signed-in user
    return userCredential.user;
  }
}
