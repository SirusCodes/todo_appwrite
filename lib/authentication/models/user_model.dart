import 'dart:convert';

import 'package:flutter/foundation.dart';

enum UserStatus { unactivated, active, blocked }

// ignore_for_file: sort_constructors_first
@immutable
class UserModel {
  const UserModel({
    required this.name,
    required this.email,
    required this.status,
  });

  final String name;
  final String email;
  final UserStatus status;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      status: UserStatus.values[(map['status'] as num).toInt()],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, email: $email, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.status == status;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ status.hashCode;
}
