class UserEntity {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;

  UserEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
}
