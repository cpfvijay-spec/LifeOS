import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String? height;
  final String? weight;
  final int? age;
  final String? gender;
  final List<String>? fitnessGoals;
  final bool isDarkMode;
  final String language;
  final String unit;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.height,
    this.weight,
    this.age,
    this.gender,
    this.fitnessGoals,
    this.isDarkMode = false,
    this.language = 'en',
    this.unit = 'metric',
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      photoUrl: data['photoUrl'],
      height: data['height'],
      weight: data['weight'],
      age: data['age'],
      gender: data['gender'],
      fitnessGoals: List<String>.from(data['fitnessGoals'] ?? []),
      isDarkMode: data['isDarkMode'] ?? false,
      language: data['language'] ?? 'en',
      unit: data['unit'] ?? 'metric',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
      'fitnessGoals': fitnessGoals,
      'isDarkMode': isDarkMode,
      'language': language,
      'unit': unit,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    String? height,
    String? weight,
    int? age,
    String? gender,
    List<String>? fitnessGoals,
    bool? isDarkMode,
    String? language,
    String? unit,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      fitnessGoals: fitnessGoals ?? this.fitnessGoals,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
      unit: unit ?? this.unit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
