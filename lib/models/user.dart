import 'gender.dart';
import 'user_level.dart';
import 'weight.dart';
import 'height.dart';

class User {
  final String fullName;
  final String? nickname;
  final String? email;
  final String? mobileNumber;
  final String password;
  final Gender? gender;
  final int? age;
  final Weight? weight;
  final Height? height;
  final String? goal;
  final UserLevel? userLevel;

  const User({
    required this.fullName,
    required this.password,
    this.nickname,
    this.email,
    this.mobileNumber,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.goal,
    this.userLevel,
  });

  User copyWith({
    String? fullName,
    String? nickname,
    String? email,
    String? mobileNumber,
    String? password,
    Gender? gender,
    int? age,
    Weight? weight,
    Height? height,
    String? goal,
    UserLevel? userLevel,
  }) {
    return User(
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      goal: goal ?? this.goal,
      userLevel: userLevel ?? this.userLevel,
    );
  }

}
