import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Observables for user information
  Rx<GoogleSignInAccount?> currentUser = Rx<GoogleSignInAccount?>(null);
  RxBool isLoading = false.obs;

  // Method to handle Google Sign-In
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true; // Set loading to true
      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user != null) {
        currentUser.value = user;

        // Print user details in the console
        print('Name: ${user.displayName}');
        print('Email: ${user.email}');
        print('Profile Picture URL: ${user.photoUrl}');
      }
    } catch (error) {
      print("Google Sign-In failed: $error");
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  // Method to sign out
  Future<void> signOutFromGoogle() async {
    try {
      await _googleSignIn.signOut();
      currentUser.value = null;
      print("User signed out successfully.");
    } catch (error) {
      print("Error signing out: $error");
    }
  }
}