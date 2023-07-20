class AdoptionFormEntity {
  final String? petId;
  final String fullName;
  final String email;
  final String address;
  final String phone;

  const AdoptionFormEntity({
    this.petId,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phone,
  });
}
