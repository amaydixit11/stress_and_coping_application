import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Handle Google Sign-in to authenticate user
  Future<GoogleSignInAccount?> googleSignInProcess() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      return googleUser; // Return the user if successfully signed in
    } catch (error) {
      print('Google Sign-In error: $error'); // Handle any errors during sign-in
      return null; // Return null if sign-in fails
    }
  }

  /// Check if the user is already signed in through Google
  Future<bool> alreadySignIn() async {
    try {
      bool isSignedIn = await _googleSignIn.isSignedIn();
      return isSignedIn; // Return true if the user is already signed in
    } catch (error) {
      print('Check signed-in status error: $error');
      return false; // Return false if there was an error
    }
  }

  /// Sign out from the application if the user is signed in through Google
  Future<void> googleSignOutProcess() async {
    try {
      await _googleSignIn.signOut(); // Perform sign out
      print('User signed out');
    } catch (error) {
      print(
          'Google Sign-Out error: $error'); // Handle any errors during sign-out
    }
  }
}
