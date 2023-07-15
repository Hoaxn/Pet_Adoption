import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';

part 'auth_api_model.g.dart';

final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return AuthApiModel(
    firstName: '',
    lastName: '',
    phoneNumber: '',
    email: '',
    password: '',
  );
});

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? password;

  AuthApiModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // convert AuthApiModel to AuthEntity
  UserEntity toEntity() => UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password ?? '',
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<AuthApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel(id: $id, firstName: $firstName, lastName: $lastName, phone: $phoneNumber, email: $email, password: $password)';
  }
}
