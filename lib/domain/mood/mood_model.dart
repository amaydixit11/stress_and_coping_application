import 'package:cloud_firestore/cloud_firestore.dart';

class Mood {
  final int index; // Mood index (e.g., 0 for crying, 1 for sad, etc.)
  final Timestamp timestamp; // Timestamp for when the mood was recorded

  Mood({
    required this.index,
    required this.timestamp,
  });

  // Method to convert the Mood instance to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'timestamp': timestamp,
    };
  }

  // Factory method to create a Mood instance from a map (if needed)
  factory Mood.fromMap(Map<String, dynamic> map) {
    return Mood(
      index: map['index'] as int,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}
