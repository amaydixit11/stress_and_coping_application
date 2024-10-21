import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Handle Google Sign-in to authenticate user
  Future<User?> googleSignInProcess() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // This token can be used to authenticate with Firebase
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user; // Return the user if successfully signed in
    } catch (error) {
      print('Google Sign-In error: $error'); // Handle any errors during sign-in
      return null; // Return null if sign-in fails
    }
  }

  /// Check if the user is already signed in through Google
  Future<bool> alreadySignIn() async {
    try {
      return _auth.currentUser != null; // Check if the current user is not null
    } catch (error) {
      print('Check signed-in status error: $error');
      return false; // Return false if there was an error
    }
  }

  /// Sign out from the application if the user is signed in through Google
  Future<void> googleSignOutProcess() async {
    try {
      await _googleSignIn.signOut(); // Perform sign out
      await _auth.signOut(); // Sign out from Firebase
      print('User signed out');
    } catch (error) {
      print(
        'Google Sign-Out error: $error',
      ); // Handle any errors during sign-out
    }
  }
}
