// class UserEntity {
//   final String? id;
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   final String email;
//   final String password;

//   UserEntity({
//     this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phoneNumber,
//     required this.email,
//     required this.password,
//   });
// }

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  @override
  List<Object?> get props =>
      [id, firstName, lastName, phoneNumber, email, password];

  const UserEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        firstName: json["fname"],
        lastName: json["lname"],
        phoneNumber: json["phone"],
        email: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": firstName,
        "lname": lastName,
        "phone": phoneNumber,
        "username": email,
        "password": password,
      };
}
