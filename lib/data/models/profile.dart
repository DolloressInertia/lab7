// lib/data/models/profile.dart

import 'package:json_annotation/json_annotation.dart';

// The 'part' directive tells the compiler that the definition for this class
// is split, and the rest (the serialization logic) will be in profile.g.dart.
part 'profile.g.dart';

// The @JsonSerializable() annotation is key. It tells the build_runner
// tool to generate the serialization methods for this class.
@JsonSerializable()
class Profile {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Standard constructor
  Profile({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory method to deserialize (convert JSON Map -> Profile object)
  // This calls the generated function: _$ProfileFromJson
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  // Method to serialize (convert Profile object -> JSON Map)
  // This calls the generated function: _$ProfileToJson
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
