import 'package:dating_app/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Rx<GoogleSignInAccount?> currentUser = Rx<GoogleSignInAccount?>(null);
  RxBool isLoading = false.obs;

  // Sign-In method
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      isLoading.value = true; // Set loading to true
      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user != null) {
        currentUser.value = user;

        // Show an alert dialog with user details
        _showUserDetailsDialog(context, user);
      }
    } catch (error) {
      print("Google Sign-In failed: $error");
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  // Show user details in an alert dialog
  void _showUserDetailsDialog(BuildContext context, GoogleSignInAccount user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: const Text("Google Sign-In Successful"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl ?? ''),
                radius: 30,
              ),
              const SizedBox(height: 10),
              Text('${user.displayName}'),
              const SizedBox(height: 10),
              Text('${user.email}'),
              const SizedBox(height: 10),
              Text('${user.id}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Sign-out method
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