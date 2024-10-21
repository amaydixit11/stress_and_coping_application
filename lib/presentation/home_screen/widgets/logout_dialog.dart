import 'package:flutter/material.dart';
import 'package:stress_and_coping_application/domain/googleauth/google_auth_helper.dart';
import 'package:stress_and_coping_application/presentation/on_boarding_one_screen/on_boarding_one_screen.dart';

class LogoutDialog extends StatefulWidget {
  final String? userPhoto;
  final String? userID;
  final String? userName;

  const LogoutDialog({
    super.key,
    this.userPhoto,
    this.userID,
    this.userName,
  });

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return AlertDialog(
      backgroundColor: const Color(0xFF1C1C1C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding:
          EdgeInsets.symmetric(vertical: 20, horizontal: screenWidth * 0.05),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.09,
            backgroundImage: NetworkImage(
                widget.userPhoto ?? 'https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 15),
          Text(
            widget.userName ?? "Guest",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.userID ?? "Guest",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.grey[700], thickness: 0.6),
          const SizedBox(height: 10),
          Text(
            "Are you sure you want to log out?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              onPressed: () async {
                try {
                  await GoogleAuthHelper()
                      .googleSignOutProcess(); // Await the logout process
                  Navigator.of(context).pop(); // Close the dialog after logout
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logged Out")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnBoardingOneScreen(),
                    ),
                  ); // Close the dialog after logout
                } catch (e) {
                  print(
                      "Logout error: $e"); // Log any errors that occur during logout
                  // Optionally show an error message to the user
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Logout failed. Please try again.")),
                  );
                }
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
