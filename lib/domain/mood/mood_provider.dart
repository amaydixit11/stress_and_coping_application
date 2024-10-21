import 'package:cloud_firestore/cloud_firestore.dart';
import 'mood_model.dart';

class MoodProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to save mood to Firestore with userID
  Future<void> saveMood(String userID, int index) async {
    try {
      // Create a Mood instance
      Mood mood = Mood(
        index: index,
        timestamp: Timestamp.now(), // Use current timestamp
      );

      // Add mood to Firestore collection under the specific userID
      await _firestore
          .collection('users')
          .doc(userID)
          .collection('moods')
          .add(mood.toMap());

      print('Mood saved: $index at ${mood.timestamp}');
    } catch (error) {
      print('Error saving mood: $error'); // Handle any errors
    }
  }
}
